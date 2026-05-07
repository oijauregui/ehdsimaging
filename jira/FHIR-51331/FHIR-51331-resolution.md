# Proposed Resolution for FHIR-51331

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51331 |
| Issue Type | Change Request |
| Summary | Proposal for a separate documentation of medical question and the radiological question |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM Imaging Order [deprecated] |
| Reporter | Alexander Zautke |
| Assignee | Unassigned |
| Created | 6/28/25 |


## Description

Resource profile: https://build.fhir.org/ig/hl7-eu/imaging/StructureDefinition-ImOrder.html

In the German DIN Norm, there is a differentiation between the medical question and the radiological question. 

The medical question ist the one the referring physician is asking, like "coughing and fever, pneumonia?"

The radiological question ist the specific features the radiologist would be then looking for, like "Evaluate for pulmonary infiltrates, pleural effusion, and other signs suggestive of pneumonia."

We mapped the medical question to servicerequest.reason.

	This would also be a reasonable place to map the radiological question to, however, we then run into issues of unclear authorship as the serviceRequest is usually authored by the referring physician.



Therefore, we see a need to be able to create a new version of the order by the radiologist, which is indeed possible to our kowledge. The fields servicerequest.requester would have to be updated to the radiologist's details and servicerequest.reason to the radiological question. Would this be the right way?

	Sometimes, multiple medical questions from different servicerequests result in the same procedure. For example, "Cough and fever, pneumonia?" and "History of malignancy, rule out pulmonary metastases?" would both result in one single chest CT, while  "Cough and fever, pneumonia?" alone would more probably result in an X-Ray. In this case, we would reference multiple ImagingOrder resources in the order-section. Would this be the right way?

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
