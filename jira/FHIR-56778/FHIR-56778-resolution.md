# Proposed Resolution for FHIR-56778

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56778 |
| Issue Type | Question |
| Summary | Clarification on Composition.type and Composition.category |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Composition: Imaging Report |
| Reporter | HELTONHATORI |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

We request clarification regarding what is expected for the Composition.type and Composition.category elements. What is the intended purpose of these elements? Is the idea to group imaging reports by the various imaging specialties?

Currently, we use the following LOINC codes to categorize imaging studies:

26441-6 – Cardiology studies (set)
27895-2 – Gastroenterology endoscopy studies (set)
27897-8 – Neuromuscular electrophysiology studies (set)
26442-4 – Obstetrical studies (set)
27896-0 – Pulmonary studies (set)
18726-0 – Radiology studies (set)
28620-3 – Urology studies (set)
28619-5 – Ophthalmology/Optometry studies (set)

In our view, the ValueSet "Radiology Report Types" used for .type does not make sense for the following reasons:

	It is specific to radiology, whereas imaging can be used for other purposes (e.g., cardiology, endoscopy, etc.).
	The LOINC codes within that ValueSet are too specific. We believe a more generic code such as "Imaging studies" would be more appropriate, similar to the approach taken in the Laboratory guide, which uses a single code: https://build.fhir.org/ig/hl7-eu/laboratory/ValueSet-lab-reportType-eu-lab.html



In our understanding, the Imaging and Laboratory guides should follow the same modeling logic.

We would appreciate your clarification on these points.

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
