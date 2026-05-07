# Proposed Resolution for FHIR-51290

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51290 |
| Issue Type | Change Request |
| Summary | We Suggest Focusing First on a Core Imaging Dataset, and then Expanding as the Field Gains Experience |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Imaging Adverse Event [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/27/25 |


## Description

Currently, the Composition contains dedicated sections for a large set of data. This includes:

	AdverseEvents
	RadiationDose
	Contrast Medications
	Procedure Phases



We would suggest excluding these from a first version of this guide so that the interoperability community can focus on the immediate need of making imaging results available and scaling interoperability across the EU. Including this in scope increases complexity and cost and distracts from the immediate goal of making reports available.

As detail:

	Workflows vary significantly for how AdverseEvents are tracked, and how this is reflected in imaging. If a patient has a minor adverse reaction, the imaging may proceed (in which case, the reaction likely is not relevant), it may lead to a change of procedure, or it may result in the imaging being stopped. Since we expect that only completed procedures will be shared across borders, this information is rarely relevant to interpreting results. If the goal is to help recipient systems place better orders themselves (identify an appropriate protocol for the patient, understand why alternatives protocols were not used) this could be added at a later date after the implementer community has realized the immediate goal of ensuring images are available at the point of care.
	Radiation Dose – this information should generally originate from the PACS. Most EHRs also have only limited ability to track radiation dose; they may support free text fields, DICOM SR templates for CT radiation dose, or measurements from the legacy DICOM MPPS standard, but adoption is generally low, and the PACS will have more accurate information.
	
		This European Radiology survey (Question 8) recommends dose data should be included in a separate dose tracking system rather than in the Report.
		Alternatively, if data must be communicated to the EHR, we recommend letting the Home - Radiation Dose Summary for Diagnostic Procedures on FHIR v1.0.0 IG further develop the FHIR mapping of this data.
	
	
	Contrast - while it is important for viewers of imaging to know whether contrast was used with a procedure, this is often reflected in the performed procedure code (the Procedure resource) and in the radiologist’s textual narrative. Discretely sharing information regarding medications is a large increase in scope for minimal benefit.
	Procedure Phases – generally, results are generated for imaging as a whole: there are not separate results for imaging that occurred without contrast and imaging that occurred with contrast. If documented, this information is present in the DICOM data already, and we do not expect that requesting clinicians would wish to query only for the imaging of the ‘non-contrast’ portion, without obtaining images from the broader study or key images.

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
