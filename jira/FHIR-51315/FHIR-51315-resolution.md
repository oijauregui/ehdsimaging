# Proposed Resolution for FHIR-51315

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51315 |
| Issue Type | Change Request |
| Summary | Imaging Manifest Encoding - Prefer ImagingStudy over DICOM KOS |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM ImagingStudy Manifest [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/27/25 |

**Related:**
- Grouping: [manifest]


## Description

Adding a note for a point not directly addressed in this IG. We’re aware that there have been discussions about leveraging DICOM KOS for the imaging manifest rather than use of ImagingStudy resources.

We believe ImagingStudy resources are the better approach. DICOM KOS requires that the parties be able to decode a DICOM binary, rather than a simpler object in JSON which is widely understood. We expect that there will be use-cases where groups will wish to have a non-DICOM compatible consumer, such as:

	An exchange gateway (such as that handling other EHDS exchange)
	A patient application wishing to share images to patient 
	A clinician app that wants to pull in image thumbnails before loading the complete image
	A clinician app that wants to know an imaging study happened "patient has had a CT head last year" before loading those images



Choosing ImagingStudy as the single encoding simplifies implementation for those cases, while still maintaining support for DICOM workstations via WADO-RS fetches.

Requiring manifest providers to support both approaches adds burden to source systems, and increases the specification work to keep manifest encodings in sync.

Allowing either reduces the source burden but keeps the spec burden and adds burden to consumer systems who need to support both to get a complete set of data.

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: [[manifest]]  

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
