#!/usr/bin/env node

/**
 * Enhanced Batch Orchestrator for propose-ticket-resolution Skill
 * 
 * Orchestrates multi-session batch processing by identifying unresolved tickets
 * and preparing runSubagent invocations for each.
 * 
 * Usage:
 *   node orchestrate-batch.js [--all | FHIR-XXXXX]
 */

const fs = require('fs');
const path = require('path');

// Configuration
const CWD = process.cwd();
const JIRA_DIR = fs.existsSync(path.join(CWD, 'jira'))
  ? path.join(CWD, 'jira')
  : CWD;
const RESOLVED_STATUSES = [
  'Applied',
  'Not Persuasive with Modification',
  'Retracted',
  'Not Persuasive',
  'Declined'
];

function getTicketRootDirs() {
  return [
    JIRA_DIR,
    path.join(JIRA_DIR, 'open'),
    path.join(JIRA_DIR, 'closed')
  ].filter(dir => fs.existsSync(dir) && fs.statSync(dir).isDirectory());
}

function findTicketDir(ticketKey) {
  for (const root of getTicketRootDirs()) {
    const ticketDir = path.join(root, ticketKey);
    const ticketFile = path.join(ticketDir, `${ticketKey}.md`);
    if (fs.existsSync(ticketDir) && fs.statSync(ticketDir).isDirectory() && fs.existsSync(ticketFile)) {
      return ticketDir;
    }
  }
  return null;
}

function ticketOutputRelPath(ticketKey, fileName) {
  const ticketDir = findTicketDir(ticketKey);
  if (!ticketDir) return null;
  return path.relative(JIRA_DIR, path.join(ticketDir, fileName));
}

/**
 * Extract Status from Metadata section of ticket
 */
function extractTicketStatus(ticketKey) {
  const ticketDir = findTicketDir(ticketKey);
  const ticketFile = ticketDir ? path.join(ticketDir, `${ticketKey}.md`) : null;
  
  if (!ticketFile || !fs.existsSync(ticketFile)) {
    return null;
  }
  
  const content = fs.readFileSync(ticketFile, 'utf-8');
  
  // Extract everything before the Resolution section to get Metadata
  const beforeResolution = content.split('## Resolution')[0];
  const statusMatch = beforeResolution.match(/^- Status: (.+)$/m);
  
  return statusMatch ? statusMatch[1].trim() : null;
}

/**
 * Check if a ticket is unresolved
 */
function isUnresolved(ticketKey) {
  const status = extractTicketStatus(ticketKey);
  if (!status) return false;
  
  return !RESOLVED_STATUSES.some(s => status.includes(s));
}

/**
 * Scan jira directory for all unresolved tickets
 */
function findUnresolvedTickets() {
  const unresolvedTickets = new Set();

  for (const root of getTicketRootDirs()) {
    const entries = fs.readdirSync(root, { withFileTypes: true });
    entries.forEach(entry => {
      if (entry.isDirectory() && entry.name.match(/^FHIR-\d+$/) && isUnresolved(entry.name)) {
        unresolvedTickets.add(entry.name);
      }
    });
  }

  return Array.from(unresolvedTickets).sort((a, b) => {
    const aNum = parseInt(a.split('-')[1]);
    const bNum = parseInt(b.split('-')[1]);
    return aNum - bNum;
  });
}

/**
 * Check if resolution file already exists
 */
function resolutionExists(ticketKey) {
  const resolutionRel = ticketOutputRelPath(ticketKey, `${ticketKey}-resolution.md`);
  return resolutionRel ? fs.existsSync(path.join(JIRA_DIR, resolutionRel)) : false;
}

/**
 * Main function
 */
async function main() {
  const args = process.argv.slice(2);
  
  if (args.length === 0) {
    console.error('Usage: orchestrate-batch.js [--all | FHIR-XXXXX]');
    process.exit(1);
  }
  
  if (args[0] === '--all') {
    console.log('='.repeat(70));
    console.log('Batch Resolution Orchestrator');
    console.log('='.repeat(70));
    
    // Find unresolved tickets
    console.log('\nScanning for unresolved tickets...');
    const unresolvedTickets = findUnresolvedTickets();
    
    if (unresolvedTickets.length === 0) {
      console.log('✓ No unresolved tickets found.');
      process.exit(0);
    }
    
    console.log(`✓ Found ${unresolvedTickets.length} unresolved tickets\n`);
    
    // Check for existing resolutions
    let newTickets = [];
    let existingTickets = [];
    
    unresolvedTickets.forEach(ticketKey => {
      if (resolutionExists(ticketKey)) {
        existingTickets.push(ticketKey);
      } else {
        newTickets.push(ticketKey);
      }
    });
    
    console.log(`Tickets needing resolution files:  ${newTickets.length}`);
    console.log(`Tickets with existing files:      ${existingTickets.length}`);
    
    // Display invocation plan
    console.log('\n' + '='.repeat(70));
    console.log('Subagent Invocation Plan');
    console.log('='.repeat(70));
    
    newTickets.forEach((ticketKey, idx) => {
      const status = extractTicketStatus(ticketKey);
      const outputRel = ticketOutputRelPath(ticketKey, `${ticketKey}-resolution.md`) || `${ticketKey}/${ticketKey}-resolution.md`;
      console.log(`\n[${idx + 1}/${newTickets.length}] ${ticketKey}`);
      console.log(`  Status: ${status}`);
      console.log(`  Mode: Isolated session (separate Copilot chat)`);
      console.log(`  Output: jira/${outputRel}`);
    });
    
    console.log('\n' + '='.repeat(70));
    console.log('Summary');
    console.log('='.repeat(70));
    console.log(`Total unresolved tickets:      ${unresolvedTickets.length}`);
    console.log(`New resolution files to create: ${newTickets.length}`);
    console.log(`Existing resolution files:     ${existingTickets.length}`);
    console.log('='.repeat(70));
    
    // Output JSON data for programmatic processing
    const orchestrationData = {
      totalUnresolved: unresolvedTickets.length,
      newTickets: newTickets,
      existingTickets: existingTickets,
      invocationPlan: newTickets.map(ticketKey => ({
        ticketKey: ticketKey,
        status: extractTicketStatus(ticketKey),
        outputFile: `jira/${ticketOutputRelPath(ticketKey, `${ticketKey}-resolution.md`) || `${ticketKey}/${ticketKey}-resolution.md`}`
      }))
    };
    
    // Write orchestration data to file for later use
    const planFile = path.join(JIRA_DIR, 'orchestration-plan.json');
    fs.writeFileSync(planFile, JSON.stringify(orchestrationData, null, 2));
    console.log(`\n✓ Orchestration plan saved to: jira/orchestration-plan.json`);
    
  } else {
    // Single ticket
    const ticketKey = args[0];
    const status = extractTicketStatus(ticketKey);
    
    if (!status) {
      console.error(`Error: Ticket ${ticketKey} not found in jira/ directory`);
      process.exit(1);
    }
    
    console.log(`Processing single ticket: ${ticketKey}`);
    console.log(`Status: ${status}`);
    const outputRel = ticketOutputRelPath(ticketKey, `${ticketKey}-resolution.md`) || `${ticketKey}/${ticketKey}-resolution.md`;
    console.log(`Output: jira/${outputRel}`);
    
    if (resolutionExists(ticketKey)) {
      console.log('Note: Resolution file already exists and will be overwritten.');
    }
  }
}

main().catch(err => {
  console.error('Error:', err.message);
  process.exit(1);
});
