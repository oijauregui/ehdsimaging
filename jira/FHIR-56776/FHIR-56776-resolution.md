# Proposed Resolution for FHIR-56776

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | FHIR-56776 |
| **Type** | Technical Correction |
| **Status** | Submitted |
| **Resolution** | Unresolved |
| **Summary** | Editorial: section:comparison description text is "History"; should be "Comparison" |
| **Related Sections** | Composition obligation profile |
| **Reporter** | JoshPriebe (Matt Hannan, Epic) |
| **Assignee** | Unassigned |
| **Created** | 4/30/26 |

## Description

The description for `section:comparison` is currently labeled "History" but should be "Comparison".

**Proposed Resolution:** Change the description text to "Comparison".

## Implementation Status

**Status:** Pending Review

This is a technical correction ticket awaiting work group review and approval. The change is editorial in nature with no implementation complexity—a simple text update to correct misleading element documentation in the Composition obligation profile.

**Evidence:**
- Ticket created: 4/30/26
- Type: Technical Correction (editorial)
- Reporter: Matt Hannan (Epic) via JoshPriebe
- No GitHub implementation links present; awaiting approval before implementation

## Related Tickets

- Related Sections: Composition obligation profile (may be related to other Composition-scoped tickets)
- No parent ticket or grouping indicated

## Disposition Analysis

### Disposition Taken

**Pending Governance Review** — This Technical Correction ticket requires work group review and approval before implementation.

### Rationale

1. **Clear Editorial Issue**: The description mismatch ("History" vs. "Comparison") is a definite error that needs correction
2. **Low Risk**: Minimal change surface (single text field)
3. **Reporter Credibility**: Reported by Epic (via Matt Hannan), a major implementer
4. **Technical Correction Process**: Proper channel for editorial fixes

### Evidence

- Status: **Submitted** (awaiting review)
- Resolution: **Unresolved** (no approval recorded)
- Type: **Technical Correction** (appropriate classification)
- Issue Impact: Affects Composition obligation profile documentation

---

## Proposed Dispositions

### Disposition A: Accept As Requested ✓ RECOMMENDED

#### Proposal

**Change the `section:comparison` element description from "History" to "Comparison"** in the Composition obligation profile definition.

**Location:** The Composition resource definition, specifically the `section` element with code "comparison", description/documentation field.

**Change:**
- From: "History"
- To: "Comparison"

#### Justification

1. **Semantic Accuracy**: The element code is explicitly "comparison" (not "history"), so the description must match the semantic intent
2. **Documentation Clarity**: Implementers relying on the documentation will be correctly guided to use this section for comparative analysis, not historical narrative
3. **No Breaking Changes**: This is a documentation-only fix with no impact on data structures, processing logic, or backwards compatibility
4. **Low Effort**: Trivial change affecting only description text
5. **Clear Principle**: FHIR documentation must accurately reflect resource semantics—misaligned descriptions are defects

---

### Disposition B: Alternative Approach (Review for Completeness)

#### Proposal

Before accepting Disposition A, verify:
- Whether other Composition section descriptions have similar accuracy issues
- If this is isolated to `section:comparison` or part of a broader documentation maintenance issue
- Whether the profile defines specific cardinality, bindings, or constraints for this section that also need review

**Proposed Action:** Accept the "Comparison" text change as proposed in Disposition A, but conduct a focused audit of all Composition section descriptions for consistency.

#### Justification

While the immediate fix is straightforward, this ticket may be a symptom of documentation drift. A parallel review of related Composition sections ensures no other similar misalignments exist. This preserves the timeliness of the current fix while improving overall profile quality.

---

### Disposition C: Decline

#### Proposal

Do not change the description; keep it as "History".

#### Justification

**Not recommended.** There is no defensible reason to retain "History" as the description for an element coded as "comparison". Declining would leave an inconsistency in place, confusing implementers and violating the principle that documentation should match the resource semantics.

---

### Recommendation

**Recommended disposition:** **Disposition A — Accept As Requested**

**Rationale:**
This is a clear editorial correction with no technical risk. The element code "comparison" unambiguously indicates the intended use case, and the current description "History" is factually incorrect. The fix is a simple text update that improves documentation accuracy with zero implementation impact.

Disposition B (audit for completeness) may be a good complementary activity for future maintenance, but should not delay acceptance and implementation of this fix.

---

## Next Steps

**Status:** Ready for Work Group Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Disposition approved by governance
- [ ] Implementation code committed (text change to profile definition)
- [ ] Verification in main branch and rendered output (`igs/imaging-r4` and `igs/imaging-r5`)
- [ ] Documentation updated (if any implementation guide commentary needed)
- [ ] Resolution record marked "Applied" and linked to PR/commit

### Implementation Guidance

**When approved:**
1. Locate the Composition obligation profile definition (likely in `input/fsh/` or rendered specification)
2. Find the `section:comparison` element definition
3. Update the description field from "History" to "Comparison"
4. Build the IG using `_genonce.sh` to render output
5. Verify the change in `igs/imaging-r4/` and `igs/imaging-r5/`
6. Create a PR with commit message: `FHIR-56776: Editorial - correct section:comparison description from "History" to "Comparison"`
7. Link the PR in the ticket comments
8. Update ticket status to "Applied" with resolution "Accepted"
