#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import XLSX from "xlsx";

const KEY_PATTERN = /^FHIR-\d+$/i;

function asText(value) {
  if (value === null || value === undefined) {
    return "";
  }
  return String(value).trim();
}

function getArg(name, defaultValue = "") {
  const idx = process.argv.indexOf(name);
  if (idx === -1 || idx + 1 >= process.argv.length) {
    return defaultValue;
  }
  return process.argv[idx + 1];
}

function parseWorkbook(excelPath) {
  const workbook = XLSX.readFile(excelPath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const rows = XLSX.utils.sheet_to_json(sheet, { defval: "", raw: false });

  const tickets = new Map();

  for (let i = 0; i < rows.length; i += 1) {
    const row = rows[i];
    const key = asText(row.Key);

    if (KEY_PATTERN.test(key)) {
      const ticketKey = key.toUpperCase();

      if (!tickets.has(ticketKey)) {
        tickets.set(ticketKey, {
          key: ticketKey,
          issueType: asText(row["Issue Type"]),
          status: asText(row.Status),
          resolution: asText(row.Resolution),
          resolutionDescription: asText(row["Resolution Description"]),
          summary: asText(row.Summary),
          description: asText(row.Description),
          relatedSections: asText(row["Related Section(s)"]),
          relatedArtifacts: asText(row["Related Artifact(s)"]),
          raisedInVersion: asText(row["Raised in Version"]),
          reporter: asText(row.Reporter),
          grouping: asText(row.Grouping),
          assignee: asText(row.Assignee),
          created: asText(row.Created),
          parentKey: asText(row["Parent key"])
        });
      }
    }

  }

  return { tickets, sheetName };
}

function renderTicketMarkdown(ticket) {
  const lines = [];

  lines.push(`# ${ticket.key}: ${ticket.summary || "(no summary)"}`);
  lines.push("");
  
  // Description section
  if (ticket.description) {
    lines.push("## Description");
    lines.push("");
    lines.push(ticket.description);
    lines.push("");
  }
  
  lines.push("## Metadata");
  lines.push("");
  
  // Only render fields that have values
  lines.push(`- Issue Type: ${ticket.issueType || ""}`);
  lines.push(`- Key: ${ticket.key}`);
  lines.push(`- Summary: ${ticket.summary || ""}`);
  lines.push(`- Status: ${ticket.status || ""}`);
  if (ticket.raisedInVersion) {
    lines.push(`- Raised in Version: ${ticket.raisedInVersion}`);
  }
  if (ticket.relatedSections) {
    lines.push(`- Related Sections: ${ticket.relatedSections}`);
  }
  if (ticket.specificationLocation) {
    lines.push(`- Specification Location: ${ticket.specificationLocation}`);
  }
  if (ticket.relatedArtifacts) {
    lines.push(`- Related Artifacts: ${ticket.relatedArtifacts}`);
  }
  if (ticket.reporter) {
    lines.push(`- Reporter: ${ticket.reporter}`);
  }
  if (ticket.assignee) {
    lines.push(`- Assignee: ${ticket.assignee}`);
  }
  if (ticket.created) {
    lines.push(`- Created: ${ticket.created}`);
  }
  lines.push("");
  
  // Resolution section
  lines.push("## Resolution");
  lines.push("");
  lines.push(`- Status: ${ticket.status || ""}`);
  lines.push(`- Resolution: ${ticket.resolution || ""}`);
  if (ticket.resolutionDescription) {
    lines.push("");
    lines.push(ticket.resolutionDescription);
  }
  lines.push("");
  
  // Related tickets section
  if (ticket.parentKey || ticket.grouping) {
    lines.push("## Related");
    lines.push("");
    if (ticket.parentKey) {
      lines.push(`- Parent: ${ticket.parentKey}`);
    }
    if (ticket.grouping) {
      lines.push(`- Grouping: ${ticket.grouping}`);
    }
    lines.push("");
  }

  return lines.join("\n");
}

function ensureDir(dirPath) {
  fs.mkdirSync(dirPath, { recursive: true });
}

function syncTickets({ excelPath, outDir, prune }) {
  const { tickets, sheetName } = parseWorkbook(excelPath);
  ensureDir(outDir);

  const keys = [...tickets.keys()].sort();
  keys.forEach((key) => {
    const ticket = tickets.get(key);
    const ticketDir = path.join(outDir, key);
    ensureDir(ticketDir);

    const markdownPath = path.join(ticketDir, `${key}.md`);
    const content = renderTicketMarkdown(ticket);
    fs.writeFileSync(markdownPath, content, "utf8");
  });

  if (prune) {
    const existing = fs.readdirSync(outDir, { withFileTypes: true });
    const keySet = new Set(keys);
    existing.forEach((entry) => {
      if (!entry.isDirectory()) {
        return;
      }
      if (!KEY_PATTERN.test(entry.name)) {
        return;
      }
      const normalized = entry.name.toUpperCase();
      if (!keySet.has(normalized)) {
        fs.rmSync(path.join(outDir, entry.name), { recursive: true, force: true });
      }
    });
  }

  return { count: keys.length, sheetName };
}

function main() {
  const excelArg = getArg("--excel");
  const outArg = getArg("--out");
  const prune = process.argv.includes("--prune");

  const cwd = process.cwd();
  const excelPath = path.resolve(cwd, excelArg || "export.xlsx");
  const outDir = path.resolve(cwd, outArg || ".");

  if (!fs.existsSync(excelPath)) {
    throw new Error(`Excel file not found: ${excelPath}`);
  }

  const { count, sheetName } = syncTickets({ excelPath, outDir, prune });
  console.log(`Synced ${count} Jira tickets from sheet '${sheetName}'.`);
  console.log(`Output directory: ${outDir}`);
  console.log(`Prune mode: ${prune ? "enabled" : "disabled"}`);
}

main();
