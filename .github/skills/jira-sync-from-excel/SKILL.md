---
name: jira-sync-from-excel
description: 'Synchronize Jira ticket subdirectories from the Excel export file (export-*.xlsx) only when the Excel file is newer than the ticket directories. Automatically updates existing tickets and creates new ones. Tickets are organized into open/ (unresolved) and closed/ (resolved) subdirectories. Warns if multiple export files are found. Use when the export-*.xlsx has been updated and you need to refresh the ticket documentation in jira/open/FHIR-* and jira/closed/FHIR-* folders.'
argument-hint: '[--force] optional flag to skip modification time check'
---

# Jira Sync From Excel

Synchronize Jira ticket markdown files from the central Excel export file (`export-*.xlsx`). The script checks if the Excel export is newer than the ticket subdirectories before syncing, ensuring efficient updates only when needed. If multiple export files are found, a warning is displayed and the most recent one is used.

Tickets are automatically organized into subdirectories based on their status:
- **`open/`** - Unresolved tickets (Submitted, Triaged, Waiting for Input, empty status)
- **`closed/`** - Resolved tickets (Applied, Duplicate, Resolved - No Change, Resolved - change required, Deferred)

## When To Use
- After updating or re-exporting the Jira export file (export-*.xlsx).
- To refresh ticket metadata, summaries, and comments across all subdirectories.
- To add documentation for newly exported tickets.
- To keep ticket documentation in sync with the source Excel file.
- To reorganize tickets based on updated status values.

## Procedure
1. From the jira folder, run the sync script:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh
```

2. The script will:
   - Find all files matching `export-*.xlsx` pattern
   - Warn if multiple export files are found and show which one is being used (most recent)
   - Check the modification time of the most recent Excel file
   - Compare it to the oldest ticket subdirectory (checking both open/ and closed/)
   - Skip sync if Excel is not newer (unchanged files)
   - Run sync if Excel is newer (changes detected)

3. Optional: Force sync even if Excel is not newer:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh --force
```

4. Review the output summary showing:
   - Whether multiple Excel files were found (with warning if so)
   - Which Excel file is being used
   - Whether sync was needed (time comparison result)
   - Total number of tickets synced with breakdown by open/closed status
   - Output locations for both open and closed tickets

## What Gets Updated
- **Existing Tickets**: Metadata (status, resolution, assignee, etc.) and comments are updated.
- **New Tickets**: New ticket subdirectories and markdown files are automatically created.
- **Status Changes**: Tickets are automatically moved between open/ and closed/ subdirectories based on status changes.
- **Migration**: Old root-level FHIR-* directories are automatically migrated to the appropriate open/closed subdirectory on first sync.
- **File Content**: Each `FHIR-XXXXX.md` file is regenerated with:
  - Ticket key and summary as the heading
  - Metadata section (Issue Type, Status, Resolution, Reporter, Assignee, Created date, Parent key, Grouping)
  - Comments section with date, author, security level, and comment text

## Ticket Status Classification

### Closed (Resolved) Status Values
- **Applied** - Resolution applied to the implementation
- **Duplicate** - Ticket is a duplicate of another
- **Resolved - No Change** - Resolved but no change was made
- **Resolved - change required** - Resolved with required changes
- **Deferred** - Resolution deferred to later version

### Open (Unresolved) Status Values
- **Submitted** - Ticket submitted and awaiting triage
- **Triaged** - Ticket triaged but not yet under investigation
- **Waiting for Input** - Ticket waiting for additional input
- *(empty/undefined)* - No status assigned yet

## Directory Structure

```
jira/
  open/
    FHIR-XXXXX/
      FHIR-XXXXX.md
    FHIR-YYYYY/
      FHIR-YYYYY.md
  closed/
    FHIR-AAAAA/
      FHIR-AAAAA.md
    FHIR-BBBBB/
      FHIR-BBBBB.md
```

## Notes
- The script finds Excel files matching the pattern `export-*.xlsx` in the jira folder.
- If multiple Excel files are found, a warning is displayed and the most recent file (by modification time) is used.
- The sync does not remove ticket subdirectories (prune mode disabled by default).
- Subdirectories are created in the open/ or closed/ folders as needed (FHIR-XXXXX/).
- Tickets are automatically reorganized between open/ and closed/ directories when their status changes.
- The script requires Node.js with the `xlsx` module (already in package.json dependencies).
- All outputs are UTF-8 encoded markdown files.
- The script maintains backward compatibility by checking for ticket directories at the root level as well.
- **Automatic Migration**: If you have existing ticket directories at the root level (FHIR-XXXXX/), they will be automatically migrated to the appropriate open/ or closed/ subdirectory during the next sync.

## Example Output

### With Single Export File
```
Excel file: /path/to/jira/export-jira-date-2026-05-07.xlsx
Excel modification time: 2026-05-07 14:30:15
Oldest ticket dir time:  2026-05-06 10:22:33
Excel is newer: YES - syncing...

Running: node sync-jira-tickets.mjs --excel export-jira-date-2026-05-07.xlsx --out .
Synced 245 Jira tickets from sheet 'export'.
  - Open (unresolved): 127
  - Closed (resolved): 118
Output directory: /path/to/jira
  - Open tickets: /path/to/jira/open
  - Closed tickets: /path/to/jira/closed
Prune mode: disabled

✓ Jira sync completed successfully
```

### With Multiple Export Files
```
⚠ WARNING: Found 3 Excel files:
  - export-jira-date-2026-05-07.xlsx
  - export-jira-date-2026-05-06.xlsx
  - export-jira-date-2026-05-05.xlsx
  Using most recent: export-jira-date-2026-05-07.xlsx

Excel file: /path/to/jira/export-jira-date-2026-05-07.xlsx
Excel modification time: 2026-05-07 14:30:15
...
```

## Error Handling
- If no `export-*.xlsx` files are found, the script will fail with an error message.
- If Node.js is not installed, the script will fail with an error message.
- Check that you are running the script from within the jira directory or provide the correct path.
