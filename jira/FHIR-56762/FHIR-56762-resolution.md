# Proposed Resolution for FHIR-56762

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56762 |
| Issue Type | Change Request |
| Summary | SHOULD:able-to-populate on derivedFrom is unclear; remove or specify a narrower pattern |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The Observation: Imaging Finding resource includes an obligation of SHOULD:able-to-populate for the derivedFrom element. The obligation is unclear as to what is expected of a compliant actor.

As it is a SHOULD obligation, simply not doing it is valid now, but it is unclear what a fully supporting actor is expected to be doing — when derivedFrom is expected to be populated.

It seems strictly valid to mark every study finding as derivedFrom the ImagingStudy, but one could also track the derivation source of each finding back to a specific DICOM instance. Expecting this to be followed as is seems unlikely to result in useful derivedFrom values, as there are no specific recommendations on when it should be populated.

Proposed resolution:

Remove the SHOULD:able-to-populate obligation, and defer recommending this field until a narrower derivedFrom pattern is determined.

Reporter(s): Calvin Crino, Epic

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Triaged**
- Resolution: **Unresolved**
- Classification: **Pending Governance Review**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Triaged and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Triaged → Awaiting Governance Review*  
