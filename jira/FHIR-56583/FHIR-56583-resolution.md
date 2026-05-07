# Proposed Resolution for FHIR-56583

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56583 |
| Issue Type | Change Request |
| Summary | Revise design considerations |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | Giorgio Cangioli |
| Assignee | Unassigned |
| Created | 4/28/26 |


## Description

Evaluate if to split the content of this page in topic-related dedicated pages




	Evalute to move some design considerations under the introduction menu item




	Fix some typos
	
		represented by one DiagnosticReport and and Composition resource.
		Text in the diagram, they include some html formatting e.g. &lt;p&gt;
	
	
	Current text




	
	
		represented by one DiagnosticReport and and Composition resource.
		the DiagnosticReport will always point to a Composition through a dedicated extension.
This doesn’t seem to be true for unstructured reports, be more explicit on the context where this statement applies
	
	




	§9.4 Representing Healthcare ProfessionalsWhat  is the added value of that picture ? is that really needed ? Suggest to remove




	remove §9.5 Actor requirements and obligationsThe text does not seem to be fully aligned with the actors defined in other parts, also the obligations are mentioned in another page.




	 remove §9.6 Report and Manifest



The section include a link to  Imaging Manifest to a ci build guide, and that likely will not be published. (covered by MADO)

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
