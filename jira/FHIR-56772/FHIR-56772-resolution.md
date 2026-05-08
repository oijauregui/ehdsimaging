# Proposed Resolution for FHIR-56772

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | FHIR-56772 |
| **Type** | Technical Correction |
| **Status** | Submitted |
| **Resolution** | Unresolved |
| **Reporter** | JoshPriebe (Brian Swinkels, Epic) |
| **Assignee** | Unassigned |
| **Created** | 2026-04-30 |
| **Raised in Version** | 1.0.0-ballot |
| **Related Sections** | §9.8 / §9.9 |

## Description

§9.9 seems to differ from the guidance in §9.8 (or is at least confusing alongside it). §9.9 describes the pros and cons of AdverseEvent, AllergyIntolerance, and Condition as individual resources, when §9.8 recommends using both AdverseEvent and AllergyIntolerance.

**Raised by:** Brian Swinkels, Epic
**Issue Category:** Editorial/Guidance Inconsistency

## Implementation Status

**Status:** Pending Governance Review

This is a newly submitted technical correction (submitted 2026-04-30) that has not yet been acted upon. The ticket is awaiting workgroup review to determine the appropriate editorial fix.

### Implementation Details

No implementation evidence available yet. This ticket requires governance review and editorial decision before implementation can proceed.

## Related Tickets

No parent or related tickets identified.

## Disposition Analysis

### Current State

- **Ticket Status:** Submitted
- **Resolution Status:** Unresolved
- **Classification:** Pending Governance Review

### Rationale for Analysis

This is an editorial and guidance inconsistency issue that affects the specification's clarity and usability for implementers. The ticket raises a valid concern about conflicting recommendations between two adjacent sections of the implementation guide. Resolution requires workgroup consensus on the correct guidance approach.

### Evidence

- Reporter: Brian Swinkels from Epic (credible source)
- Type: Technical Correction (indicates the issue affects specification guidance)
- Status: Submitted (awaiting review)
- Specific sections referenced: §9.8 and §9.9 (clearly identified scope)




## Proposed Dispositions

---

### Disposition A: Accept & Implement – Harmonize Guidance

#### Proposal

Clarify and harmonize sections 9.8 and 9.9 to provide consistent, non-contradictory guidance on when to use AdverseEvent, AllergyIntolerance, and Condition in the context of adverse event reporting and allergy/intolerance management.

**Specific actions:**
1. Review §9.8 to confirm the stated recommendation: "use both AdverseEvent and AllergyIntolerance"
2. Review §9.9 to identify why it presents three alternatives without preference
3. Edit one or both sections to ensure:
   - §9.8 rationale is explained
   - §9.9 either removed or clearly presented as historical context / not recommended approach
   - A clear decision tree or rule is stated about when to use each resource
4. Ensure examples in both sections are consistent with the guidance
5. Consider adding a table or flowchart to guide implementers on resource selection

#### Justification

Conflicting guidance in the same specification creates confusion for implementers and reduces adoption quality. Users implementing according to §9.9 may choose different resources than intended by §9.8, leading to data quality issues in exchanged adverse event and allergy information.

**Why this is preferred:**
- **Implementer clarity:** Unambiguous guidance improves specification usability
- **Data quality:** Consistent resource selection across implementations enables better interoperability
- **FHIR principle:** FHIR design guides emphasize clear, non-contradictory guidance for identical clinical concepts
- **Scope:** This is purely editorial—no breaking changes or resource redesign needed
- **Burden:** Editing text and examples is low-impact with high clarity benefit

---

### Disposition B: Alternative Approach – Provide Rationale Context

#### Proposal

Rather than removing or replacing §9.9, restructure both sections to clarify the **design rationale** and **architectural decisions**:

1. Keep §9.8 as the **primary recommendation section** (clear, concise guidance on using both AdverseEvent and AllergyIntolerance)
2. Restructure §9.9 as a **design rationale section** that explains:
   - Why three resources were considered
   - Trade-offs and design alternatives explored
   - Why the recommendation in §9.8 was chosen
   - When alternative approaches might be considered (and why they weren't recommended)
3. Add section headers and cross-references so readers understand the relationship:
   - §9.8: "Recommended Approach: Using AdverseEvent and AllergyIntolerance"
   - §9.9: "Design Considerations and Alternatives" or "Rationale for Resource Selection"

#### Justification

This approach preserves the thoughtful analysis in §9.9 (which demonstrates consideration of alternatives) while making it clear that §9.8 is the authoritative guidance. It educates implementers about design decisions without creating confusion.

**Why this alternative might be preferred:**
- **Maintains intellectual capital:** Doesn't discard analysis work already done in §9.9
- **Educational value:** Helps implementers understand FHIR design thinking
- **Future flexibility:** If new use cases emerge, rationale context helps guide decisions
- **Less destructive:** Restructuring vs. removing reduces risk of losing information

**Trade-offs vs. Disposition A:**
- More text overall, which could increase reader burden
- Requires clear structural differentiation (headers, visual cues) to avoid confusion
- Still achieves the core goal of clarifying the primary recommendation

---

### Disposition C: Decline

#### Proposal

Close the ticket as "Not Persuasive" with the rationale that the current text is acceptable as-is and does not require editorial change. The specification already contains sufficient guidance for implementers to understand the recommended approach, and including design alternatives is valuable context.

#### Justification

**Reasons to decline:**
1. **Readers can infer intent:** The specification already recommends using both AdverseEvent and AllergyIntolerance in §9.8; careful readers will note this as the primary guidance
2. **Design alternatives have value:** Explaining why other resources were not selected helps implementers understand the ecosystem and make informed decisions for edge cases
3. **No breaking changes:** The current text is not incorrect; it is supplementary detail
4. **Specification maturity:** As a 1.0.0-ballot version, including design rationale is appropriate for community feedback and education
5. **Scope creep:** Editorial changes, while low-impact, add to the release scope and may delay ballot completion

**Risk if declined:**
- Some implementers may follow §9.9 guidance and select Condition in isolation, misaligning with §9.8 recommendation
- Reader confusion persists, potentially reducing specification adoption and data quality
- Feedback from this ballot cycle could have been addressed now rather than in a future version

---

### Recommendation

**Recommended disposition:** **Disposition A – Harmonize Guidance**

**Rationale:**

This is a legitimate editorial issue raised by a ballot participant from a major EHR vendor (Epic). The concern is valid: having two adjacent sections give conflicting or unclear guidance about a specific clinical domain is problematic for implementers.

**Why A over B:**
- Disposition A is more direct and achieves the goal with less reader burden
- Clear, concise guidance is a FHIR best practice
- The relative simplicity of the fix (mainly text editing) justifies addressing it in this ballot round
- Removing or clarifying ambiguity now prevents ongoing confusion in production implementations

**Why A over C:**
- While Disposition C minimizes scope changes, it leaves a known usability issue in place
- Epic's feedback suggests this impacts real implementers
- Addressing it improves the specification's quality and implementer experience
- The effort is low relative to the clarity benefit

**Proposed implementation approach:**
1. **Quick review:** Validate with workgroup that the issue is real (by reading both sections in context)
2. **Light editing:** Clarify §9.8 as primary recommendation; restructure §9.9 as rationale or remove the redundant alternatives list
3. **Verification:** Ensure examples in both sections reflect the unified guidance
4. **Ballot feedback:** Note in ballot summary that this issue was addressed per ballot participant feedback

## Next Steps

**Status:** **Awaiting Governance Review**

This ticket is ready for workgroup discussion to select the appropriate disposition. The analysis above provides three clear options with trade-offs explained.

### Verification Checklist

- [ ] Workgroup review completed and disposition selected
- [ ] Sections §9.8 and §9.9 reviewed for current state
- [ ] Editorial change implemented (if Disposition A selected)
- [ ] Examples and guidance harmonized
- [ ] Verification in rendered output (igs/imaging-r4 and igs/imaging-r5)
- [ ] Documentation updated / PR merged
- [ ] Ballot feedback incorporated

---

*Generated: 2026-05-07*  
*Ticket Status: Submitted (Unresolved)*  
*Analysis Complete – Ready for Workgroup Review*
