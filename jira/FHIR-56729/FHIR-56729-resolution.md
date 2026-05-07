# Proposed Resolution for FHIR-56729

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56729 |
| Issue Type | Change Request |
| Summary | Extend ObservationFindingEuImaging value set with OBX-3-style codes (Impression, Narrative, Addendum, …); remove DR extensions that duplicate result |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

Currently it can be challenging to identify the role of the different Observations referenced from a DiagnosticReport.

We recommend expanding the code-system to call out additional types of expected observations — for example, the report text as an Impression, Narrative, Addendum, similar to the common values sent in OBX-3 for HL7 v2. This will improve the ability of recipients to parse the DiagnosticReport and its observations. Examples are: Addendum, Disclaimer, IR Event Notes, Impression, Narrative, Result Report, Study Notes, Wet Read, Discrete Study Findings.

Separately, DiagnosticReport contains a significant number of extensions that are duplicative with base resource content. For example, Finding and Impression should be observations with specific codes referenced from DiagnosticReport.result; Comparison should likely be a reference from .supportingInfo; PatientHistory should be a reference to supportingInfo.

Proposed resolution:

Extend the code system bound to ObservationFindingEuImaging.code with the codes above.

Remove duplicative extensions on DiagnosticReportEuImaging in favor of representing the content via result (with the extended codes) and supportingInfo.

Reporter(s): Brian Swinkels, Epic

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
