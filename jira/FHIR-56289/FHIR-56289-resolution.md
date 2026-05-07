# Proposed Resolution for FHIR-56289

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56289 |
| Issue Type | Change Request |
| Summary | Further refinement needed (in alignment with MADO) on imaging order |
| Status | Triaged |
| Resolution | Persuasive |
| Related Artifacts | Identifier: Accession Number |
| Reporter | Bas van den Heuvel |
| Assignee | Unassigned |
| Created | 4/7/26 |


## Description

We need to be able to support:

	multiple orders with each its own accession number
	each accession number needs its own (global) issuer - oid or CodingSchemeDesignator
	orders need to be able to have one or more order and placer identifier/number, each can have its own issuer



Further explanation is needed how to deal with multiple order and accessionnumbers.

Order numbers are global numbers (can have a system/codingSystem...).

Further description of the use cases is in the MADO spec.

Where possible, the coding of this in the specification needs to be the same/aligned with MADO.

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Triaged**
- Resolution: **Persuasive**
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
