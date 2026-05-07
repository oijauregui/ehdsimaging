# Proposed Resolution for FHIR-51357

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51357 |
| Issue Type | Comment |
| Summary | Feedback regarding imaging procedure |
| Status | Triaged |
| Resolution | Considered - No action required |
| Related Artifacts | IM Imaging Procedure [deprecated] |
| Reporter | Alexander Zautke |
| Assignee | Unassigned |
| Created | 6/30/25 |

**Related:**
- Grouping: [block-vote-5]


## Description

We support that SNOMED CT is proposed as the preferred semantic standard for imaging procedures, as this is in line with the German policy to use SNOMED CT as basic semantic standard for clinical applications. In addition, this aligns with the eHN strategy to adopt international standards in the medical imaging guideline, in this case SNOMED CT and LOINC (e.g. Guideline on the electronic exchange of health data under Cross-Border Directive 2011/24/EU Medical imaging studies and reports – chapter 4 data sets). However, when selecting coding systems, existing standards already in use in the field, such as DICOM, should be considered.

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: [[block-vote-5]]  

## Disposition Analysis

### Current State
- Ticket Status: **Triaged**
- Resolution: **Considered - No action required**
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
