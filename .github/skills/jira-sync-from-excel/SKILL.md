---
name: jira-sync-from-excel
description: 'Synchronize Jira ticket subdirectories from the Excel export file (export-*.xlsx) only when the Excel file is newer than the ticket directories. Automatically updates existing tickets and creates new ones. Warns if multiple export files are found. Use when the export-*.xlsx has been updated and you need to refresh the ticket documentation in jira/FHIR-* folders.'
argument-hint: '[--force] optional flag to skip modification time check'
---

# Jira Sync From Excel

Synchronize Jira ticket markdown files from the central Excel export file (`export-*.xlsx`). The script checks if the Excel export is newer than the ticket subdirectories before syncing, ensuring efficient updates only when needed. If multiple export files are found, a warning is displayed and the most recent one is used.

## When To Use
- After updating or re-exporting the Jira export file (export-*.xlsx).
- To refresh ticket metadata, summaries, and comments across all subdirectories.
- To add documentation for newly exported tickets.
- To keep ticket documentation in sync with the source Excel file.

## Procedure
1. From the jira folder, run the sync script:

```bash
bash ./.github/skills/jira-sync-from-excel/scripts/sync-if-newer.sh
```

2. The script will:
   - Find all files matching `export-*.xlsx` pattern
   - Warn if multiple export files are found and show which one is being used (most recent)
   - Check the modification time of the most recent Excel file
   - Compare it to the oldest ticket subdirectory
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
   - Total number of tickets synced
   - Output location and sheet name

## What Gets Updated
- **Existing Tickets**: Metadata (status, resolution, assignee, etc.) and comments are updated.
- **New Tickets**: New ticket subdirectories and markdown files are automatically created.
- **File Content**: Each `FHIR-XXXXX.md` file is regenerated with:
  - Ticket key and summary as the heading
  - Metadata section (Issue Type, Status, Resolution, Reporter, Assignee, Created date, Parent key, Grouping)
  - Comments section with date, author, security level, and comment text

## Notes
- The script finds Excel files matching the pattern `export-*.xlsx` in the jira folder.
- If multiple Excel files are found, a warning is displayed and the most recent file (by modification time) is used.
- The sync does not remove ticket subdirectories (prune mode disabled).
- Subdirectories are created in the jira folder as needed (FHIR-XXXXX/).
- The script requires Node.js with the `xlsx` module (already in package.json dependencies).
- All outputs are UTF-8 encoded markdown files.

## Example Output

### With Single Export File
```
Excel file: /path/to/jira/export-jira-date-2026-05-07.xlsx
Excel modification time: 2026-05-07 14:30:15
Oldest ticket dir time:  2026-05-06 10:22:33
Excel is newer: YES - syncing...
Synced 245 Jira tickets from sheet 'export'.
Output directory: /path/to/jira
Prune mode: disabled
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
