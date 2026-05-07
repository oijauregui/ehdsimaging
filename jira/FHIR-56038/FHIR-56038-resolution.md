# Proposed Resolution for FHIR-56038

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56038 |
| Issue Type | Change Request |
| Summary | R5 constraint on Observation linkage |
| Status | Resolved - change required |
| Resolution | Not Persuasive with Modification |
| Related Artifacts | Imaging Diagnostic Report [deprecated] |
| Reporter | Bas van den Heuvel |
| Assignee | IgnacioJauregui |
| Created | 3/10/26 |


## Description

In R5, DiagnosticReport has a constraint that is hampering validation of R5 reports.

See https://hl7.org/fhir/R5/diagnosticreport.html#invs

It requires to include in the result section all Observations that are present in the referred Composition.

This has several issues:

	we currently only require inclusion of findings and not impressions
	patient history observations are required to be included as well but are no results.
	there are validator/publisher issues that hamper validation



Proposed solution:

	Require the result field to include all finding and impression observations.
	In R5, observations in the patient history section should be referred to by including an indirection using a List resource.

## Implementation Status

**Status**: Alternative or Pending  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Resolved - change required**
- Resolution: **Not Persuasive with Modification**
- Classification: **Alternative or Pending**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Resolved - change required and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Resolved - change required → Awaiting Governance Review*  
