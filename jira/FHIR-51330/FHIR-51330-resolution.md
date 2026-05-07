# Proposed Resolution for FHIR-51330

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51330 |
| Issue Type | Change Request |
| Summary | Documentation of complications that occur during the procedure |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM Imaging Procedure [deprecated] |
| Reporter | Alexander Zautke |
| Assignee | Unassigned |
| Created | 6/28/25 |


## Description

Resource profile: https://build.fhir.org/ig/hl7-eu/imaging/StructureDefinition-ImComposition.html

Where can Complications that occur during the procedure be documented? In Germany, the DIN 25300-1 norm for the imaging report ist mainly free text and has one general section for complications.

Examples for complications are: 

	an adverse reaction to a medication administered as part of the procedure




	the patient falls from the examination table 




	the patient is claustrophobic and needed multiple attempts to undergo an MRI




	post-biopsy bleeding 




	contrast leaking into soft tissue due to IV misplacement




	artifact caused by an aneurysm clip



These examples are chosen to demonstrate the very wide range of complication-categories. We find it hard to map the complete general german complications-section to a specific element or section in the HL7 Europe Imaging Study Report. Maybe an additional section for documenting Complications would be beneficial also for the HL7 Europe Imaging Study Report.

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
