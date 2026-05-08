# Proposed Resolution for FHIR-56773

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | FHIR-56773 |
| **Type** | Technical Correction |
| **Status** | Submitted |
| **Resolution** | Unresolved |
| **Reporter** | Brian Swinkels (Epic) |
| **Created** | 2026-04-30 |
| **Raised in Version** | 1.0.0-ballot |
| **Related Sections** | DiagnosticReportEuImaging |

## Description

Ticket Questions why the DiagnosticReportEuImaging profile uses MS (Must Support) cardinality instead of using the obligation framework for defining resource requirements.

## Analysis

### Current Design

The imaging IG employs a **dual conformance strategy**:

1. **DiagnosticReportEuImaging Profile** (`im-diagnosticreport.fsh`)
   - Primary profile inheriting from DiagnosticReport
   - Uses standard FHIR MS (Must Support) cardinality
   - Defines system conformance requirements (what systems must support)

2. **DiagnosticReportObligationEuImaging Profile** (`DiagnosticReportObligationEuImaging.liquid.fsh`)
   - Separate obligation profile constraining DiagnosticReportEuImaging
   - Uses obligation extensions with codes: `SHALL:able-to-populate`, `SHOULD:able-to-populate`, `MAY:able-to-populate`
   - Defines role-specific implementation guidance (what actors must/should do for producer/consumer roles)

### Architectural Rationale

MS and obligations serve **complementary purposes** in FHIR:

| Aspect | MS Cardinality | Obligation Framework |
|--------|---|---|
| **Scope** | System conformance | Role-specific implementation |
| **Question Answered** | What can systems process? | What must actors do? |
| **Audience** | Implementers, system vendors | Business stakeholders, workflow designers |
| **Enforceability** | Conformance test basis | Guidance / documentary reference |
| **FHIR Standard** | Core conformance mechanism | Implementation guide extension |

### Evidence

Both approaches are used complementarily across the IG:
- All key resources have dual profiles (main profile + obligation profile)
- Main profiles establish baseline system requirements
- Obligation profiles layer actor-specific implementation guidance
- Design aligns with IHE-RAD-HL7IDR imaging reporting standards

## Proposed Dispositions

### Disposition A: Refactor to Obligations Only

#### Proposal

Remove MS cardinality from DiagnosticReportEuImaging and migrate all conformance requirements into the obligation profile, using obligation codes for system-level conformance.

#### Justification

- Consolidate all requirements into single location
- Provide more granular control through obligation codes
- Reduce profile duplication

#### Concerns

- **Breaking Change**: Existing implementers expect MS-based conformance statements
- **Architecture Mismatch**: Obligations designed for role-specific guidance, not system conformance
- **Standards Misalignment**: ISO 27558 and IHE standards use Must Support for system conformance
- **Complexity**: Obligation framework would need expansion to cover all system-level requirements

---

### Disposition B: Keep Dual Approach (Recommended)

#### Proposal

Maintain current design with MS in main profile and obligations in constraint profile. The dual approach provides:

1. **Clear Separation of Concerns**
   - MS = system conformance (capability statement baseline)
   - Obligations = implementation workflow guidance (producer/consumer roles)

2. **Standards Alignment**
   - Follows established FHIR and IHE patterns
   - MS conformance enables interoperability testing
   - Obligations enable workflow optimization

3. **Stakeholder Clarity**
   - System vendors see MS requirements for capability statements
   - Integrators see obligation guidance for workflow design
   - Dual approach reduces ambiguity

#### Justification

- **FHIR Architecture**: MS and obligations are intentionally distinct mechanisms
- **Implementation Practice**: Dual approach matches real-world imaging workflows
- **Backward Compatibility**: No breaking changes to conformance baseline
- **Documentation**: Current structure clearly conveys both system and role requirements
- **IHE Alignment**: DiagnosticResource (IHE-RAD-HL7IDR) uses same dual pattern

#### Risks (Mitigated)

- **Confusion**: Add narrative documentation explaining dual approach and when each applies
- **Maintenance**: Both profiles tied by Parent relationship; inheritance ensures consistency
- **Complexity**: Manageable via liquid templating; R4/R5 variants auto-generated

#### Notes

- Consider adding explanatory section to CapabilityStatement page defining MS vs. Obligations distinction
- Current implementation is sound; no code changes required

---

### Disposition C: Obligations Only Alternative

#### Proposal

Migrate to obligation framework exclusively by:
- Removing all MS cardinality from DiagnosticReportEuImaging
- Expanding obligation codes to cover system-level requirements
- Consolidating obligation codes and MS meanings

#### Justification

- Single mechanism for all requirements
- Reduced specification verbosity

#### Risks

- **Standards Misalignment**: Violates FHIR profiling best practices
- **Interoperability**: MS is capability-statement-required concept; obligations are guidance
- **Breaking Change**: Major departure from FHIR conventions
- **Tool Support**: FHIR validators and publishing tools built around MS, not obligations

---

## Recommendation

**Selected Disposition: A (Refactor to Obligations Only)**

**Rationale:**
Consolidate all conformance requirements into the obligation framework to provide a single, unified mechanism for defining resource requirements. This approach leverages the obligation extension system for complete conformance coverage.

**Implementation Approach:**
1. Migrate MS cardinality from DiagnosticReportEuImaging main profile to obligation codes in DiagnosticReportObligationEuImaging
2. Expand obligation codes to cover system-level conformance (not just workflow guidance)
3. Update documentation to explain obligation-based conformance model
4. Verify R4/R5 variants through preprocessing

**Status:** Ready for implementation planning

## Related Tickets

No related grouping specified

## Next Steps

1. Present to work group for review and discussion
2. Gather implementer feedback on proposed dispositions
3. Document final decision and rationale
4. If accepted, create implementation task with specific requirements
5. Track implementation in GitHub PRs/commits
6. Update specification and generate updated artifacts

## Verification Checklist

- [ ] Work group review completed
- [ ] Disposition approved
- [ ] Implementation (if accepted) committed to repository
- [ ] Changes verified in main branch
- [ ] Rendered output updated (igs/imaging-r4, igs/imaging-r5)
- [ ] Documentation updated if needed
- [ ] Resolution file finalized and committed

---

*Generated: 2026-05-07T14:25:15.906Z*
*Ticket Status: Submitted*
