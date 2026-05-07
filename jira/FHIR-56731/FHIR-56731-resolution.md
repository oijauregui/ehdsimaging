# Proposed Resolution for FHIR-56731

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56731 |
| Title | Comparison obligation requires a full ImagingStudy resource for prior comparisons; in practice priors are often free-text. Reduce to MAY. |
| Type | Change Request |
| Status | Triaged |
| Reporter | JoshPriebe |
| Created | 4/30/26 |

## Description

Comparison obligation is listed as SHALL for an ImagingStudy resource, but that resource may require elements that are not available for every prior — in some cases, a full result may not be available and these are often documented as free-text in the result instead of discrete values.

## Implementation Status

### Current Status: Triaged

### Disposition Classification

Based on the ticket status and metadata:

- **Status Field**: Triaged
- **Resolution**: Not specified
- **Related Sections**: 11.20.1 DiagnosticReport obligation profile

## Disposition Analysis

### Ticket Metadata Analysis

The ticket is currently classified as **Triaged** and requires governance review to determine final disposition.

### Evidence & Links




## Proposed Dispositions

### Disposition A: Accept & Implement

#### Proposal

Review the technical merits and feasibility of this proposal. If the underlying requirement is valid and aligns with FHIR imaging scope, accept and implement the requested change to the specification or examples.

#### Justification

- The request addresses a legitimate use case in imaging workflows
- Implementation would improve clarity or functionality
- Change is consistent with existing FHIR design principles

---

### Disposition B: Alternative Approach

#### Proposal

Address the underlying need through an alternative mechanism, such as:
- Using extensions instead of core elements
- Applying constraints through a profile
- Implementing in examples rather than core specification
- Different cardinality or data type

#### Justification

- Alternative approach achieves the same goals with fewer breaking changes
- Reduces implementation burden on existing systems
- Better aligns with FHIR architecture principles

---

### Disposition C: Decline

#### Proposal

The request should not be adopted. Clear rationale:
- Out of scope for imaging IG
- Insufficient use cases to justify change
- Addressed by existing mechanism
- Would introduce unnecessary complexity
- Breaking change not justified by value

#### Justification

Provide specific reasoning why declining is the right decision for the FHIR imaging community.

---

### Recommendation

**Recommended disposition:** [A / B / C to be determined by work group]

Work group should review this ticket and supporting evidence to determine the best path forward. Consider:
- Community feedback and use cases
- Alignment with FHIR design principles  
- Implementation complexity vs. value delivered
- Impact on existing implementers

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

*Generated: 2026-05-07T14:25:15.903Z*
*Ticket Status: Triaged*
