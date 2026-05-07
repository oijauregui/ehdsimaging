# Proposed Resolution for FHIR-56587

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56587 |
| Issue Type | Change Request |
| Summary | Please revise composition profile |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Composition: Imaging Report |
| Reporter | Giorgio Cangioli |
| Assignee | Unassigned |
| Created | 4/28/26 |


## Description

85430-7 is a panel not a doc, please check its usage
	do not use self-invented concepts, mainly when defined in guide not published yet. A comment to remove that code system has been added in eu data API IG.
	in absence of an applicable concept remove the category:imaging slice
	 set category:imaging 0..
	Subject should point to Patient EU core and not to a generic resource
	Is AdverseEvent needed as slice in the procedure section ? I suppose “the” entry for this section is just procedure
	Procedure section: not clear the meaning of the entry Radiation-dose slice pointing to a generic resource; is not this already covered by the main entry ? Moreover being the discriminator based on profile this slice should not work when validating.. an AdverseEvent is also a resource.




	section:findings. Slice images and KeyImages may overlap based on DocumentReference. Please fix it 
	Please check the usage of Loinc parts (LP173421-1)

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
