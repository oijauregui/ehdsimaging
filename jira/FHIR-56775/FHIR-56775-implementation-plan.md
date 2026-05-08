# Implementation Plan for FHIR-56775

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56775 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File |
| Disposition | A — Accept As Requested |
| Summary | Editorial: small fixes to Resource Access Provider / Consumer CapabilityStatements |

## Resolution Interpretation

Disposition A accepts the reporter's request to fix four editorial issues in the Resource Access CapabilityStatements:

1. **Duplicate and mismatched scopes in Provider**: The scope list contains duplicate `system/Observation.search` and a mismatch where `system/Composition.read` is followed by `system/Observation.search` instead of `system/Composition.search`.
2. **Duplicate scopes in Consumer**: The scope list contains duplicate `patient/read` and `patient/search` entries.
3. **Scope ordering consistency**: Both Provider and Consumer should maintain consistent alphabetical or logical ordering.
4. **Parameter description alignment**: Verify that parameter descriptions are consistent and correctly associated with their parameters.

## Scope and Impact

### Affected Artifacts

- **CapabilityStatementResourceAccessProvider** — Imaging Report Resource Access Provider actor capability statement (FSH source + R4/R5 generated versions)
- **CapabilityStatementResourceConsumer** — Imaging Report Resource Consumer actor capability statement (FSH source + R4/R5 generated versions)

### Candidate Files

**Source files (editing location):**
- `ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh` — Fix duplicate and mismatched scopes in the SMART scope documentation section
- `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh` — Fix duplicate scopes and align ordering with Provider statement

**Generated files (verification location):**
- `igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh` — Auto-generated R4 version (will be regenerated)
- `igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh` — Auto-generated R4 version (will be regenerated)
- `igs/imaging-r5/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh` — Auto-generated R5 version (will be regenerated)
- `igs/imaging-r5/input/fsh/api/CapabilityStatementResourceConsumer.fsh` — Auto-generated R5 version (will be regenerated)

### Impact Notes

- **R4 impact**: Scope list corrections will be rendered into published R4 CapabilityStatement documentation and examples
- **R5 impact**: Scope list corrections will be rendered into published R5 CapabilityStatement documentation and examples
- **Breaking change risk**: **Low** — These are purely editorial corrections to documentation text; they do not alter the functional structure of the capability statements or affect client/server behavior
- **Implementation burden**: Minimal — The changes are localized line edits in two FSH source files
- **Ballot impact**: This correction addresses ballot feedback; fixing it before publication improves specification quality and reduces implementer confusion

## Implementation Tasks

### 1. Fix Duplicate and Mismatched Scopes in Provider CapabilityStatement

**File**: `ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh`

**Action**:
- Locate the "### Scopes for Supported Resources" section (approximately lines 61–70)
- Current text contains:
  ```
  - system/Observation.read, system/Observation.search
  - system/Composition.read, system/Observation.search
  ```
- Replace with:
  ```
  - system/Observation.read, system/Observation.search
  - system/Composition.read, system/Composition.search
  ```

**Acceptance**: 
- [ ] Line mentioning `system/Composition.read` is immediately followed by `system/Composition.search` (not `system/Observation.search`)
- [ ] No duplicate `system/Observation.search` entries in the scope list

---

### 2. Fix Duplicate Scopes in Consumer CapabilityStatement

**File**: `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh`

**Action**:
- Locate the "### Scopes for Desired Resources" section (approximately lines 43–55)
- Current text contains duplicate entry:
  ```
  - system/Patient.read, system/Patient.search
  - system/Patient.read, system/Patient.search (REQUIRED - read and search Patient)
  ```
- Remove the duplicate; consolidate to a single entry:
  ```
  - system/Patient.read, system/Patient.search (REQUIRED - read and search Patient)
  ```

**Acceptance**: 
- [ ] Only one `system/Patient.read, system/Patient.search` entry exists
- [ ] The entry includes the "(REQUIRED ...)" annotation

---

### 3. Fix Mismatched Scope in Consumer CapabilityStatement

**File**: `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh`

**Action**:
- Locate the line in the scope list with the Composition resource (approximately line 43)
- Current text:
  ```
  - system/Composition.read, system/Observation.search
  ```
- Replace with:
  ```
  - system/Composition.read, system/Composition.search
  ```

**Acceptance**: 
- [ ] Line mentioning `system/Composition.read` is immediately followed by `system/Composition.search` (not `system/Observation.search`)

---

### 4. Align Scope Ordering Between Provider and Consumer

**File(s)**: `ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh` and `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh`

**Action**:
- Review both scope lists after Tasks 1–3 to ensure consistent ordering
- Both lists should follow the same logical or alphabetical sequence for corresponding resources
- Note: Provider and Consumer may have different scope sets (Provider declares what it supports; Consumer requests what it needs), but the order of common resources should align for clarity

**Acceptance**: 
- [ ] Resources appear in the same logical order in both Provider and Consumer scope lists
- [ ] No additional gaps or duplicates remain after previous fixes

---

### 5. Preprocess and Generate Outputs

**File(s)**: N/A (script execution)

**Action**:
- Run the preprocessing step to regenerate R4 and R5 versions from the source templates:
  ```bash
  bash _preprocessMultiVersion.sh
  ```
- This will:
  - Apply any Liquid template substitutions (e.g., `{{R4}}`, `{{R5}}` tags)
  - Generate `igs/imaging-r4/input/fsh/api/CapabilityStatement*.fsh` files
  - Generate `igs/imaging-r5/input/fsh/api/CapabilityStatement*.fsh` files

**Acceptance**: 
- [ ] Preprocessing completes without errors
- [ ] Generated R4 and R5 files contain the corrected scope lists
- [ ] No new build warnings or errors introduced

---

### 6. Validate Rendered Output

**File(s)**: `igs/imaging-r4/output/` and `igs/imaging-r5/output/`

**Action**:
- Run a full build to verify the capability statements render correctly:
  ```bash
  bash _genonce.sh
  ```
- Inspect the published HTML pages for the Resource Access Provider and Consumer capability statements
- Verify that the scope lists appear correctly in both R4 and R5 output

**Acceptance**: 
- [ ] Build completes successfully
- [ ] Published CapabilityStatement pages reflect corrected scope lists
- [ ] No broken links, malformed FHIR URIs, or rendering errors

---

## Validation Plan

- [ ] Source files edited in correct location (`ig-src/input/fsh/api/`)
- [ ] All scope duplicate entries removed
- [ ] Mismatched resource-scope pairs corrected (Composition.read now paired with Composition.search)
- [ ] Preprocess and build completed without errors
- [ ] Rendered outputs in `igs/imaging-r4/` and `igs/imaging-r5/` reflect the intended changes
- [ ] No new unresolved placeholders or broken links introduced
- [ ] Scope ordering is consistent between Provider and Consumer statements
- [ ] Ticket resolution fully implemented as per Disposition A

## Open Questions

- **Parameter descriptions (§11.5.3.4.12)**: The resolution mentions flipped parameter descriptions for `subject` and `status` parameters. Current source inspection does not reveal a `subject` parameter; only `patient`, `category`, `code`, `date`, and `status` are present in the Observation resource section. 
  - **Clarification needed**: Are the parameter descriptions already correct, or should this task search in a different resource (e.g., Composition, DiagnosticReport)?
  - **Recommendation**: Review the rendered spec page (§11.5.3.4.12) to confirm whether this issue is still present after fixing the scope duplicates.

---

## Estimated Effort

- **Editorial edits**: 15–20 minutes (4 line edits across 2 files)
- **Preprocessing and build**: 10–15 minutes (depending on system performance)
- **Validation and verification**: 10–15 minutes (review rendered output)
- **Total estimated time**: 35–50 minutes

---

## Implementation Sequence

1. ✅ Edit `CapabilityStatementResourceAccessProvider.liquid.fsh` (Task 1)
2. ✅ Edit `CapabilityStatementResourceConsumer.fsh` (Tasks 2 & 3)
3. ✅ Review scope ordering alignment (Task 4)
4. ✅ Run preprocessing (Task 5)
5. ✅ Run build and validate outputs (Task 6)
6. ✅ Commit changes to Git with reference to FHIR-56775

---

*Implementation plan created: 2026-05-08*
*Disposition: A — Accept As Requested*
*Status: Ready for implementation*
