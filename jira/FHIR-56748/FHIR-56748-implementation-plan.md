# Implementation Plan for FHIR-56748

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56748 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File (FHIR-56748-resolution.md) |
| Resolution/Disposition | Disposition A - Accept & Implement (Add Missing Scopes) |
| Summary | Provider/Consumer scope lists omit ImagingStudy, Device, and ServiceRequest even though these resources are listed as required/supported interactions |

## Resolution Interpretation

The selected disposition requires updating scope documentation in both capability statement security descriptions so that resources already declared with required/supported interactions are represented consistently in OAuth2 SMART Backend Services scopes.

The implementation is documentation-level in FSH capability statement definitions:
- Add ImagingStudy read/search scopes
- Add Device read/search scopes
- Add ServiceRequest read/search scopes

No profile structure, cardinality, or binding changes are required.

## Scope and Impact

### Affected Artifacts

- EeehrxfImagingReportResourceAccessProvider capability statement security description
- EeehrxfImagingReportResourceConsumer capability statement security description
- Generated R4 and R5 input FSH produced by preprocessing

### Candidate Files

- ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh - Add missing scope lines in the "Scopes for Supported Resources" block
- ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh - Add missing scope lines in the "Scopes for Desired Resources" block
- igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh - Regenerated output verification target
- igs/imaging-r5/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh - Regenerated output verification target
- igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh - Regenerated output verification target
- igs/imaging-r5/input/fsh/api/CapabilityStatementResourceConsumer.fsh - Regenerated output verification target

### Impact Notes

- R4 impact: Low (text update in security scope documentation)
- R5 impact: Low (same content generated/propagated through preprocessing)
- Breaking change risk: Low (clarifies existing expectations; no behavioral constraints added beyond already-declared resource support)

## Implementation Tasks

1. **Update Provider scope list with missing resource scopes**
- File: ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh
- Action: In the "Scopes for Supported Resources" section, add lines for:
  - system/ImagingStudy.read, system/ImagingStudy.search
  - system/Device.read, system/Device.search
  - system/ServiceRequest.read, system/ServiceRequest.search
- Placement: Keep list grouped and readable with similar clinical-resource entries.
- Acceptance: Provider security description explicitly lists all three resources with read/search scope pairs.

2. **Update Consumer scope list with missing resource scopes**
- File: ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh
- Action: In the "Scopes for Desired Resources" section, add lines for:
  - system/ImagingStudy.read, system/ImagingStudy.search (if ImagingStudy needed)
  - system/Device.read, system/Device.search (if Device needed)
  - system/ServiceRequest.read, system/ServiceRequest.search (if ServiceRequest needed)
- Placement: Maintain current wording pattern used by conditional resources.
- Acceptance: Consumer security description explicitly lists all three resources with read/search scope pairs.

3. **Run preprocessing and verify generated files for both versions**
- File: workspace root scripts and generated FSH artifacts
- Action:
  - Run ./_preprocessMultiVersion.sh
  - Verify updates in:
    - igs/imaging-r4/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh
    - igs/imaging-r5/input/fsh/api/CapabilityStatementResourceAccessProvider.fsh
    - igs/imaging-r4/input/fsh/api/CapabilityStatementResourceConsumer.fsh
    - igs/imaging-r5/input/fsh/api/CapabilityStatementResourceConsumer.fsh
- Acceptance: All four generated files contain the newly added scope lines and no unresolved liquid placeholders.

4. **Run build verification for rendered artifacts**
- File: workspace build outputs
- Action:
  - Run ./_genonce.sh (or full validation run when needed)
  - Confirm capability statement outputs reflect updated scope lists in rendered artifacts
- Acceptance: Rendered capability statement outputs include added ImagingStudy, Device, and ServiceRequest scope entries in both R4 and R5 build products.

## Validation Plan

- [ ] Authoring source files updated in ig-src/input/fsh/api/
- [ ] Preprocessing completed with ./_preprocessMultiVersion.sh
- [ ] Generated R4 and R5 FSH files contain the new scope entries
- [ ] Build completed and rendered capability statement artifacts reflect updated scope lists
- [ ] No unresolved placeholders or build-breaking issues introduced by this ticket
- [ ] Ticket intent fully satisfied: scope lists are consistent with declared resource support

## Open Questions

- Coordination with FHIR-56747: that ticket selected Disposition A and introduces/clarifies search interactions for Procedure, ServiceRequest, and Provenance. Confirm whether this ticket should also add Procedure.search and Provenance.search scope lines now, or keep this implementation strictly scoped to ImagingStudy, Device, and ServiceRequest per selected FHIR-56748 disposition text.
- Existing wording consistency: the current scope list includes a line with Composition.read paired to Observation.search in both provider/consumer files. Confirm whether that pre-existing wording issue is addressed separately (out of scope for FHIR-56748 unless explicitly included).
