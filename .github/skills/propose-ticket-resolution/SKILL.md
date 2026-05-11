---
name: propose-ticket-resolution
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

6. **Update Ticket Sections Report (Required Final Step)**
   - Update `jira/jira-ticket-sections.md`
   - Find the row for the processed ticket and populate:
     - `Proposal` column with link to `./open/FHIR-XXXXX/FHIR-XXXXX-resolution.md` or `./closed/FHIR-XXXXX/FHIR-XXXXX-resolution.md`
     - `Result` column with current state (for example: `Pending (recommended: A|B|C)`)
   - Preserve existing section ordering and table formatting

### Batch Processing (All Unresolved Tickets)

When you use the `--all` flag, each unresolved ticket is processed in a **separate Copilot chat session** via `runSubagent`:

1. **Orchestration Phase**
   - Scan `jira/` directory for all FHIR-* subdirectories
   - Filter to unresolved tickets only:
     - Status is NOT in: "Applied", "Not Persuasive with Modification", "Retracted", "Not Persuasive", "Declined"
     - Include all other statuses (New, In Progress, On Hold, Duplicate, etc.)
   - Return list of tickets to process

2. **Per-Ticket Session**
   - For each unresolved ticket, invoke `runSubagent` with the ticket key
   - Each subagent receives isolated context:
     - No history from previous tickets
     - Clean session boundary
     - Full focus on single ticket analysis
   - Subagent processes following the Single Ticket Workflow
   - Generate `<ticket>-resolution.md`

3. **Summary & Reporting**
   - Collect results from all subagent sessions
   - Output batch summary report showing:
     - Total tickets processed
     - Tickets generated/updated
     - Tickets skipped (already resolved)
     - Errors encountered
     - Links to all generated resolution files
   - Batch report written to `jira/batch-resolution-report.md`

4. **Update Ticket Sections Report (Required Final Step)**
    - Update `jira/jira-ticket-sections.md` after all ticket files are generated
    - For each processed ticket row, fill/update:
       - `Proposal` column with the generated resolution file link
       - `Result` column with disposition state and recommendation
    - Keep all unrelated rows unchanged

### Session Isolation Benefits

- **Focused Analysis**: Each ticket analyzed independently with full LLM context
- **No Cross-Ticket Contamination**: One ticket's analysis doesn't bias the next
- **Parallel Capability**: Subagents can run concurrently (future optimization)
- **Better Token Management**: Smaller payloads per session
- **Clear Audit Trail**: Each ticket's reasoning is separately recorded

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
- `jira/jira-ticket-sections.md` updated for the ticket row (Proposal + Result)

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

Final step after generation:
- Update `jira/jira-ticket-sections.md` for all processed tickets.

### Update Existing Resolution File

Simply re-run with the same ticket key to overwrite:
```
FHIR-51010
```

The existing `jira/FHIR-51010/FHIR-51010-resolution.md` will be updated.

## Output Locations

- **Single ticket**: `jira/FHIR-XXXXX/FHIR-XXXXX-resolution.md`
- **Batch mode**: Individual files in each `jira/FHIR-XXXXX/` directory
- **Batch summary report**: `jira/batch-resolution-report.md`
- **Index update**: `jira/jira-ticket-sections.md` (required final step)

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

# 4. Update ticket index report row
# (Proposal + Result columns)

# 5. Edit manually as needed before presenting to work group
```

### Batch Resolution Documentation
```bash
# 1. Update all ticket metadata from latest export
jira-sync-from-excel

# 2. Generate resolution proposals for all open tickets
ticket-resolution --all

# 3. Review summary output in console
# Review individual files in your editor

# 4. Update jira-ticket-sections.md for processed tickets

# 5. Commit resolution proposals and section index updates to git
git add jira/FHIR-*/FHIR-*-resolution.md jira/open/FHIR-*/*-resolution.md jira/closed/FHIR-*/*-resolution.md jira/jira-ticket-sections.md jira/batch-resolution-report.md
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

# 4. Update jira-ticket-sections.md rows for processed tickets

# 5. Review implementation evidence in generated files
```

## Implementation Details

### Batch Processing Architecture (Multi-Session with Subagent)

When batch mode (`--all`) is used, the skill employs a **multi-session strategy** using `runSubagent` for processing multiple tickets:

#### Phase 1: Orchestration
```
propose-ticket-resolution --all
  ↓
  Scan jira/ directory for all FHIR-* tickets
  ↓
  Filter to unresolved tickets (based on Status classification)
  ↓
  Build ordered list of ticket keys to process
```

#### Phase 2: Per-Ticket Processing (Separate Subagent Sessions)
```
For each unresolved ticket (e.g., FHIR-51010):
  ↓
  runSubagent("default", 
    "Run propose-ticket-resolution FHIR-51010")
  ↓
  [Isolated chat session - new context]
  [No history from previous tickets]
  ↓
  Process ticket following Single Ticket Workflow:
    1. Load ticket data
    2. Extract metadata
    3. Analyze status & disposition
    4. Parse evidence
    5. Generate resolution
  ↓
  Write jira/FHIR-51010/FHIR-51010-resolution.md
  ↓
  Return completion status to orchestrator
```

#### Phase 3: Summary & Reporting
```
After all subagent sessions complete:
  ↓
  Collect results from all tickets
  ↓
  Generate batch summary report:
    • Total tickets processed
    • Tickets newly generated
    • Tickets skipped (already resolved)
    • Errors encountered
    • Links to all resolution files
  ↓
  Write report to jira/batch-resolution-report.md
  ↓
   Update jira/jira-ticket-sections.md for processed tickets
   ↓
  Print summary to console
```

### Single Ticket Processing

When a specific ticket key is provided (e.g., `FHIR-51010`), the skill processes directly:

1. **Parse Arguments**: Extract ticket key from input
2. **Load Ticket Data**: Read `jira/FHIR-51010/FHIR-51010.md` from workspace
3. **Extract Metadata**: Parse all fields from Metadata and Resolution sections
4. **Analyze Status**: Map ticket Status to disposition classification
5. **Parse Evidence**: Extract GitHub links from comments and ticket text
6. **Generate Resolution File**: Create structured `*-resolution.md` with:
   - Complete metadata table
   - Full description preserved
   - Disposition analysis and recommendations
   - Verification checklist
7. **Write Output**: Save file atomically and report completion
8. **Update Ticket Sections Report**: Update `jira/jira-ticket-sections.md` row for this ticket
9. **Return Result**: Print file path to console

### Multi-Session Benefits

- **Focused Analysis**: Each ticket analyzed independently with fresh LLM context
- **No Cross-Ticket Bias**: One ticket's analysis doesn't influence the next
- **Better Context Utilization**: Smaller payloads = more room for detailed analysis
- **Parallel Capability**: Subagents can run concurrently (future enhancement)
- **Clear Audit Trail**: Each ticket's reasoning separately recorded
- **Error Isolation**: Failure in one ticket doesn't stop entire batch

## Batch Orchestrator Implementation

The batch processing is orchestrated by `batch-orchestrator.js`, which:

1. **Detects `--all` flag** and enters orchestration mode
2. **Scans jira/** directory for all FHIR-* folders
3. **Filters unresolved tickets** based on Status field
4. **Plans subagent invocations** for each unresolved ticket
5. **Outputs invocation plan** showing:
   - Ticket key
   - Session isolation mode
   - Expected output file path
6. **Returns orchestration results** to skill framework for execution

### Invocation from VS Code

When you invoke the skill with `--all`:
```
@propose-ticket-resolution --all
```

The skill framework:
1. Calls `batch-orchestrator.js --all`
2. Receives orchestration plan with list of subagent invocations
3. For each ticket, calls `runSubagent` with:
   - Ticket key
   - Isolated session context
   - Prompt to run resolution analysis
4. Collects all results
5. Generates batch summary report

### Terminal Invocation

From the command line in the jira directory:
```bash
# Batch orchestration
node ../.github/skills/propose-ticket-resolution/batch-orchestrator.js --all

# Single ticket (direct)
node ../.github/skills/propose-ticket-resolution/batch-orchestrator.js FHIR-51010
```

## Error Handling & Recovery

- **Ticket Not Found**: Error message printed; no file generated. Verify ticket key exists in `jira/FHIR-*/` directories.
- **Malformed Markdown**: Warning printed; empty or malformed fields skipped gracefully without stopping processing.
- **Invalid GitHub Links**: Warnings logged; links still included in output for manual review.
- **No Unresolved Tickets**: Clean exit with "No unresolved tickets found" message when using `--all`.
- **Write Permission Issues**: Descriptive error message with guidance on file permissions.
- **Subagent Failures**: If a subagent session fails for one ticket, orchestrator continues with remaining tickets and reports failures in summary.
- **Partial Batch Completion**: Summary clearly indicates which tickets succeeded and which failed or were skipped.

---

*Last updated: 2026-05-07*
*Skill version: 1.0*
