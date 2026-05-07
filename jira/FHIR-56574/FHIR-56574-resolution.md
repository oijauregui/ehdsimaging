# Proposed Resolution for FHIR-56574

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56574 |
| Issue Type | Change Request |
| Summary | Revise data formats page |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | Giorgio Cangioli |
| Assignee | Unassigned |
| Created | 4/28/26 |


## Description

Please add a short introduction describing what the three cases "Renderable format with minimal metadata"; "Section-structured report with processable narrative" and "Fully structured report"  represent.
	§ 4.2 Section-structured report with processable narrative



“This data structure is the one that should be utilized to map existing implementations that use HL7 V2 messages or DICOM SR containing a CDA or other XML or HTML file as the report content.”

Not clear this sentence I could have CDA or DICOM SR with structured informations in ...


	§ 4.2 Section-structured report with processable narrativeNot clear to me the figure included in this section .. it seems it is representing the case of Fully structured report .. there are finding observations.



Other question: why there is no relationship between composition and results ?

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
