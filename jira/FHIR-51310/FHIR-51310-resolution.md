# Proposed Resolution for FHIR-51310

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51310 |
| Issue Type | Change Request |
| Summary | Clarify Composition.InformationRecipient Usage |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Imaging Composition [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/27/25 |


## Description

As written, usage of Composition.InformationRecipient is ambiguous. It could be:


(1) System recipient of the report: This suggest a separate composition should be generated per party that has queried for DiagnosticReports. This assumes a deployment or transaction, Imaging Report data exists at rest regardless of where it fits in a transaction.

(2) Clinical Recipient: this could represent the intended recipient of the DiagnosticReport (Original Requestor / Authorizing Provider for the Imaging).

If this intent is (1), we suggest including this instead in transaction-level metadata (or logging component). 

If the intent is (2), we suggest representing this in DiagnosticReport.author and removing the extension from Composition. If it must be included in the Composition as well, this should be constrained to match the source in DiagnosticReport.


Related:
FHIR-51204 Information Recipient should include more guidance on Composition specific use-case - Jira

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
