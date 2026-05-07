# Proposed Resolution for FHIR-51280

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51280 |
| Issue Type | Change Request |
| Summary | HL7 II: Add Invariants ensuring data between resources is aligned |
| Status | Duplicate |
| Resolution | Persuasive |
| Related Artifacts | Imaging Composition [deprecated] |
| Reporter | Bas van den Heuvel |
| Assignee | Bas van den Heuvel |
| Created | 6/27/25 |


## Description

Source: discussions with IHE-IDR and HL7-II during Madrid WGM

Various resources depend on the same base information being present. Where possible and feasible, add invariants ensuring this information is aligned.

Examples include, including references to StudyUID and AccessionNumber are aligned between DiagnosticReport and Composition, …

## Implementation Status

**Status**: Duplicate  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Duplicate**
- Resolution: **Persuasive**
- Classification: **Duplicate**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Duplicate and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

---

### Disposition B: Alternative Approach

#### Proposal

Address the underlying need of the ticket through an alternative mechanism or different approach that differs from what was literally requested.

#### Justification

Alternative approaches may better align with existing patterns, minimize implementation burden, or provide better long-term maintainability while still addressing the ticket's core concern.

---

### Disposition C: Decline

#### Proposal

Decline the request with clear rationale (e.g., out of scope, insufficient use cases, already addressed by existing mechanism, breaking change not justified).

#### Justification

Declining may be appropriate if the change would introduce unnecessary complexity, conflict with design principles, or if existing mechanisms already address the need.

---

## Next Steps

- [ ] Present ticket to imaging work group for review
- [ ] Obtain work group consensus on disposition
- [ ] Assign to implementation team if approved
- [ ] Create GitHub issue/PR for approved changes
- [ ] Link GitHub artifacts in ticket comments
- [ ] Update ticket status upon resolution
- [ ] Document disposition rationale

### Verification Checklist

- [ ] Work group review completed
- [ ] Disposition decision documented
- [ ] Implementation assigned (if approved)
- [ ] GitHub artifacts created (if applicable)
- [ ] Ticket status updated
- [ ] Community notified

---

*Resolution generated: 2026-05-07*  
*Ticket Status: Duplicate → Awaiting Governance Review*  
