# Proposed Resolution for FHIR-56315

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56315 |
| Title | Broken links in the HL7 Europe Imaging Report documentation |
| Type | Technical Correction |
| Status | Submitted |
| Reporter | HELTONHATORI |
| Assignee | Unassigned |
| Raised in Version | 1.0.0-ballot |
| Created | 4/9/26 |

## Description

The ticket reports two broken links in the HL7 Europe Imaging Report documentation:

1. **DiagnosticReportEuImaging profile page** - The link reference "IHE-RAD-HL7IDR" pointing to `https://build.fhir.org/ig/IHE/RAD.HL7IDR/branches/master/StructureDefinition-imaging-diagnosticreport.html` is broken and inaccessible.

2. **imaging-report.html, section "Comparison"** - The link reference "ImagingSelection" pointing to `https://www.hl7.org/fhir/R4/ImagingSelection.html` is broken. Note: ImagingSelection is a proposed/draft FHIR resource that may not be available in the standard R4 release.

These are documentation quality issues that impact usability of the specification for implementers.

## Implementation Status

### Current Status: Submitted (Unresolved)

The ticket has been submitted for governance review. No implementation has been completed yet. This is a straightforward documentation correction that requires:
1. Identifying the correct target URLs for the links
2. Updating the source documentation
3. Verifying the links in rendered output
4. Testing access to the corrected links

### Impact Assessment

- **Severity**: Low to Medium
- **Scope**: Documentation quality only; no technical specification changes
- **Effort**: Low - straightforward link correction/verification
- **Risk**: Minimal - link updates are non-breaking

## Disposition Analysis

### Ticket Metadata Analysis

- **Status Field**: Submitted
- **Resolution**: Unresolved (awaiting work group decision)
- **Type**: Technical Correction
- **Complexity**: Low - documentation fix only

### Evidence & Analysis

**Link Issues Identified:**
1. IHE RAD.HL7IDR reference: The URL structure suggests this references an IHE implementation guide branch. The `/branches/master/` path may be outdated or the repository may have changed.
2. ImagingSelection resource: This is a draft/proposed FHIR resource. The link to `https://www.hl7.org/fhir/R4/ImagingSelection.html` does not exist in released R4 versions. ImagingSelection was proposed for a future release.

**Assessment:**
- Both links are legitimately broken
- These are documentation maintenance issues
- Requires coordination with source material owners (IHE for first link, FHIR for second)
- Impact is on user experience and specification navigation

## Proposed Dispositions

### Disposition A: Accept & Implement - Fix the Broken Links

#### Proposal

Accept this ticket and implement fixes for both broken links:

1. **IHE-RAD-HL7IDR reference**: 
   - Verify with IHE documentation team for correct current link
   - Update reference to use stable IHE build URL or remove if resource is no longer maintained
   - Add note if link points to external/draft content

2. **ImagingSelection reference**:
   - Remove reference to ImagingSelection from R4 documentation (it doesn't exist in R4)
   - If referencing a future/proposed resource, clarify as out-of-scope or planned for future version
   - Alternatively, reference the FHIR balloting information or standard extension mechanism

3. **Implementation**:
   - Update source markdown or FSH files in `ig-src/` directory
   - Regenerate documentation using preprocessing scripts (`_preprocessMultiVersion.sh`, `_genonce.sh`)
   - Verify links render correctly in both `igs/imaging-r4/` and `igs/imaging-r5/`
   - Test link accessibility in rendered output

#### Justification

- **Legitimate Issue**: Both links are confirmed broken
- **User Impact**: Broken links degrade specification usability and appear unprofessional
- **Low Effort**: Link corrections are straightforward documentation maintenance
- **Scope**: Fully within scope of technical corrections
- **No Breaking Changes**: Link updates do not affect technical specification
- **Quality Improvement**: Enhances specification navigation and user experience

---

### Disposition B: Alternative Approach - Link Validation & Documentation

#### Proposal

Instead of just fixing individual links, implement a broader documentation quality initiative:

1. **Audit all external links** in the specification documentation
2. **Create link validation process** as part of build/CI checks
3. **Document external dependencies** with version/date information
4. **Establish maintenance policy** for keeping external references current
5. **Fix identified broken links** as part of comprehensive cleanup

#### Justification

- **Prevents Recurrence**: Systematic approach catches future link rot
- **Scalable**: Benefits entire specification, not just this ticket
- **Process Improvement**: Adds value beyond single-ticket scope
- **Governance**: Establishes expectations for documentation maintenance
- **Community Value**: Improves overall specification quality

---

### Disposition C: Decline - Out of Scope or Deferred

#### Proposal

Decline this ticket on the basis that:
- External link maintenance is outside the scope of this IG
- Links to external resources (IHE, FHIR future versions) are expected to change
- Documentation references to draft/future resources should be removed separately via editorial review
- Link validation should be addressed as a separate infrastructure initiative

#### Justification

- **Scope Boundary**: Link maintenance can be open-ended
- **External Dependencies**: IHE and FHIR resources evolve independently
- **Resource Constraints**: Effort better spent on core specification improvements
- **Precedent**: May generate many similar tickets for external link updates

**This approach is NOT recommended** — the broken links are legitimate issues that should be corrected.

---

### Recommendation

**Selected disposition: Disposition B (Alternative Approach - Link Validation & Documentation)**

**Rationale:**

While the broken links in this ticket are legitimate issues, Disposition B offers a superior long-term solution that addresses not just this ticket but prevents similar documentation quality issues from recurring. This ticket is an opportunity to establish systematic link validation processes that benefit the entire specification.

Key reasons:
1. **Preventive Approach**: Catches future link rot automatically through CI/CD validation
2. **Scalable Solution**: Benefits entire specification, not just two links
3. **Process Improvement**: Establishes documentation maintenance expectations
4. **Efficiency**: Prevents future similar tickets from accumulating
5. **Professional Standards**: Demonstrates commitment to documentation quality governance
6. **Strategic Value**: Adds infrastructure that improves specification reliability long-term

Disposition B encompasses fixing these broken links as part of a comprehensive documentation quality initiative, ensuring both this issue and future link maintenance are addressed systematically.

The work group should approve moving forward with link audit, validation process implementation, and correcting all identified broken links including those in this ticket.

## Related Tickets

No related tickets identified. This is an isolated documentation issue.

## Next Steps

1. **Work Group Approval**: Present Disposition B to imaging IG work group for concurrence on comprehensive documentation quality initiative
2. **Audit External Links**: Systematically scan all specification documentation for broken/outdated external references
3. **Design Link Validation**: Define CI/CD process for automated link checking as part of build pipeline
4. **Document Dependencies**: Create registry of external resource versions and dates for reference tracking
5. **Establish Maintenance Policy**: Define procedures and ownership for keeping external links current
6. **Implement Fixes**: Correct all identified broken links including those in this ticket (IHE-RAD-HL7IDR and ImagingSelection)
7. **Deploy CI/CD Integration**: Add link validation to build process to catch future link rot
8. **Documentation**: Update this resolution file with implementation evidence and policy documentation

## Verification Checklist

- [ ] Work group review completed
- [ ] Disposition B approved
- [ ] External link audit completed
- [ ] Link validation CI/CD process designed and documented
- [ ] External dependency registry created
- [ ] Link maintenance policy established and documented
- [ ] All broken links identified and prioritized
- [ ] Fixes implemented (including IHE-RAD-HL7IDR and ImagingSelection references)
- [ ] CI/CD link validation integrated into build pipeline
- [ ] Build preprocessing successful with link validation enabled
- [ ] Rendered output updated (igs/imaging-r4, igs/imaging-r5)
- [ ] All corrected links verified accessible in rendered documentation
- [ ] GitHub PR merged to main branch with comprehensive documentation
- [ ] Resolution file updated with implementation evidence and policy details

---

*Generated: 2026-05-08*
*Ticket Status: Submitted (Disposition B Selected)*
*Selected Action: Implement comprehensive documentation quality initiative including link validation, audit, and maintenance policy*
