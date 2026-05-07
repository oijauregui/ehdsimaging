# Proposed Resolution for FHIR-51733

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51733 |
| Issue Type | Change Request |
| Summary | Include encounter in the header mapping |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Map for EHDSImagingReportHeader [deprecated] |
| Reporter | HynekKruzik |
| Assignee | Unassigned |
| Created | 8/12/25 |


## Description

Xt-EHR Header Authorship is the only mandatory element containing information about producer of the imaging report. Cardinality of this element is 1..* and includes mandatory author of type EHDSAuthor. EHDSAuthor includes optional Organization element.

This model actually allows inclusion of one or more authors from zero to more organizations and the IG follows this model. This will represent a potential problem with identification of a healthcare provider organization which is actualy releasing a report. And we should resolve this problem according to my opinion. 

In fact, the organization which released the report should be equal to the organization responsible for the respective encounter. If we will agree on this, then we should ensure that encounter information will be always present and contains information about the  organization. 

 

My recommendation is to:

	Adjust cardinality of encounter resource
	Add mapping from header.authorship to the encounter.organization
	Add Obligation for consumer to display encounter organization information
	Provide guidance for displaying of the  report

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
