---
name: ticket-execute-plan
description: 'Execute a Jira ticket implementation plan, apply repository changes, validate with IG preprocess build checks, and iterate fixes until the build passes or blockers are documented.'
argument-hint: 'FHIR-XXXXX (for example: FHIR-56763)'
---

# Ticket Execute Plan

Execute an existing Jira implementation plan and drive it to a validated result.

This skill turns a plan into implementation by:
- Applying plan tasks as concrete file edits.
- Running the repository build check flow through `ig-preprocess-build-check`.
- Fixing failures and re-running checks until clean or blocked.

## Pre-requisites

- A Jira ticket with an existing implementation plan: `jira/FHIR-XXXXX/FHIR-XXXXX-implementation-plan.md`.
- The result of the skill ig-preprocess-build-check, which can be run with the command:
  ```bash
  bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh
  ``` 
  passes

## Confirmed Execution Policies

- Pass policy: allow `passed-with-unrelated-blocker` when failures are proven pre-existing and unrelated to the ticket edits.
- Retry policy: perform up to 3 fix-check rounds, then escalate unresolved blockers.
- Scope policy: if a potential fix extends beyond the implementation plan scope, stop and request confirmation before editing out-of-scope files.

## When To Use

- A ticket already has `jira/FHIR-XXXXX/FHIR-XXXXX-implementation-plan.md`.
- You want implementation plus build validation in one guided loop.
- You need a reproducible execution record for review.

## Inputs

- Ticket key: `FHIR-XXXXX`
- Plan file: `jira/FHIR-XXXXX/FHIR-XXXXX-implementation-plan.md`
- Optional ticket metadata file: `jira/FHIR-XXXXX/FHIR-XXXXX.md`
- Repository source trees and generated trees under:
  - `ig-src/`
  - `input/`
  - `igs/imaging-r4/`
  - `igs/imaging-r5/`

## Outputs

- **Execution Summary**: `jira/FHIR-XXXXX/FHIR-XXXXX-execution-summary.md`
  - Complete record of implementation tasks, file changes, build validation results, and acceptance criteria verification
  - Automatically generated at the end of each successful or documented-blocked execution
  - Used for code review, audit trails, and governance records

## Workflow

### Step 1: Validate Prerequisites

1. Confirm plan file exists.
2. Confirm plan is implementation-required (not a no-op disposition).
3. Extract from the plan:
   - Implementation tasks
   - Candidate files
   - Acceptance criteria
   - Validation expectations
4. If the plan is missing, first run `ticket-implementation-plan`.

### Step 2: Build an Execution Checklist

Create a task checklist from the plan with one row per task:
- Task title
- Target file(s)
- Intended edit
- Acceptance condition
- Status: `not-started`, `in-progress`, `done`, `blocked`

Do not start edits until each task maps to real repository files.

### Step 3: Implement Planned Changes

1. Apply edits only in files justified by the plan scope.
2. Keep changes atomic and traceable to specific plan tasks.
3. Preserve existing style and repository conventions.
4. After each task, self-check acceptance criteria before marking `done`.

If a planned file path does not exist:
- Search for the correct existing equivalent.
- Update task mapping and continue.
- If no equivalent exists, mark `blocked` and record why.

### Step 4: Run Build Verification

Run the IG preprocess build check skill command:

```bash
bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh
```

Optional version-specific checks:

```bash
bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh 4.0.1
bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh 5.0.0
```

Collect from output:
- Failed step names
- Error lines
- Reported summary file path
- Proposed fixes from the checker summary

### Step 5: Failure Triage and Fix Loop

If the build check fails:

1. Classify each failure as one of:
   - Regression introduced by current ticket edits
   - Pre-existing unrelated failure
   - Environment/tooling/transient issue
2. For ticket-caused regressions:
   - Patch source changes.
   - Re-run build check.
3. For pre-existing unrelated failures:
   - Keep ticket changes isolated.
   - Document the unrelated blocker with evidence.
4. For environment/tooling issues:
   - Apply safe local fix (for example, missing executable bit, missing script prerequisite) when in scope.
   - Re-run build check.

Repeat until one outcome is reached:
- Build passes for required scope.
- Remaining failure is clearly unrelated and documented as blocker.

Recommended cap: 3 fix-check rounds before escalating unresolved blockers.

### Step 6: Completion and Evidence

Finish with a concise execution summary containing:
- Implemented tasks and touched files
- Deferred or blocked items with reason
- Final build-check status
- Remaining risk notes

### Step 7: Store Execution Summary

**Automatic**: A markdown execution summary is generated and stored in the ticket directory:
- **File**: `jira/FHIR-XXXXX/FHIR-XXXXX-execution-summary.md`
- **Content**: Complete record of implementation details, build verification results, acceptance criteria verification, and final status
- **Purpose**: Provides reproducible evidence for ticket review, governance, and audit trails

The execution summary includes:
- Ticket metadata (key, issue type, disposition)
- Summary of all changes applied with file references
- Build verification results for R4 and R5
- Rendered output verification
- Acceptance criteria checklist
- Quality assessment and risk analysis
- Final completion status (PASSED, PASSED-WITH-UNRELATED-BLOCKER, or BLOCKED)

This artifact is essential for:
- Code review and change tracking
- Governance record keeping
- Troubleshooting failed executions
- Replaying the ticket resolution for consistency checks

## Quality Criteria

Execution is complete only if all are true:

1. Every implemented edit maps to a plan task.
2. No out-of-scope refactors were introduced.
3. `ig-preprocess-build-check` was run at least once after edits.
4. If failures occurred, at least one fix-check iteration was performed unless blocked by unrelated issues.
5. Final status is explicit: `passed`, `passed-with-unrelated-blocker`, or `blocked`.
6. Evidence is recorded (key error lines or summary path).

## Decision Rules

- If plan and ticket conflict, prioritize the implementation plan.
- If plan is ambiguous, stop and raise focused clarification questions.
- If build fails only due to unrelated pre-existing issues, do not roll back valid ticket changes.
- If a fix would expand beyond ticket scope, request user confirmation before any out-of-scope edit.

## Important Rules

- Do not invent requirements beyond the implementation plan.
- Do not silently skip failed validation steps.
- Do not claim success without running build verification.
- Do not rewrite unrelated files to force a passing result.

## Suggested Prompts

- `Execute FHIR-56763 implementation plan and validate the build.`
- `Implement jira/FHIR-56763/FHIR-56763-implementation-plan.md and run ig-preprocess-build-check.`
- `Apply the plan for FHIR-XXXXX, run up to 3 fix-check rounds, and report status as passed, passed-with-unrelated-blocker, or blocked.`
