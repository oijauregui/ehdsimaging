# Proposed Resolution for FHIR-56720

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56720 |
| Issue Type | Change Request |
| Summary | Clarify that document bundles may be generated on demand and that Bundle.meta.lastUpdated is not a freshness signal for the underlying result |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The Xt-EHR mapping notes that it expects population of meta.lastUpdated.

We strongly suggest adding language to help ensure document consumers understand that the lastUpdated instance of a composition or of a bundle may differ from the last time the DiagnosticReport / underlying real world result was modified.

Many systems may generate the Composition and Bundles on the fly in response to a query.

Note that the content of an EUImagingReport bundle might also change after when a radiologist has last signed a result. The EU ImagingReport bundle contains information such as Communications and Recommendations; it's very common in real world workflows that other users may follow up on these on behalf of a radiologist:


	For example, the radiologist may indicate there is a significant finding (below the level of a critical finding), attempt to call a patient's GP, and then leave a follow-up for their staff or the department that others should attempt to contact the provider.
	Likewise, others involved in a patient's care may add relevant recommendations after seeing the radiologist's report: a mammography coordinator may be the one to specify when a patient should be seen for re-imaging.



If documents are not created on the fly, this imposes storage burden and may lead to the sharing of stale data. Alternatively, there could be logic in the system to ensure a new document is created when underlying content within it changes, but this adds complexity and (depending on attestation requirements) may burden clinical staff by requiring that the radiologist sign off on portions of the assembled document which aren't today under their review.

Proposed resolution:

We would suggest adding language that "it is fully expected that organizations may assemble these document bundles and collections on the fly in response to a request, and that these documents may not be versioned. The lastUpdate for a bundle may not correspond to the last clinical change to a result".

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
