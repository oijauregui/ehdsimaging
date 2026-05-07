---
name: ticket-resolution
description: 'Generate resolution proposals for Jira tickets by analyzing metadata, status, and implementation details. Produces structured resolution files with complete ticket context, and disposition options. Use for single ticket analysis or batch processing all unresolved tickets. The resulting file will be used in the workgroup call to determine the final disposition of the ticket.'
argument-hint: 'FHIR-XXXXX (single ticket) or --all (batch mode)'
---

# Ticket Resolution Skill

Generates structured resolution proposals for FHIR Jira tickets by analyzing ticket metadata, status, comments, and implementation details extracted from linked GitHub items. Produces a comprehensive `<ticket>-resolution.md` file for each ticket that documents the disposition, implementation status, and resolution proposals.

## Pre-requisites

* sync-jira-tickets: Ensure that the latest ticket data from Jira is synced to the `jira/` directory by running `jira-sync-from-excel` before invoking this skill.
* ig-preprocess-build-check: Use this skill to verify that any implemented changes linked in the ticket comments have been merged and are present in the main branch and the rendered output directories are populated before finalizing the resolution proposal.

## When To Use

- **Single Ticket**: Preparing a specific ticket for resolution review (e.g., `FHIR-51010`)
- **Batch Processing**: Generating resolution proposals for all unresolved tickets at once (use `--all` flag)
- **Disposition Documentation**: Documenting approved changes and their implementation status
- **Implementation Verification**: Tracking GitHub commits and PRs that fulfill ticket requests
- **Work Group Review**: Preparing tickets for presentation to governance/work groups
- **Closure Documentation**: Creating a record of decisions and their implementation

## How To Invoke

**From VS Code**: Pass a ticket key (e.g., `FHIR-51010`) or `--all` to generate resolution files.

**From Terminal**: Run the underlying CLI tool:
```bash
node /path/to/ticket-resolution.js FHIR-51010      # Single ticket
node /path/to/ticket-resolution.js --all             # All unresolved tickets
```

## Workflow

### Single Ticket Resolution

When you provide a ticket key (e.g., `FHIR-51010`):

1. **Load Ticket Data**
   - Read `jira/FHIR-51010/FHIR-51010.md`
   - Extract metadata: Issue Type, Status, Resolution, Reporter, Assignee, Created date, Parent key, Grouping
   - Parse comments and extract GitHub links (PRs, commits)

2. **Analyze Implementation Status**
   - Map ticket Status to disposition state (Applied, Declined, Alternative, etc.)
   - Identify related tickets via Parent key or Grouping
   - Determine if implementation is complete or pending

3. **Classify Disposition**
   - **Applied**: Change was approved and implemented (Status: Applied, Resolution: Persuasive or Accepted)
   - **Declined**: Change was rejected (Status: Declined or Duplicate)
   - **Alternative**: Different approach was taken (Status: Applied but different from request)
   - **Pending**: Awaiting decision (Status: New, In Progress, or other open statuses)
   - **Duplicate**: Superseded by another ticket (look for Parent key or links)

4. **Extract Evidence**
   - Parse comment links for GitHub PR URLs
   - Extract commit hashes from comment text
   - Identify commit authors and dates from comment metadata
   - Note related tickets via Grouping field
   - Locate related pages in the rendered version of the specification: igs/imaging-r4 and igs/imaging-r5

5. **Generate Resolution File**
   - Create `jira/FHIR-51010/FHIR-51010-resolution.md`
   - Structure with sections: Summary, Implementation Status, Disposition Analysis, Resolution Proposals, Proposed Dispositions
   - Include all extracted evidence and GitHub links

### Batch Processing (All Unresolved Tickets)

When you use the `--all` flag:

1. Scan `jira/` directory for all FHIR-* subdirectories
2. Filter to unresolved tickets only:
   - Status is NOT in: "Applied", "Not Persuasive with Modification", "Retracted", "Not Persuasive", "Declined"
   - Include all other statuses (New, In Progress, On Hold, Duplicate, etc.)
3. Process each unresolved ticket following the Single Ticket Workflow
4. Generate `<ticket>-resolution.md` for each
5. Output a summary report showing:
   - Total tickets processed
   - Tickets generated/updated
   - Tickets skipped (already resolved)
   - Errors encountered
   - Proposed resolutions from three different viewpoints (Accept, Alternative, Decline)
   - Recommended disposition based on analysis

## Resolution Proposal Format

Each generated `<ticket>-resolution.md` file includes:

```markdown
# Proposed Resolution for FHIR-XXXXX

## Ticket Summary
[Metadata table with Key, Type, Status, Resolution, Reporter, Created, Grouping]

## Description
[Extracted from ticket .md file]

## Implementation Status
[Applied/Pending/Declined analysis with evidence]

### Implementation Details (if Applied):
- PR links with numbers
- Commit hashes and links
- Merge dates and authors

## Related Tickets
[List of parent/grouped tickets if any]

## Disposition Analysis

### Disposition Taken
[Classification: Accept & Implement / Decline / Alternative / Pending]

### Rationale
[Based on: Work Group consensus, Implementation evidence, Related discussions]

### Evidence
- Status markers from ticket
- GitHub implementation links
- Comment dates and authors

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

{The specific action to take that fulfills exactly what the ticket asks for.
Write this as a concrete change proposal: what would change in the spec, what
resource/element/constraint would be added/modified/removed. This should be
detailed enough to act on.}

#### Justification

{Why this is a reasonable approach. Reference specific FHIR design principles,
consistency with existing patterns, community feedback from Zulip, or
standards requirements.}

---

### Disposition B: Alternative Approach

#### Proposal

{An alternative way to address the underlying need of the ticket that differs
from what was literally requested. This might use a different mechanism (e.g.,
extension vs. core element, different resource, different cardinality, profile
instead of base spec change). Be specific about what the alternative is.}

#### Justification

{Why this alternative might be preferable. Address trade-offs vs. Disposition
A. Reference design principles, backward compatibility, implementation
burden, or scope.}

---

### Disposition C: Decline

#### Proposal

{A clear statement that the request should not be adopted, with a specific
rationale category (e.g., out of scope, insufficient use cases, already
addressed by existing mechanism, breaking change not justified).}

#### Justification

{Why declining is defensible. Reference the specific reason the request
should not be adopted. If there is an existing mechanism that already
addresses the need, cite it. If the change would cause harm (breaking
changes, complexity), explain how.}

---

### Recommendation

**Recommended disposition:** {A, B, or C}

{A paragraph explaining why this disposition is recommended over the others.
Weigh the trade-offs, reference the community discussion if relevant, and
consider the impact on implementers. Be direct and opinionated — the
workgroup wants a clear recommendation to start the discussion.}

## Next Steps
[Completed / Ready for Review / Awaiting Decision / On Hold]

### Verification Checklist
- [x/] Work group review completed
- [x/] Implementation code committed
- [x/] Verification in main branch
- [x/] Documentation updated
```

## Data Sources

- **Primary**: `jira/FHIR-*/FHIR-*.md` files (synced from `export.xlsx`)
- **Ticket Metadata**: Issue Type, Status, Resolution, Reporter, Assignee, Created, Parent key, Grouping
- **Implementation Evidence**: Comments section (parsing for GitHub links and text)
- **Related Tickets**: Parent key and Grouping fields

## Procedure

### Generate Resolution for One Ticket

Provide a ticket key:
```
FHIR-51010
```

Output: `jira/FHIR-51010/FHIR-51010-resolution.md` created with:
- Complete ticket metadata
- Full description and comments
- Three proposed disposition options
- Verification checklist

### Generate Resolutions for All Unresolved Tickets

Provide the `--all` flag:
```
--all
```

Output summary:
```
Processing unresolved tickets (excluding Applied, Not Persuasive*, Retracted, Declined)...
Generated FHIR-51273-resolution.md
Generated FHIR-51274-resolution.md
... (more files)
Summary: 245 total tickets, 38 unresolved processed, 207 resolved/excluded
```

### Update Existing Resolution File

Simply re-run with the same ticket key to overwrite:
```
FHIR-51010
```

The existing `jira/FHIR-51010/FHIR-51010-resolution.md` will be updated.

## Output Locations

- **Single ticket**: `jira/FHIR-XXXXX/FHIR-XXXXX-resolution.md`
- **Batch mode**: Individual files in each `jira/FHIR-XXXXX/` directory
- **Summary report**: Printed to console (not written to file)

## Disposition Classification Rules

Tickets are classified as "resolved" (excluded from `--all` batch) or "unresolved" (included) based on Status:

| Status | Resolution | Classification | Excluded from Batch? |
|--------|-----------|-----------------|----------------------|
| Applied | Persuasive/Accepted | **Accept & Implement** | ✓ YES |
| Applied | (any) | **Accept & Implement** | ✓ YES |
| Not Persuasive | (any) | **Not Persuasive** | ✓ YES |
| Not Persuasive with Modification | (any) | **Alternative** | ✓ YES |
| Retracted | (any) | **Retracted** | ✓ YES |
| Declined | (any) | **Decline** | ✓ YES |
| Duplicate | (any) | **Duplicate** | Include |
| New | (any) | **Pending** | Include |
| In Progress | (any) | **Pending** | Include |
| On Hold | (any) | **Pending** | Include |
| Triaged | (any) | **Pending Governance Review** | Include |
| Waiting for Input | (any) | **Pending Input** | Include |
| Other statuses | (any) | **Pending** | Include |

## GitHub Evidence Parsing

The skill automatically extracts and links:

- **Pull Requests**: `https://github.com/hl7-eu/imaging/pull/NNN`
- **Commits**: `https://github.com/hl7-eu/imaging/commit/HASH` or short hashes (7 chars)
- **Issues**: `https://github.com/hl7-eu/imaging/issues/NNN`

These are extracted from comment text and linked in the resolution file with clickable URLs.

## Related Unresolved Tickets

If a ticket has a Parent key, the resolution file notes the relationship:

```
## Related Tickets
- Parent: FHIR-XXXXX (status: Applied/Pending/Declined)
- Grouped with: [block-vote-1] (N other tickets in same grouping)
```

## Notes and Limitations

- **Static Data**: Reads from markdown files only; does not connect to live Jira API.
- **Data Currency**: Ensure tickets are synced before running. Use `jira-sync-from-excel` if export.xlsx was updated.
- **GitHub Linking**: Links extracted via regex; malformed URLs may not be captured.
- **Repository Assumption**: Assumes imaging repo is `hl7-eu/imaging` on GitHub.
- **Batch Filtering**: The `--all` flag only processes tickets with statuses other than Applied, Not Persuasive with Modification, Retracted, Not Persuasive, or Declined.
- **File Permissions**: Skill must have write access to `jira/FHIR-*/` directories.

## Integration with Other Skills

- **Before running**: Use `jira-sync-from-excel` to ensure ticket metadata is current.
- **After running**: Review generated `*-resolution.md` files to verify accuracy before committing to Git.
- **In combination**: Chain with `ig-preprocess-build-check` or build validation skills to verify implementation completeness.

## Example Workflows

### Prepare Ticket for Governance Review
```bash
# 1. Ensure tickets are synced
jira-sync-from-excel

# 2. Generate resolution for the specific ticket
ticket-resolution FHIR-51010

# 3. Review the generated file
cat jira/FHIR-51010/FHIR-51010-resolution.md

# 4. Edit manually as needed before presenting to work group
```

### Batch Resolution Documentation
```bash
# 1. Update all ticket metadata from latest export
jira-sync-from-excel

# 2. Generate resolution proposals for all open tickets
ticket-resolution --all

# 3. Review summary output in console
# Review individual files in your editor

# 4. Commit resolution proposals to git
git add jira/FHIR-*/FHIR-*-resolution.md
git commit -m "Generate resolution proposals for unresolved tickets"
```

### Find and Document Recently Applied Changes
```bash
# 1. Sync latest ticket data
jira-sync-from-excel

# 2. Generate resolutions for tickets that were recently marked "Applied"
ticket-resolution --all

# 3. Filter results for newly generated Applied tickets
grep -r "Applied" jira/FHIR-*/FHIR-*-resolution.md | head -10

# 4. Review implementation evidence in generated files
```

## Implementation Details

The skill processes tickets through these steps:

1. **Parse Arguments**: Accepts ticket key (e.g., `FHIR-51010`) or `--all` flag
2. **Load Ticket Data**: Reads `jira/FHIR-XXXXX/FHIR-XXXXX.md` files from workspace
3. **Extract Metadata**: Parses all fields from Metadata and Resolution sections
4. **Analyze Status**: Maps ticket Status to disposition classification
5. **Parse Evidence**: Extracts GitHub links from comments and ticket text
6. **Generate Resolution File**: Creates structured `*-resolution.md` with:
   - Complete metadata table
   - Full description preserved
   - Disposition analysis and recommendations
   - Verification checklist
7. **Write Output**: Saves files atomically and reports summary
8. **Report Results**: Prints processing summary (total, generated, skipped, errors)

## Error Handling & Recovery

- **Ticket Not Found**: Error message printed; no file generated. Verify ticket key exists in `jira/FHIR-*/` directories.
- **Malformed Markdown**: Warning printed; empty or malformed fields skipped gracefully without stopping processing.
- **Invalid GitHub Links**: Warnings logged; links still included in output for manual review.
- **No Unresolved Tickets**: Clean exit with "No unresolved tickets found" message when using `--all`.
- **Write Permission Issues**: Descriptive error message with guidance on file permissions.
- **Partial Failures**: Skill continues processing remaining tickets; summary reports counts for each status.

---

*Last updated: 2026-05-07*
*Skill version: 1.0*
