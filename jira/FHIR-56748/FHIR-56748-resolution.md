# Proposed Resolution for FHIR-56748

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56748 |
| Title | Provider scopes omit ImagingStudy, Device, and ServiceRequest, but those resources are listed as SHALL/SHOULD/SHALL elsewhere |
| Type | Technical Correction |
| Status | Submitted |
| Reporter | JoshPriebe (Calvin Crino, Epic) |
| Created | 4/30/26 |
| Related Sections | §11.5.3.3, §11.6.3.4.1 |

## Description

The capability statement security section lists authorized scopes for OAuth2/SMART Backend Services access control but **omits three resources that are listed as SHALL/SHOULD in the resource interactions**:

- **ImagingStudy** — marked as `#SHALL` interaction in the resource capability
- **Device** — marked as `#SHALL` interaction in the resource capability  
- **ServiceRequest** — marked as `#SHALL` interaction in the resource capability

This inconsistency applies to both **Provider** (Resource Access Provider) and **Consumer** (Resource Access Consumer) capability statements.

### Current Scope Definition
The security section lists scopes for: AdverseEvent, Patient, Condition, AllergyIntolerance, Observation, Composition, DiagnosticReport, MedicationRequest, MedicationDispense, Encounter, Practitioner, Organization, Procedure, and Provenance.

### Gap
Missing from scopes: `system/ImagingStudy.read`, `system/ImagingStudy.search`, `system/Device.read`, `system/Device.search`, `system/ServiceRequest.read`, `system/ServiceRequest.search`

## Implementation Status

### Current Status: Submitted (Requires Governance Review)

### Source Location
- **File**: `ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh`
- **File**: `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh`
- **Section**: Security description → "Scopes for Supported Resources"
- **Related**: Resource definitions at end of file (ProcedureResource, ServiceRequestResource, ImagingStudyResource, DeviceResource)

### Analysis of Gap

1. **ImagingStudy & Device** are core imaging resources and are appropriately listed with `#SHALL` expectation
2. **ServiceRequest** is required for ordering context (marked `#SHALL`)
3. If servers **must** support these resources (SHALL), then clients **must** request appropriate scopes to access them
4. Omitting these scopes creates ambiguity: Can a client request a scope that's not listed? Should servers grant access without a scope?

## Disposition Analysis

### Security Model Consistency

The SMART Backend Services security model requires:
- **Server side**: Validate that incoming JWT tokens carry appropriate scopes (`system/Resource.read`, `system/Resource.search`)
- **Client side**: Request scopes matching the resources it needs
- **Specification**: Document all scopes that servers **should** support

### Current Inconsistency

| Resource | Resource Interaction | Scope Documented? | Issue |
|----------|----------------------|------------------|-------|
| ImagingStudy | `#SHALL` read, search | ❌ NO | Should be listed |
| Device | `#SHALL` read, search | ❌ NO | Should be listed |
| ServiceRequest | `#SHALL` read, search | ❌ NO | Should be listed |
| Procedure | `#SHALL` read only (no search) | ✓ Listed (no search scope) | Correct for read-only, but ticket #56747 disputes this |
| Provenance | `#SHALL` read only | ✓ Listed (no search scope) | Correct for read-only |

## Related Ticket
**FHIR-56747** addresses a related issue: Procedure, ServiceRequest, and Provenance are currently listed with search parameters as SHALL, but do not have search interactions marked as SHALL. These two tickets should be resolved in concert.

## Proposed Dispositions

### Disposition A: Accept & Implement — Add Missing Scopes

#### Proposal

Update the security documentation in both capability statements to include scopes for ImagingStudy, Device, and ServiceRequest:

**For CapabilityStatementResourceAccessProvider.liquid.fsh** — Update the security.description scopes list to add:
```fsh
* rest[=].security.description = """
...
### Scopes for Supported Resources

Servers SHALL accept scopes for the resources they support:
- system/ImagingStudy.read, system/ImagingStudy.search
- system/Device.read, system/Device.search
- system/ServiceRequest.read, system/ServiceRequest.search
... (existing scopes)
"""
```

**For CapabilityStatementResourceConsumer.fsh** — Similarly update the security.description to include:
```fsh
- system/ImagingStudy.read, system/ImagingStudy.search (if ImagingStudy needed)
- system/Device.read, system/Device.search (if Device needed)
- system/ServiceRequest.read, system/ServiceRequest.search (if ServiceRequest needed)
```

#### Justification

✅ **Correctness**: ImagingStudy and Device are core resources in this specification and have `#SHALL` interactions. They must be accessible, which requires corresponding scopes.

✅ **Completeness**: ServiceRequest is marked `#SHALL` and is essential for order fulfillment context. Without documented scopes, clients and servers lack guidance on authorization.

✅ **SMART Backend Services Alignment**: The FHIR specification and SMART on FHIR documentation require that all supported resources have corresponding scopes documented.

✅ **Security Best Practice**: Explicit documentation of required scopes prevents misunderstandings about access control and reduces implementation errors.

✅ **Consistency**: Aligns resource expectations (SHALL = required support) with authorization mechanisms.

#### Implementation Impact: **LOW**
- Text-only addition to security description
- No structural changes to capability statement
- No impact on existing implementations (clarification only)

---

### Disposition B: Alternative Approach — Reduce Resource Expectations

#### Proposal

Instead of adding scopes, mark ImagingStudy, Device, and ServiceRequest as optional (SHOULD or MAY) rather than required (SHALL):

In the capability statement resource definitions:
```fsh
// Change from:
* insert ImagingStudyResource( #SHALL )
* insert DeviceResource( #SHALL )
* insert ServiceRequestResource( #SHALL )

// To:
* insert ImagingStudyResource( #SHOULD )
* insert DeviceResource( #SHOULD )
* insert ServiceRequestResource( #SHOULD )
```

Then scopes would be documented as conditional: "Servers SHOULD accept scopes for optional resources they support."

#### Justification

⚠️ **Rationale**: If these resources are not universally required, then servers implementing this IG could legitimately not support them, and no scope documentation would be needed.

⚠️ **Trade-off**: Reduces implementation burden on resource-constrained systems and provides flexibility for different deployment scenarios.

⚠️ **Risk**: **Imaging is fundamentally about ImagingStudy**. Marking it as non-mandatory contradicts the core purpose of this IG. **Not recommended**.

#### Implementation Impact: **MODERATE**
- Changes conformance expectations
- May reduce functionality of Resource Access Provider implementations
- Could fragment ecosystem into systems with/without imaging support

---

### Disposition C: Decline — Keep Specification As-Is

#### Proposal

Accept that scope documentation is incomplete but defer to implementers to define scopes using SMART Backend Services conventions. No change to specification.

Rationale: "Scope names follow predictable `system/ResourceType.action` pattern. Implementers can derive needed scopes without explicit listing."

#### Justification

❌ **Problem**: 
- **Violates principle of explicit specification** — This IG should document all requirements clearly
- **Creates ambiguity**: Different vendors might use different scope naming (e.g., `fhirUser:ImagingStudy:read` vs `system/ImagingStudy.read`)
- **Reduces interoperability**: If scopes are not standardized across servers, clients cannot reliably request access
- **Does not follow precedent**: This IG already documents scopes for other resources; consistency demands documentation for imaging core resources

❌ **Not recommended** — The gap is a clear technical oversight that impedes interoperability.

#### Implementation Impact: **NEGATIVE**
- Perpetuates ambiguity in authorization
- Increases likelihood of implementation incompatibilities
- Fails to document required security boundaries

---

### Recommendation

### Disposition Selection

**Selected Disposition:** **A — Accept & Implement — Add Missing Scopes**

**Decision Status:** Selected for implementation

**Recommended disposition: A — Accept & Implement**

**Rationale:**

ImagingStudy, Device, and ServiceRequest are **core resources** in the EEHRxF Imaging Report specification (marked `#SHALL` for interactions). If a server must support these resources, clients must be able to request OAuth2 scopes for them. The specification currently fails to document these scopes, creating:

1. **Gaps for implementers** — Developers must guess at scope names
2. **Interoperability risk** — Different vendors may use different scope conventions
3. **Security ambiguity** — Scope validation logic becomes non-normative and inconsistent

**This is a genuine technical correction** — no design changes needed, only completing the documentation that the current architecture already implies.

**Parallel resolution with FHIR-56747:** Both tickets address inconsistencies between resource expectations and documentation. They should be resolved together:
- **FHIR-56748** (this ticket): Adds missing scopes for resources that have SHALL interactions
- **FHIR-56747** (related): Clarifies search parameter expectations for resources with read-only access

**Next Steps:**
1. ✅ Add ImagingStudy, Device, ServiceRequest scopes to both capability statements
2. ✅ Verify scope list is complete and accurate
3. ✅ Regenerate specification from liquid templates to confirm scopes render correctly
4. ✅ Merge to master and include in next ballot version

## Related Tickets

No related grouping specified

## Next Steps

1. Present to work group for review and discussion
2. Gather implementer feedback on proposed dispositions
3. Document final decision and rationale
4. If accepted, create implementation task with specific requirements
5. Track implementation in GitHub PRs/commits
6. Update specification and generate updated artifacts

## Verification Checklist

- [ ] Work group review completed
- [ ] Disposition approved
- [ ] Implementation (if accepted) committed to repository
- [ ] Changes verified in main branch
- [ ] Rendered output updated (igs/imaging-r4, igs/imaging-r5)
- [ ] Documentation updated if needed
- [ ] Resolution file finalized and committed

---

*Generated: 2026-05-07T14:25:15.904Z*
*Ticket Status: Submitted*
