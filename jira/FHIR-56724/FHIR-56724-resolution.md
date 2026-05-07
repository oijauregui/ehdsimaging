# Proposed Resolution for FHIR-56724

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56724 |
| Issue Type | Change Request |
| Summary | §3.3.2 flow assumes RIS↔PACS matching by DICOM Study Instance UID; in practice systems use accession number |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

This flow seems to rely on DICOM Study Instance UIDs for matching between the RIS and the PACS. In many cases, these will not match today. RIS systems often don't receive DICOM study instance UIDs back from the PACS or other resulting systems in HL7 v2, and so may only have the Study Instance UID if they were the Modality Worklist Provider.

Today — when a RIS and a PACS communicate about a particular imaging study, they often have to use a combination of accession number, patient identifiers, and even sometimes encounter identifiers. The specification should be updated to clarify expectations for matching. This could impose either a large conversions project on record holders to harmonize data, or prevent the sharing of valuable clinical information.

Proposed resolution:

Support instead using accession number as a shared identifier, but recognize that this might not be unique.

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
