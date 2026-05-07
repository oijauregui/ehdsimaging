# Proposed Resolution for FHIR-53153

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-53153 |
| Issue Type | Change Request |
| Summary | In what way to best support PDF's in the report |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | Bas van den Heuvel |
| Assignee | Unassigned |
| Created | 10/15/25 |


## Description

Imaging reports are often exchanged as PDF's. The rendered version of an Imaging composition can also be represented as a PDF (in addition to the Composition.text field).

Currently, both versions are included in the DiagnosticReport.presentedForm field. If the report was generated based on an existing radiology study that is represented by a PDF, this relationship might not be correct.

The pdf does not represent the content of the DiagnosticReport and Composition resource. It is a different version of the same, a subset or a superset of the data.

When the composition is generated from the pdf, this could be specified in Composition.relatesTo or in a Provenance instance.

Does the specification need to address this and if so - in what way?

## Implementation Status

**Status**: Pending Decision  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Submitted**
- Resolution: **Unresolved**
- Classification: **Pending Decision**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Submitted and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Submitted → Awaiting Governance Review*  
