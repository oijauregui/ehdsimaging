# Implementation Plan for FHIR-56747

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56747 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File (`FHIR-56747-resolution.md`) |
| Resolution/Disposition | Disposition A — Accept & Implement (Add Search Interactions) |
| Summary | Procedure, ServiceRequest, and Provenance entries on Resource Access Provider/Consumer require search parameters as SHALL even though no search interaction is required |

## Resolution Interpretation

The proposed resolution (Disposition A) requires adding explicit `search-type` interactions to the `ProcedureResource`, `ServiceRequestResource`, and `ProvenanceResource` RuleSet macros in `ApiRuleSets.liquid.fsh`. Currently each macro defines search parameters (as SHALL/SHOULD via the `strength1` parameter) but omits a `search-type` interaction entry, creating a logical contradiction.

**Exact recommendation from resolution file:**
> "Procedure & ServiceRequest should have `#SHALL` search … Provenance can be SHOULD … Resolves the current contradiction … Current state is untenable: search parameters marked SHALL with no search interaction is confusing"

The fix must be applied at the macro level (not in the individual capability statement files) so that both the Resource Access Provider and Resource Consumer capability statements are corrected consistently:

- `ProcedureResource` — add `search-type` interaction using `{strength1}` (Provider → `#SHALL`, Consumer → `#SHOULD`)
- `ServiceRequestResource` — add `search-type` interaction using `{strength1}` (Provider → `#SHALL`, Consumer → `#SHOULD`)
- `ProvenanceResource` — add `search-type` interaction hardcoded as `#SHOULD` (recommended as optional regardless of context)

## Scope and Impact

### Affected Artifacts

- **EeehrxfImagingReportResourceAccessProvider** — Provider capability statement, three resources lack search-type interaction
- **EeehrxfImagingReportResourceConsumer** — Consumer capability statement, same three resources affected

### Candidate Files

- `ig-src/input/fsh/api/ApiRuleSets.liquid.fsh` — Add `search-type` interaction blocks to the `ProcedureResource`, `ServiceRequestResource`, and `ProvenanceResource` RuleSets (lines ~111–162)
- `igs/imaging-r4/input/fsh/api/ApiRuleSets.fsh` — Regenerated from the liquid source; must reflect changes after preprocessing
- `igs/imaging-r5/input/fsh/api/ApiRuleSets.fsh` — Same as above for R5

### Impact Notes

- **R4 impact**: Medium — capability statements regenerated via `_preprocessMultiVersion.sh`; rendered HTML output at `igs/imaging-r4/output/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.html` and `CapabilityStatement-EeehrxfImagingReportResourceConsumer.html` will reflect new search-type interactions
- **R5 impact**: Same as R4 — same liquid source generates R5 variants
- **Breaking change risk**: Low — adding a previously missing interaction declaration is additive; removes an existing contradiction so implementation conformance improves

## Implementation Tasks

1. **Add `search-type` interaction to `ProcedureResource` RuleSet**
   - File: `ig-src/input/fsh/api/ApiRuleSets.liquid.fsh`
   - Action: After the existing `read` interaction block inside `ProcedureResource` (after line ~122), insert:
     ```fsh
       * interaction[+]
         * code = #search-type
         * insert CapabilityStatementExpectation( {strength1} )
         * documentation = "Search for Procedure resources."
     ```
   - Acceptance: `ProcedureResource` RuleSet contains both a `#read` and a `#search-type` interaction; both use `{strength1}` expectation

2. **Add `search-type` interaction to `ServiceRequestResource` RuleSet**
   - File: `ig-src/input/fsh/api/ApiRuleSets.liquid.fsh`
   - Action: After the existing `read` interaction block inside `ServiceRequestResource` (after line ~133), insert:
     ```fsh
       * interaction[+]
         * code = #search-type
         * insert CapabilityStatementExpectation( {strength1} )
         * documentation = "Search for ServiceRequest resources."
     ```
   - Acceptance: `ServiceRequestResource` RuleSet contains both a `#read` and a `#search-type` interaction; both use `{strength1}` expectation

3. **Add `search-type` interaction to `ProvenanceResource` RuleSet**
   - File: `ig-src/input/fsh/api/ApiRuleSets.liquid.fsh`
   - Action: After the existing `read` interaction block inside `ProvenanceResource` (after line ~148), insert:
     ```fsh
       * interaction[+]
         * code = #search-type
         * insert CapabilityStatementExpectation( #SHOULD )
         * documentation = "Search for Provenance resources (optional)."
     ```
   - Acceptance: `ProvenanceResource` RuleSet contains both a `#read` interaction (at `{strength1}`) and a `#search-type` interaction hardcoded at `#SHOULD`; the contradiction between read-only interaction and `#SHALL` search parameters is eliminated

4. **Run preprocessing to regenerate both versions**
   - File: root of workspace
   - Action: Execute `./_preprocessMultiVersion.sh` to regenerate `igs/imaging-r4/input/fsh/api/ApiRuleSets.fsh` and `igs/imaging-r5/input/fsh/api/ApiRuleSets.fsh` from the updated liquid source
   - Acceptance: Both generated FSH files contain the new `search-type` interaction blocks for all three resources; no Liquid placeholder tokens remain unresolved

5. **Verify rendered capability statement output**
   - File: `igs/imaging-r4/output/`, `igs/imaging-r5/output/`
   - Action: After running the publisher (`./_genonce.sh` or full build), inspect the rendered HTML for both `EeehrxfImagingReportResourceAccessProvider` and `EeehrxfImagingReportResourceConsumer` capability statements
   - Acceptance: Procedure and ServiceRequest show `search-type` as SHALL in the Provider and SHOULD in the Consumer; Provenance shows `search-type` as SHOULD in both; no capability statement lists search parameters without a corresponding search-type interaction

## Validation Plan

- [ ] Source files updated in the correct authoring location (`ig-src/input/fsh/api/ApiRuleSets.liquid.fsh`)
- [ ] Preprocess/build completed for both versions via `./_preprocessMultiVersion.sh`
- [ ] Generated files `igs/imaging-r4/input/fsh/api/ApiRuleSets.fsh` and `igs/imaging-r5/input/fsh/api/ApiRuleSets.fsh` contain all three new `search-type` interaction blocks
- [ ] Rendered HTML outputs for Provider and Consumer capability statements in both `igs/imaging-r4/output/` and `igs/imaging-r5/output/` reflect the new search-type interactions
- [ ] No `#SHALL` search parameters remain on any resource that lacks a `search-type` interaction
- [ ] `./_preProcessAndCheckAll.sh` passes without new errors or broken-link warnings
- [ ] No unresolved Liquid placeholders or broken links introduced
- [ ] FHIR-56748 (related scope documentation ticket) is reviewed in coordination with this change, as its scope additions depend on this resolution

## Open Questions

- **Provenance search hardcoded at `#SHOULD`**: The macro currently uses a single `{strength1}` parameter. Hardcoding `#SHOULD` for the Provenance search-type interaction means the Consumer (which passes `#SHOULD`) is aligned, but the Provider (which passes `#SHALL` for read) will have asymmetric search (`#SHOULD`). This is the recommended disposition — confirm with workgroup whether this asymmetry is acceptable or whether a second strength parameter should be introduced to allow the Provider to express `#SHALL` Provenance search in future.
- **FHIR-56748 coordination**: The scope documentation in FHIR-56748 depends on whether Procedure/ServiceRequest/Provenance search becomes SHALL or SHOULD. Both tickets should be resolved together or in sequence to maintain consistency.
