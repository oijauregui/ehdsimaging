# Jira Sync from Excel Skill

This skill provides an automated way to synchronize Jira ticket documentation from the Excel export file (`export-*.xlsx`) to individual ticket subdirectories.

## Files

- **SKILL.md** - Main skill documentation with usage instructions
- **scripts/sync-if-newer.sh** - Wrapper script that finds the most recent export file, checks modification times, and conditionally runs the sync
- **../../../jira/sync-jira-tickets.mjs** - The underlying Node.js sync engine (reads Excel, creates/updates markdown files)

## Architecture

The skill uses a layered approach:

1. **Shell Wrapper** (`sync-if-newer.sh`)
   - Finds all files matching `export-*.xlsx` pattern
   - Warns if multiple export files are found
   - Uses the most recent file (by modification time)
   - Checks modification times of Excel file vs. ticket directories
   - Conditionally invokes the sync
   - Reports results

2. **Sync Engine** (`sync-jira-tickets.mjs`)
   - Parses Excel file (export-*.xlsx)
   - Extracts ticket information and comments
   - Generates markdown files for each ticket
   - Creates ticket subdirectories as needed

## Quick Start

From the jira folder:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh
```

With force sync:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh --force
```

## How It Works

1. Searches for all files matching `export-*.xlsx` in the jira folder
2. If multiple files found:
   - Displays warning listing all files
   - Selects the most recent file (by modification time)
3. Reads modification time of the selected Excel file
4. Finds the oldest ticket subdirectory (FHIR-XXXXX/)
5. Compares timestamps:
   - If Excel is newer → runs sync
   - If Excel is older → skips sync (already current)
   - With `--force` → always runs sync
6. Reports synchronization results

## Expected Output Structure

After sync, each ticket gets its own folder and markdown file:

```
jira/
├── export-jira-date-2026-05-07.xlsx
├── export-jira-date-2026-05-06.xlsx
├── export-jira-date-2026-05-05.xlsx
├── sync-jira-tickets.mjs
└── FHIR-51010/
    └── FHIR-51010.md         # Generated from Excel data
└── FHIR-51011/
    └── FHIR-51011.md
└── ...
```

## Markdown File Format

Each generated markdown file contains:

```markdown
# FHIR-51010: Ticket Summary

## Metadata

- Issue Type: Story
- Key: FHIR-51010
- Status: In Progress
- Resolution: Unresolved
- Reporter: John Doe
- Assignee: Jane Smith
- Created: 2026-04-15
- Parent key: FHIR-50000
- Grouping: Feature

## Comments

### Comment 1

- Date: 2026-04-16
- Author: Reviewer A
- Security: Public

Comment text here...

### Comment 2

...
```

## Integration with CI/CD

The skill can be integrated into automated workflows:

```bash
# In a GitHub Actions workflow or similar
- name: Sync Jira Tickets
  run: |
    cd jira
    bash ../.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh
```

## Error Handling

The script handles several error conditions:

- **No export files**: Fails with clear error message if no `export-*.xlsx` files found
- **Multiple export files**: Warns and uses the most recent one
- **Node.js not installed**: Fails with clear error message
- **Sync script errors**: Propagates exit code from sync engine
- **No existing directories**: Creates them on first sync

## Requirements

- Bash shell
- Node.js (for running sync-jira-tickets.mjs)
- `find` command (standard Unix utility)
- `stat` command (standard Unix utility)
- At least one `export-*.xlsx` file in the jira folder

## Notes

- The sync does not delete ticket directories (no prune mode)
- All files are generated in UTF-8 encoding
- The script is idempotent - can be run multiple times safely
- Modification time comparison is platform-aware (Linux/macOS compatible)
- If multiple export files exist, only the most recent is used
- When multiple export files are present, a warning is displayed to help identify and clean up stale files
