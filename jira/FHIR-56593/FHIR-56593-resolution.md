# Proposed Resolution for FHIR-56593

## Ticket Summary

| Field       | Value                              |
|-------------|------------------------------------|
| Key         | FHIR-56593                         |
| Type        | Technical Correction               |
| Status      | Submitted                          |
| Resolution  | Unresolved                         |
| Reporter    | Giorgio Cangioli                   |
| Assignee    | Unassigned                         |
| Created     | 2026-04-28                         |
| Grouping    | —                                  |

## Description

> Typo: the title of all the internal Code Systems are "Value Set:…"

Multiple FSH source files in `ig-src/input/fsh/terminologies/` define `CodeSystem` resources whose `Title` field is incorrectly prefixed with `"ValueSet: …"`. Additionally, several `ValueSet` resources also carry a redundant `"ValueSet: …"` prefix in their titles (the FHIR publisher appends the resource type automatically).

## Implementation Status

**Pending** — No implementation evidence found. No linked PRs or commits in the ticket. The fix is entirely mechanical and ready to implement.

## Affected Files

### CodeSystem resources with wrong "ValueSet:" prefix (primary bug)

| File | Resource | Current Title |
|------|----------|---------------|
| `ig-src/input/fsh/terminologies/DiagnosticReportSupportInfo.fsh` | `CodeSystem: DiagnosticReportSupportingInfoCodeSystem` | `"ValueSet: Diagnostic Report Support Info Code System"` |
| `ig-src/input/fsh/terminologies/MissingDicomTerminology.fsh` | `CodeSystem: MissingDicomTerminology` | `"ValueSet: Missing DICOM Terminology"` |

### ValueSet resources with redundant "ValueSet:" prefix (secondary issue)

| File | Resource | Current Title |
|------|----------|---------------|
| `ig-src/input/fsh/terminologies/DiagnosticReportSupportInfo.fsh` | `ValueSet: DiagnosticReportSupportingInfoVCodes` | `"ValueSet: DiagnosticReport supportInfo codes"` |
| `ig-src/input/fsh/terminologies/section-terminology.fsh` | `ValueSet: Hl7EuImagingSectionValueSet` | `"ValueSet: Section codes used to label annotations."` |
| `ig-src/input/fsh/terminologies/ImComposition-terminology.fsh` | `ValueSet: SectionEmptyReasonEuImaging` | `"ValueSet: Reasons a section in an imaging report is empty."` |
| `ig-src/input/fsh/terminologies/category-and-type.fsh` | `ValueSet: ImagingReportTypesEuVSEuImaging` | `"ValueSet: Radiology Report Types"` |
| `ig-src/input/fsh/terminologies/imaging-study-performer-type.fsh` | `ValueSet: ImagingStudyEuImagingPerformerTypeVS` | `"ValueSet: Imaging Study Performer Type Value Set"` |
| `ig-src/input/fsh/terminologies/ImProcedureType.fsh` | `ValueSet: ProcedureEuImagingType` | `"ValueSet: Imaging Procedure Type"` |

## Related Tickets

None identified.

## Disposition Analysis

### Disposition Taken

**Pending** — Technical Correction not yet implemented.

### Rationale

The reporter is correct. SUSHI / the FHIR publisher does not automatically decorate titles with the resource type, so the `"ValueSet: …"` prefix appearing on `CodeSystem` titles is a genuine typo that will confuse readers and produce misleading rendered pages. The same prefix on `ValueSet` titles is redundant and inconsistent with FHIR IG authoring conventions (titles are plain English labels, not type-qualified).

### Evidence

- Source inspection of `ig-src/input/fsh/terminologies/` confirms two `CodeSystem` definitions with `Title: "ValueSet: …"`.
- Six `ValueSet` definitions carry the redundant `"ValueSet: …"` prefix.
- No PR or commit addressing this issue found in ticket comments.

---

## Proposed Dispositions

### Disposition A: Accept As Requested — Fix All Affected Titles

#### Proposal

Remove the erroneous `"ValueSet: "` prefix from the two `CodeSystem` titles, and remove the redundant `"ValueSet: "` prefix from all six `ValueSet` titles. Proposed corrected titles:

| Resource | Corrected Title |
|----------|-----------------|
| `CodeSystem: DiagnosticReportSupportingInfoCodeSystem` | `"Diagnostic Report Support Info Code System"` |
| `CodeSystem: MissingDicomTerminology` | `"Missing DICOM Terminology"` |
| `ValueSet: DiagnosticReportSupportingInfoVCodes` | `"DiagnosticReport supportInfo codes"` |
| `ValueSet: Hl7EuImagingSectionValueSet` | `"Section codes used to label annotations"` |
| `ValueSet: SectionEmptyReasonEuImaging` | `"Reasons a section in an imaging report is empty"` |
| `ValueSet: ImagingReportTypesEuVSEuImaging` | `"Radiology Report Types"` |
| `ValueSet: ImagingStudyEuImagingPerformerTypeVS` | `"Imaging Study Performer Type"` |
| `ValueSet: ProcedureEuImagingType` | `"Imaging Procedure Type"` |

Note: `ImagingStudyEuImagingPerformerTypeVS` currently has the doubly-redundant title `"ValueSet: Imaging Study Performer Type Value Set"` — the trailing "Value Set" should also be removed when fixing the prefix.

#### Justification

This is the minimal, correct fix. FHIR IG convention is that `Title` is a plain human-readable label without resource-type decoration. Fixing both CodeSystem and ValueSet titles at the same time is consistent and eliminates all instances of the pattern in one PR.

---

### Disposition B: Fix CodeSystem Titles Only

#### Proposal

Fix only the two `CodeSystem` resources that have the wrong `"ValueSet: "` prefix (the primary typo reported), leaving `ValueSet` titles unchanged.

| Resource | Corrected Title |
|----------|-----------------|
| `CodeSystem: DiagnosticReportSupportingInfoCodeSystem` | `"Diagnostic Report Support Info Code System"` |
| `CodeSystem: MissingDicomTerminology` | `"Missing DICOM Terminology"` |

#### Justification

The ticket specifically calls out `CodeSystem` titles being wrong. The `ValueSet` prefix redundancy is a style issue rather than a correctness bug — it does not produce incorrect output. A narrower change minimises diff size and risk for a ballot-period correction.

---

### Disposition C: Decline

#### Proposal

Do not change the titles. Accept the current state as a non-blocking style inconsistency.

#### Justification

Not justified. The `"ValueSet: "` prefix on `CodeSystem` resources is objectively incorrect and will appear verbatim in the published specification, misleading readers and tools that consume the IG. Declining a clearly valid Technical Correction on style grounds is inadvisable.

---

### Recommendation

**Recommended disposition: A**

The reporter is correct, and the fix is mechanical with no design decisions required. Applying Disposition A (fix all eight affected titles) eliminates both the genuine error (CodeSystem titled as ValueSet) and the redundant prefix on ValueSets in a single consistent pass. The change carries zero semantic risk — only the human-readable `Title` field is altered; IDs, URLs, and code definitions are untouched. This should be straightforward to apply before the next ballot publication.

---

## Next Steps

Ready for implementation.

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated
