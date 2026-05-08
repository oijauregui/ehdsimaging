# Implementation Plan for FHIR-56743

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56743 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File |
| Resolution/Disposition | Recommended disposition A (Accept As Requested) |
| Summary | Identifier.value wording should clarify namespace-scoped uniqueness and warn against treating value alone as globally unique |

## Resolution Interpretation

For this Technical Correction ticket, the primary source is the proposed resolution file. The recommended implementation is to update Identifier.value wording for accession-focused identifiers so uniqueness is explicitly scoped to Identifier.system and practical non-uniqueness cases are acknowledged.

Primary direction from the recommendation/proposal:
- Clarify identifier value semantics as namespace-scoped (system + value context).
- Explicitly document that accession uniqueness may fail in real-world workflows.
- Ensure generated R4 and R5 rendered outputs reflect the updated wording.

## Scope and Impact

### Affected Artifacts
- AccessionNumberIdentifierEuImaging - primary profile carrying accession semantics and identifier constraints.
- ServiceRequestOrderEuImaging - references accession identifier profile; rendered profile pages should reflect updated identifier element wording where inherited/expanded.
- Additional identifier profile pages generated from shared Identifier.value semantics (Study/SOP) - verify no unintended wording regressions.

### Candidate Files
- `ig-src/input/fsh/profiles/im-identifiers.fsh` - update AccessionNumberIdentifierEuImaging wording (description and/or explicit `value` short/definition override) to align with approved semantics.
- `igs/imaging-r4/temp/pages/StructureDefinition-AccessionNumberIdentifierEuImaging.json` - verify rendered R4 output contains revised wording after regeneration.
- `igs/imaging-r5/temp/pages/StructureDefinition-AccessionNumberIdentifierEuImaging.json` - verify rendered R5 output contains revised wording after regeneration.
- `igs/imaging-r4/temp/pages/StructureDefinition-ServiceRequestOrderEuImaging.json` - verify no contradictory inherited identifier wording remains in key consuming profile output.
- `igs/imaging-r5/temp/pages/StructureDefinition-ServiceRequestOrderEuImaging.json` - verify no contradictory inherited identifier wording remains in key consuming profile output.

### Impact Notes
- R4 impact: Expected textual/profile snapshot updates for accession identifier semantics in generated artifacts.
- R5 impact: Expected textual/profile snapshot updates for accession identifier semantics in generated artifacts.
- Breaking change risk: Low. This is a semantic clarification and guidance update, not a structural/cardinality/terminology binding change.

## Implementation Tasks

1. **Update accession identifier wording in source profile**
   - File: `ig-src/input/fsh/profiles/im-identifiers.fsh`
   - Action: Revise AccessionNumberIdentifierEuImaging text to explicitly state namespace-scoped uniqueness (`Identifier.system` + `Identifier.value`) and note known real-world non-uniqueness conditions; if needed, add explicit `* value ^short` / `* value ^definition` overrides to prevent ambiguous inherited short text.
   - Acceptance: Source profile text is internally consistent and no longer implies global uniqueness of `value` alone.

2. **Regenerate IG content for both versions**
   - File: `./_preprocessMultiVersion.sh` and optionally `./_genonce.sh`
   - Action: Run preprocessing/regeneration so updated source text propagates into generated R4/R5 outputs.
   - Acceptance: Build completes without new errors and regenerated artifacts are updated for both versions.

3. **Validate rendered accession outputs (R4/R5)**
   - File: `igs/imaging-r4/temp/pages/StructureDefinition-AccessionNumberIdentifierEuImaging.json`
   - Action: Confirm generated R4 profile output no longer uses ambiguous "The value that is unique" wording for accession context where the profile defines guidance.
   - Acceptance: Revised wording appears in the relevant Identifier.value representation for R4 accession profile pages.

4. **Validate rendered accession outputs (R4/R5)**
   - File: `igs/imaging-r5/temp/pages/StructureDefinition-AccessionNumberIdentifierEuImaging.json`
   - Action: Confirm generated R5 profile output no longer uses ambiguous "The value that is unique" wording for accession context where the profile defines guidance.
   - Acceptance: Revised wording appears in the relevant Identifier.value representation for R5 accession profile pages.

5. **Spot-check consuming profile outputs for consistency**
   - File: `igs/imaging-r4/temp/pages/StructureDefinition-ServiceRequestOrderEuImaging.json`
   - Action: Verify accession identifier usage in ServiceRequest output does not reintroduce contradictory uniqueness language.
   - Acceptance: No conflicting global-uniqueness implication in R4 consuming profile output.

6. **Spot-check consuming profile outputs for consistency**
   - File: `igs/imaging-r5/temp/pages/StructureDefinition-ServiceRequestOrderEuImaging.json`
   - Action: Verify accession identifier usage in ServiceRequest output does not reintroduce contradictory uniqueness language.
   - Acceptance: No conflicting global-uniqueness implication in R5 consuming profile output.

## Validation Plan

- [ ] Source files updated in the correct authoring location
- [ ] Preprocess/build completed for both versions
- [ ] Rendered outputs reflect the intended change
- [ ] No unresolved placeholders or broken links introduced
- [ ] Ticket intent is fully covered by implemented edits

Repository-specific execution checks:
- [ ] Run `./_preprocessMultiVersion.sh`
- [ ] Run `./_preProcessAndCheckAll.sh` for full validation when preparing merge
- [ ] For fast editorial iteration, run `./_genonce.sh` as a quick pass before full validation
- [ ] Verify output deltas in generated trees for both versions (at least under `igs/imaging-r4/temp/pages/` and `igs/imaging-r5/temp/pages/`)

## Open Questions

- Should this ticket change only the accession identifier profile text (`AccessionNumberIdentifierEuImaging`) or also explicitly override Identifier.value wording in other identifier profiles to avoid inconsistent inherited text?
- The workflow reference mentions `igs/imaging-r4/output/` and `igs/imaging-r5/output/`, but this workspace currently exposes generated artifacts primarily under `igs/imaging-r4/temp/pages/` and `igs/imaging-r5/temp/pages/`. Confirm whether output directory validation is required in addition to temp/pages validation.
