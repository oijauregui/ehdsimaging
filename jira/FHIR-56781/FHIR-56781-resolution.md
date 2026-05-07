# Proposed Resolution for FHIR-56781

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56781 |
| Issue Type | Change Request |
| Summary | Expand Imaging Device Type ValueSet to SNOMED 303607000 |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | ValueSet: Imaging Device Type |
| Reporter | HELTONHATORI |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The Imaging Device Type ValueSet (available at DeviceEuImagingType), used by the Device: Imaging Device profile, currently defines its SNOMED CT inclusion logic as follows:

Include codes from http://snomed.info/sct where concept is-a 314789007 (Diagnostic imaging equipment)

This restricts the scope of the ValueSet only to equipment directly classified as "Diagnostic imaging equipment" and its descendants. This modeling focuses on devices whose primary purpose is image acquisition for diagnostic or radiological purposes.

However, this approach presents a limitation for adequately representing imaging examinations performed in contexts such as:

	Pulmonology (bronchoscopy, lung scintigraphy, etc.);
	Gastroenterology (upper digestive endoscopy, colonoscopy, etc.);
	Interventional cardiology (image‑guided procedures such as angioplasty or pacemaker implantation);
	Urology (cystoscopy);
	Ophthalmology (fundoscopy, corneal topography).



In these cases, the device used may not be "diagnostic imaging equipment" in the strict sense of the SNOMED CT classification, but rather general biomedical equipment belonging to the concept 303607000 | Biomedical equipment |.

Nevertheless, many of these devices have the practical ability to generate, process, or assist in the interpretation of images, and are thus an essential part of the imaging examination context being reported.

To make the ValueSet usable in these broader scenarios (which are within the scope of the Imaging guide), we propose changing the SNOMED CT filter logic to:

Include codes from http://snomed.info/sct where concept is-a 303607000 (Biomedical equipment)

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
