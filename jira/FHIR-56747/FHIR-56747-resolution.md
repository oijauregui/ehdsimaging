# Proposed Resolution for FHIR-56747

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56747 |
| Title | Procedure, ServiceRequest, and Provenance entries on Resource Access Provider/Consumer require search parameters as SHALL even though no search interaction is required |
| Type | Technical Correction |
| Status | Submitted |
| Reporter | JoshPriebe (Calvin Crino, Epic) |
| Created | 4/30/26 |
| Related Sections | §11.5.3.4.1, §11.6.3.4.1 |

## Description

The Resource Access Provider and Consumer capability statements define **search parameters as SHALL** for Procedure, ServiceRequest, and Provenance, but these resources **do not have search interactions marked as SHALL** — they only have read interactions.

This creates a logical contradiction:
- **Search interaction**: NOT marked as required (no SHALL expectation)
- **Search parameters**: Marked as SHALL ("servers must support these search parameters")

### Current State in Capability Statements

```
Resource: Procedure
├─ Interactions:
│  └─ read: #SHALL (required)
│  └─ search: (NOT present or NOT marked as SHALL)
├─ Search Parameters:
│  ├─ status: #SHALL ❌ Contradiction!
│  ├─ subject: #SHALL ❌ Contradiction!
│  └─ ... (other params marked SHALL)

Resource: ServiceRequest  
├─ Interactions:
│  └─ read: #SHALL
│  └─ search: (NOT present or NOT marked as SHALL)
├─ Search Parameters:
│  ├─ status: #SHALL ❌ Contradiction!
│  ├─ subject: #SHALL ❌ Contradiction!
│  └─ ... (other params marked SHALL)

Resource: Provenance
├─ Interactions:
│  └─ read: #SHALL
│  └─ search: (NOT present or NOT marked as SHALL)
├─ Search Parameters:
│  ├─ target: #SHALL ❌ Contradiction!
│  └─ ... (marked SHALL)
```

### Reporter's Point

"If search is not required, no search parameters should be given. If search is optional, it should be listed as either SHOULD or MAY, and the parameters marked as such."

## Implementation Status

### Current Status: Submitted (Requires Governance Review)

### Source Location
- **File**: `ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh`
- **File**: `ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh`
- **Issue**: Resource definitions via template macros (ProcedureResource, ServiceRequestResource, ProvenanceResource)
- **Location**: End of capability statement files where templates are inserted

### Root Cause

Templates for these resources likely define search parameters with `#SHALL` but the interaction macros do not include a search-type interaction marked as SHALL. This creates the logical inconsistency.

## Disposition Analysis

### Capability Statement Semantics

In FHIR CapabilityStatements, there's a clear hierarchy:

1. **Interaction Declaration**: "Can this server/client do this operation?"
   - `interaction[+].code = #read` → supports read
   - `interaction[+].code = #search-type` → supports search
   
2. **Search Parameter Declaration**: "If you search, which parameters work?"
   - Only meaningful if search-type interaction is present

3. **Expectation Levels**: 
   - `#SHALL` = Must support
   - `#SHOULD` = Recommended  
   - `#MAY` = Optional

### The Logical Problem

Declaring search parameters as `#SHALL` without a `#SHALL` search-type interaction means:
- ❌ Ambiguous: "Must support searching, but can I search?" 
- ❌ Contradictory: "Parameters are mandatory, but the operation is optional?"
- ❌ Confusing: Violates principle that you only document parameters for operations that exist

### Valid Interpretations

**Option 1**: Search IS required
→ Add `interaction[+].code = #search-type` with `#SHALL` expectation
→ Keep search parameters as `#SHALL`

**Option 2**: Search is NOT required
→ Remove search parameters entirely  
→ Keep only read interaction

**Option 3**: Search is OPTIONAL
→ Add `interaction[+].code = #search-type` with `#SHOULD` or `#MAY`
→ Change search parameters to `#SHOULD` or `#MAY`

Current state is **none of the above** — it's self-contradictory.

## Related Ticket

**FHIR-56748** (related): Addresses missing scopes for resources with SHALL interactions. These tickets should be resolved together:
- **FHIR-56747** (this ticket): Clarifies search interaction expectations
- **FHIR-56748**: Adds missing OAuth2 scopes for resources

### Dependency Chain

If we mark ServiceRequest search as SHALL (Option 1):
→ Then FHIR-56748 must add `system/ServiceRequest.search` scope
→ Both changes are necessary for consistency

If we remove ServiceRequest search entirely (Option 2):
→ Then FHIR-56748 should NOT add search scope for ServiceRequest
→ Only add read-only scope: `system/ServiceRequest.read`

## Proposed Dispositions

### Disposition A: Accept & Implement — Add Search Interactions

#### Proposal

These three resources **should support search** because:
- **Procedure**: Essential for querying imaging procedures (by date, status, subject)
- **ServiceRequest**: Critical for finding outstanding orders (by patient, status, date)
- **Provenance**: Useful for auditing and verifying resource origins

**Action**: Add search-type interactions with corresponding expectations:

**For Procedure and ServiceRequest** (mark as `#SHALL`):
```fsh
* rest[=].resource[+].type = #Procedure
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL

// ADD THIS:
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Search for Procedure resources"

// Keep search parameters as #SHALL:
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].searchParam[+].name = "subject"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
```

**For Provenance** (mark as `#SHOULD`):
```fsh
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].interaction[=].documentation = "Search for Provenance resources (optional)"

// Change search parameters to #SHOULD:
* rest[=].resource[=].searchParam[+].name = "target"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
```

#### Justification

✅ **Use Case Alignment**: 
- Querying Procedures by status/date is a common clinical workflow
- Finding ServiceRequests is essential for order fulfillment
- Provenance search is useful but less critical

✅ **Consistency**: 
- Other clinical resources (Condition, DiagnosticReport) have both read AND search-type interactions
- Brings Procedure and ServiceRequest into alignment with expected capabilities

✅ **Interoperability**:
- Clients can reliably search for active orders and pending procedures
- Scope documentation (FHIR-56748) becomes complete and consistent

✅ **IG Purpose**: 
- EEHRxF is about integrated cross-border imaging
- Searching for procedures/orders is a fundamental need

#### Implementation Impact: **MEDIUM**
- Adds search support to server implementations
- Minimal burden (standard FHIR search patterns)
- Improves functionality for real-world use cases

---

### Disposition B: Alternative Approach — Remove Search Parameters Entirely

#### Proposal

If search is truly optional or out of scope, **remove all search parameter declarations** for Procedure, ServiceRequest, and Provenance. Keep only read interactions:

```fsh
* rest[=].resource[+].type = #Procedure
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
// Remove all searchParam declarations

// Same for ServiceRequest and Provenance
```

Document that clients can only access these resources by ID reference, not by search.

#### Justification

⚠️ **Rationale**: 
- Reduces server implementation complexity
- Sufficient for simple read-by-reference use cases
- Aligns with minimal IG requirements

⚠️ **Trade-off**: 
- **Severely limits usability** — Can't query active orders or recent procedures
- **Breaks common workflows** — "Find all orders for this patient" becomes impossible
- **Not recommended** for an imaging IG that requires order tracking

⚠️ **Inconsistent**: Most other resources in the IG support search; limiting these three is arbitrary.

#### Implementation Impact: **NEGATIVE**
- Reduces functionality significantly
- Forces workarounds for common use cases
- Contradicts typical FHIR implementation expectations

---

### Disposition C: Accept & Implement — Mark Search as SHOULD

#### Proposal

A middle ground: Make search optional but documented for these resources:

```fsh
* rest[=].resource[+].type = #Procedure

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL

// ADD search as SHOULD:
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].interaction[=].documentation = "Servers SHOULD support search for Procedures"

// Update search parameters to SHOULD:
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Same pattern for ServiceRequest and Provenance
```

#### Justification

✅ **Balanced approach**:
- Clarifies that search is possible but not mandatory
- Servers implementing this IG can choose based on capabilities
- Clients can gracefully degrade if search isn't available

✅ **Pragmatic**: 
- Accommodates both rich implementations and minimal deployments
- Search parameters are documented (implementers know what's expected)
- Resolves the current contradiction

⚠️ **Trade-off**: 
- Less normative than `#SHALL`
- Reduces interoperability (some systems will search, others won't)
- Clients must handle search-not-available scenarios

#### Implementation Impact: **LOW-MEDIUM**
- Clarifies optionality
- Allows flexibility for implementers
- May reduce search consistency across deployments

---

### Recommendation

### Disposition Selection

**Selected Disposition:** **A — Accept & Implement — Add Search Interactions as SHALL**

**Decision Status:** Selected for implementation

**Recommended disposition: A — Accept & Implement (Add Search Interactions as SHALL)**

**Rationale:**

1. **Procedure & ServiceRequest should have `#SHALL` search:**
   - Both are essential for real-world imaging workflows
   - Other clinical resources in the IG support search
   - The IG's purpose (integrated imaging exchange) requires order/procedure tracking
   - Scope documentation from FHIR-56748 depends on this decision

2. **Provenance can be SHOULD:**
   - Less critical for primary workflows
   - Still useful for auditing but not mandatory
   - Allows minimal implementations to omit this

3. **Resolves FHIR-56748 dependency:**
   - Adds missing scopes: `system/Procedure.search`, `system/ServiceRequest.search`, `system/Provenance.search`
   - Creates coherent security model
   - Enables proper OAuth2 scope validation

4. **Current state is untenable:**
   - Search parameters marked SHALL with no search interaction is confusing
   - Creates implementation uncertainty and potential incompatibilities
   - Must be fixed before ballot approval

**Coordinated Resolution:**
- **FHIR-56747** (this ticket): Add search interactions to Procedure/ServiceRequest (SHALL), Provenance (SHOULD)
- **FHIR-56748**: Add corresponding scopes to security documentation
- **Both**: Create clear, consistent capability statement

**Implementation Steps:**
1. ✅ Update resource templates (ProcedureResource, ServiceRequestResource, ProvenanceResource)
2. ✅ Add search-type interactions with expectations
3. ✅ Ensure search parameters match interaction expectations
4. ✅ Update security documentation (FHIR-56748)
5. ✅ Regenerate both R4 and R5 capability statements
6. ✅ Verify rendered output in igs/imaging-r4 and igs/imaging-r5
7. ✅ Merge to master for next ballot

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
