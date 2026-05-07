# Proposed Resolution for FHIR-56195

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56195 |
| Issue Type | Change Request |
| Summary | Validator does not like event-basedon extension |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Composition: Imaging Report |
| Reporter | Bas van den Heuvel |
| Assignee | Unassigned |
| Created | 3/30/26 |


## Description

During the IHEeu connecthaton we have been testing the European EHDS implementation guides. During validation of FHIR R4 compositions and interesting error appeared.

The Composition instance uses the extension "http://hl7.org/fhir/StructureDefinition/event-basedOn" to refer to the order that resulted in the report.

In the FHIR R4 specification, this extension is defined in https://www.hl7.org/fhir/R4/extension-event-basedon.html and limits the use to Condition.

In the extension specification, this extension is defined in https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-event-basedOn.html and allows it to be used on many other resources including Composition.

When validating instances of Composition using this extension (extension pack is included in the IG), the validator fails with the remark that this extension is not allowed on Composition. What is the correct behavior in this situation? Should the extension pack overrule the R4 specification or is it the other way around?

 

This topic has been raised on zulip is and is discussed in #implementers &gt; Use of Composition.extension[event-basedOn]

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
