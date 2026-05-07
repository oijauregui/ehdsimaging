# Proposed Resolution for FHIR-51289

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51289 |
| Issue Type | Change Request |
| Summary | Guidance Should be Provided on Dual Read and Resident Workflows, along with System-Generated Compositions |
| Status | Triaged |
| Resolution | Persuasive |
| Related Artifacts | Imaging Composition [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/27/25 |


## Description

The Composition currently includes several fields related to the originator of the Result and/or Composition. These include:

	Author 1..*
	Attester 0..*
	legalAuthenticator 0..*
	Custodian 0..1



We would suggest providing at least informational guidance on when each of these is used. The cardinalities as specified seem correct, but we expect confusion from implementers.

Note that an Imaging Results Report may have multiple authors – a set of imaging may have been read by authors from different imaging specialties, who then collaborated on a report or each wrote separate sections, or a resident may have been involved. Especially for legacy data (which we believe should be shared if possible to improve care outcomes), the roles of multiple providers on a result may not have been well specified.

We also note that many Compositions will be generated ad-hoc by the system at the time of query, similar to delayed-assembly documents. We should be careful in baking in assumptions that a user is present to send and attest to the document. This is because an EHR may store the data in a format besides FHIR. Even for groups that do have data stored in a FHIR format at rest, they may only have DiagnosticReports today. As such, we suggest guidance for implementers that they should not rely on the presence of an Attester or legalAuthenticator, and direct to DiagnosticReport fields instead.

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Triaged**
- Resolution: **Persuasive**
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
