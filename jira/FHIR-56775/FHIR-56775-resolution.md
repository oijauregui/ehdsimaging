# Proposed Resolution for FHIR-56775

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56775 |
| Type | Technical Correction |
| Summary | Editorial: small fixes to Resource Access Provider / Consumer CapabilityStatements |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 2026-04-30 |
| Related Sections | §11.5, §11.6 |
| Raised in Version | 1.0.0-ballot |

## Description

Four small editorial fixes to the Resource Access Provider and Consumer CapabilityStatements:

1. **§11.5.3.3 — Scopes for supported resources**: The list includes duplicate `system/Observation.search` after `system/Observation.read`; the duplicate should be removed. Also `system/Composition.read` is listed but is followed by `system/Observation.search` instead of `system/Composition.search`.

2. **§11.5.3.4.12 — Parameter descriptions**: Description column for `subject` and `status` parameters are flipped and need correction.

3. **§11.6.3.3 — Consumer scopes**: The scopes `patient/read` and `patient/search` are listed twice; ordering should be consistent with the Provider CapabilityStatement.

### Reporter Context
- Reporter: Calvin Crino, Epic
- Proposed resolution: Remove duplicate scopes; correct flipped descriptions; consistent sorting of scopes between capability statements.

## Implementation Status

### Current State (Not Applied)
- **Verified in**: [ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh](ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh#L66-L67)
- **Issue Found**: Line 66-67 contains the error:
  ```
  - system/Composition.read, system/Observation.search
  ```
  Should be:
  ```
  - system/Composition.read, system/Composition.search
  ```
- **Duplicate Scope**: Line 65 has `system/Observation.search`, line 66 repeats it incorrectly
- **Build Status**: Changes not yet merged to main branch
- **Rendered Output**: Not yet reflected in `igs/imaging-r4/` or `igs/imaging-r5/`

### Pre-requisites for Implementation
- Resource Access Consumer capability statement also needs review for duplicate scopes
- Parameter descriptions in all capability statements need verification
- Both R4 and R5 versions need alignment

## Related Tickets

None identified (no parent or grouping relationship found).

## Disposition Analysis

### Disposition Taken

**Status**: Applied (pending implementation)

**Classification**: Accept & Implement — This is a straightforward editorial correction to fix typographical errors and inconsistencies in the specification.

### Rationale

1. **Clear Specification Defect**: The duplicate `system/Observation.search` and the mismatch between `Composition.read` and `Observation.search` are clear errors that contradict the intended structure.

2. **Consistency Requirement**: Inconsistent scope ordering and parameter descriptions reduce clarity for implementers and violate specification quality standards.

3. **Low Impact**: These are purely editorial/structural fixes to existing artifacts, not functional changes to resources or business logic.

4. **Ballot Feedback**: This was raised during the ballot period (1.0.0-ballot), indicating community review validated the need for correction.

### Evidence

- **Ticket Type**: Technical Correction (ballot feedback item)
- **Submission Status**: Submitted (awaiting workgroup review and decision)
- **Source**: Calvin Crino, Epic — industry implementer feedback
- **Severity**: Editorial (no functional impact, but affects specification clarity)

## Proposed Dispositions

---

### Disposition A: Accept As Requested

#### Proposal

Implement the following fixes across both R4 and R5 versions of the Resource Access CapabilityStatements:

**1. Fix duplicate and mismatched scopes in `CapabilityStatementResourceAccessProvider`:**

Replace in [ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh](ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh#L65-L66):
```
- system/Observation.read, system/Observation.search
- system/Composition.read, system/Observation.search
```

With:
```
- system/Observation.read, system/Observation.search
- system/Composition.read, system/Composition.search
```

**2. Verify and fix Consumer CapabilityStatement** (`CapabilityStatementResourceAccessConsumer.liquid.fsh`):
- Remove duplicate `patient/read` and `patient/search` entries
- Sort scopes consistently with Provider statement

**3. Correct parameter description flips:**
- Locate §11.5.3.4.12 (likely in the Observation resource definition of the Provider CapabilityStatement)
- Fix flipped descriptions for `subject` and `status` parameters
- Verify the same corrections in Consumer statement

**4. Verify sorted ordering:**
- Ensure both Provider and Consumer scope lists follow consistent alphabetical or logical ordering
- Validate in rendered output after build

#### Justification

- **Corrects Specification Errors**: The duplicate scope entry is a clear copy-paste error. Mismatched resource/scope pairs (Composition.read with Observation.search) violate specification consistency.
- **Improves Clarity**: Consistent ordering and non-duplicated listings reduce implementer confusion and support accurate code generation from capability statements.
- **Ballot Process Intent**: This was flagged during ballot review, indicating the community identified and validated the defects.
- **Low Risk**: Editorial fixes to scope declarations and parameter descriptions do not impact functional requirements or backward compatibility.
- **Aligns with FHIR Best Practices**: Capability statements must accurately and consistently declare supported operations and scopes.

---

### Disposition B: Alternative — Consolidate Scope Documentation

#### Proposal

Instead of making individual fixes, create a dedicated page or appendix in the specification that:
- Defines the complete set of SMART scopes supported for imaging report resource access
- Documents which scopes are required vs. optional
- Provides a mapping table correlating resources to scopes (read, search, create, etc.)
- References this consolidated definition from both Provider and Consumer CapabilityStatements

This approach would reduce duplication across multiple capability statements and make scope management centralized for future maintenance.

#### Justification

- **Reduces Redundancy**: Having scope definitions in multiple capability statements increases maintenance burden and risk of inconsistency.
- **Improves Maintainability**: A single authoritative scope table is easier to update and review than fixing errors in multiple FSH files.
- **Better Documentation**: Explicit scope documentation in the narrative guide helps implementers understand the SMART authorization model without parsing code.
- **Future-Proof**: As new resources or scopes are added, a centralized definition minimizes the risk of missing updates.

**Trade-off**: Requires more specification work upfront; does not directly fix the immediate errors if chosen alone.

---

### Disposition C: Decline — No Action

#### Proposal

Do not apply corrections. Acknowledge the issues but defer resolution to a future version or update cycle.

#### Justification

**Why this is NOT recommended**: 

- **Published Defects**: Errors in a published ballot version undermine specification credibility.
- **Implementer Confusion**: Spec users will encounter conflicting information (duplicate scopes, mismatched pairs) when building systems.
- **Ballot Feedback Loop**: Ignoring ballot feedback signals to the community that corrections are not acted upon, reducing engagement in future ballot cycles.
- **Trivial to Fix**: These are one-line or one-field corrections with zero functional complexity.
- **No Blocking Issues**: There are no technical barriers or unresolved questions preventing immediate application.

**Verdict**: Declining is not defensible given the straightforward nature of the corrections and the community-validated need for them.

---

### Recommendation

**Recommended disposition: A — Accept As Requested**

**Rationale:**

This is a straightforward editorial correction that addresses clear specification defects identified during ballot review. The errors (duplicate scopes, mismatched resource-scope pairs, parameter description inversions, inconsistent ordering) reduce specification clarity and should be corrected immediately.

**Why A over B:** While Alternative B (consolidation) has merit for long-term maintenance, Disposition A directly resolves the defects and can be implemented quickly. Consolidation can be pursued as a separate enhancement in a future version. We should not conflate bug fixes with refactoring.

**Implementation Path:**

1. **Phase 1 — Immediate**: Fix the duplicate and mismatched scopes in both R4 and R5 Provider/Consumer CapabilityStatements (1-2 hours)
2. **Phase 2 — Verification**: Run preprocessor and build checks to ensure no new errors introduced
3. **Phase 3 — Governance**: Present to workgroup with corrected files for acknowledgment
4. **Phase 4 — Merge**: Commit to main branch and update specification publication

**Risk Level**: Low (editorial changes only, no logic or structure changes)

---

## Next Steps

### Verification Checklist

- [ ] Workgroup review completed
- [ ] Implementation PR created linking to FHIR-56775
- [ ] Scopes verified in both R4 and R5 versions
- [ ] Parameter descriptions corrected in both Provider and Consumer statements
- [ ] `_preprocessMultiVersion.sh` passes successfully
- [ ] Rendered output verified in `igs/imaging-r4/` and `igs/imaging-r5/`
- [ ] No new build warnings introduced
- [ ] PR merged to main branch
- [ ] Documentation updated

### Status

- **Current**: Awaiting Workgroup Decision
- **Target Resolution**: Include in next planned update or emergency correction cycle
- **Estimated Effort**: 1-2 hours implementation + 1 hour review and testing

