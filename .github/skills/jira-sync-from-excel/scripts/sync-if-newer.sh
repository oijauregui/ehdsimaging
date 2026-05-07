#!/bin/bash
# Jira Sync from Excel - Conditional Sync Script
# Checks if export-*.xlsx is newer than ticket subdirectories before syncing
# Usage: bash sync-if-newer.sh [--force]

set -e

# Get directory paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JIRA_DIR="$(cd "$SCRIPT_DIR/../../../../jira" && pwd)"
FORCE_SYNC=false

# Parse arguments
for arg in "$@"; do
    if [[ "$arg" == "--force" ]]; then
        FORCE_SYNC=true
    fi
done

# Find Excel files matching export-*.xlsx pattern
EXCEL_FILES=()
if [[ -d "$JIRA_DIR" ]]; then
    while IFS= read -r file; do
        EXCEL_FILES+=("$file")
    done < <(find "$JIRA_DIR" -maxdepth 1 -name "export-*.xlsx" -type f 2>/dev/null | sort -r)
fi

# Check if excel files exist
if [[ ${#EXCEL_FILES[@]} -eq 0 ]]; then
    echo "ERROR: No Excel files found matching pattern: $JIRA_DIR/export-*.xlsx"
    exit 1
fi

# Select the most recent file and warn if multiple exist
EXCEL_FILE="${EXCEL_FILES[0]}"
if [[ ${#EXCEL_FILES[@]} -gt 1 ]]; then
    echo "⚠ WARNING: Found ${#EXCEL_FILES[@]} Excel files:"
    for file in "${EXCEL_FILES[@]}"; do
        echo "  - $(basename "$file")"
    done
    echo "  Using most recent: $(basename "$EXCEL_FILE")"
    echo ""
fi

# Check if Node.js is available
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed"
    exit 1
fi

# Get Excel file modification time
EXCEL_MTIME=$(stat -c %Y "$EXCEL_FILE" 2>/dev/null || stat -f %m "$EXCEL_FILE" 2>/dev/null)
EXCEL_DATE=$(stat -c '%y' "$EXCEL_FILE" 2>/dev/null | cut -d. -f1 || stat -f '%Sm -t %Y-%m-%d\ %H:%M:%S' "$EXCEL_FILE" 2>/dev/null)

echo "Excel file: $EXCEL_FILE"
echo "Excel modification time: $EXCEL_DATE"

# Find oldest ticket directory modification time
OLDEST_DIR_MTIME=0
OLDEST_DIR_NAME=""

if [[ -d "$JIRA_DIR" ]]; then
    for dir in "$JIRA_DIR"/FHIR-*/; do
        if [[ -d "$dir" ]]; then
            DIR_MTIME=$(stat -c %Y "$dir" 2>/dev/null || stat -f %m "$dir" 2>/dev/null)
            if [[ $OLDEST_DIR_MTIME -eq 0 ]] || [[ $DIR_MTIME -lt $OLDEST_DIR_MTIME ]]; then
                OLDEST_DIR_MTIME=$DIR_MTIME
                OLDEST_DIR_NAME=$(basename "$dir")
            fi
        fi
    done
fi

if [[ $OLDEST_DIR_MTIME -gt 0 ]]; then
    OLDEST_DIR_DATE=$(stat -c '%y' "$JIRA_DIR/$OLDEST_DIR_NAME" 2>/dev/null | cut -d. -f1 || stat -f '%Sm -t %Y-%m-%d\ %H:%M:%S' "$JIRA_DIR/$OLDEST_DIR_NAME" 2>/dev/null)
    echo "Oldest ticket dir: $OLDEST_DIR_NAME"
    echo "Oldest ticket dir time: $OLDEST_DIR_DATE"
else
    echo "No ticket directories found yet - will create them"
    OLDEST_DIR_MTIME=0
fi

# Compare modification times
if [[ $FORCE_SYNC == true ]]; then
    SHOULD_SYNC=true
    echo "Force sync enabled: YES - syncing..."
elif [[ $OLDEST_DIR_MTIME -eq 0 ]]; then
    SHOULD_SYNC=true
    echo "No existing ticket directories - syncing to create them..."
elif [[ $EXCEL_MTIME -gt $OLDEST_DIR_MTIME ]]; then
    SHOULD_SYNC=true
    echo "Excel is newer: YES - syncing..."
else
    SHOULD_SYNC=false
    echo "Excel is newer: NO - skipping sync"
fi

# Run sync if needed
if [[ $SHOULD_SYNC == true ]]; then
    echo ""
    echo "Running: node sync-jira-tickets.mjs --excel $(basename "$EXCEL_FILE") --out ."
    cd "$JIRA_DIR"
    node sync-jira-tickets.mjs --excel "$(basename "$EXCEL_FILE")" --out . 2>&1
    EXIT_CODE=$?
    
    if [[ $EXIT_CODE -eq 0 ]]; then
        echo ""
        echo "✓ Jira sync completed successfully"
        exit 0
    else
        echo ""
        echo "✗ Jira sync failed with exit code $EXIT_CODE"
        exit $EXIT_CODE
    fi
else
    echo ""
    echo "✓ No updates needed - ticket files are already current"
    exit 0
fi
