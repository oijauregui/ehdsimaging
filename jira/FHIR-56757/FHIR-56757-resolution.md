# Proposed Resolution for FHIR-56757

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56757 |
| Issue Type | Change Request |
| Summary | 11-code CodeSystem for DICOM concepts duplicates fhir.dicom; remove duplicates |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The IG defines an 11-code CodeSystem for DICOM concepts it considers missing FHIR representations (SOP Instance UID, Study UID, Series UID, Irradiation Event UID, Accession Number, Modality, Manufacturer Class UID, Device Serial Number, etc.). Several of these concepts have canonical representations in fhir.dicom (listed as an IG dependency), or in the DICOM-defined FHIR IG. Creating a parallel locally-scoped code system for identifiers that are already standardized risks implementation divergence — two producers could legitimately code the same concept using different systems. No retirement plan or deprecation path is documented.

Proposed resolution:

Remove custom codeset values for which there is a standard codeset you could use instead.

Reporter(s): Dan Schon, Epic

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
