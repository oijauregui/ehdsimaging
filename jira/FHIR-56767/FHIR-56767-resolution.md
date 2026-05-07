# Proposed Resolution for FHIR-56767

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56767 |
| Title | Editorial: §3 Use Cases — multiple small typos and wording fixes |
| Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | Brian Swinkels (Epic) |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Related Sections | §3 (Use Cases) |

## Description

Multiple small editorial fixes requested for §3 (Use Cases section):

- **§3**: Typo flagged by Brian (specific location not provided)
- **§3.2**: Wording issue — text should read: "as the variety of consumer needs makes it very difficult if not impossible to determine a generic rule for this"
- **§3.3**: Capitalization inconsistency plus "a" / "an" usage issue; missing letter "s"

### Issue Characteristics

- **Issue Type**: Technical Correction (editorial)
- **Scope**: Minor wording and consistency fixes
- **Impact**: Specification clarity and consistency
- **Reporter Affiliation**: Epic

## Implementation Status

### Current Status: Submitted

This ticket is awaiting governance review to determine final disposition. The corrections have **not yet been applied** to the specification. The ticket lacks specific line numbers/locations for the §3 typo, which may require clarification.

### Evidence & Links

- **Source**: Community feedback from Brian Swinkels (Epic) during ballot period
- **Related Version**: 1.0.0-ballot
- **Rendered Sections**: [igs/imaging-r4/page-use-cases.html](../igs/imaging-r4/page-use-cases.html) and [igs/imaging-r5/page-use-cases.html](../igs/imaging-r5/page-use-cases.html)
- **Source Files**: 
  - `ig-src/input/pagecontent/use-cases.md`
  - Included files referenced by use-cases.md

### Verification Status

No GitHub commits or PRs have been identified that address this ticket. The corrections are not yet present in the specification rendering.

## Related Tickets

No parent key or grouping specified. This ticket appears to be standalone editorial feedback.

## Disposition Analysis

### Disposition Classification: Pending

The ticket is awaiting work group review and decision on whether to:
1. Accept the suggested corrections as valid
2. Request clarification or alternative wording
3. Decline the changes as editorial style preferences

### Rationale

Technical corrections to ballot feedback are typically accepted when:
- They improve clarity without changing normative content
- They fix genuine typographical errors
- They improve consistency in terminology or style
- There is clear support from the community

## Proposed Dispositions

### Disposition A: Accept & Implement

#### Proposal

Apply all three suggested corrections to the Use Cases section (§3):

1. **§3 Typo**: Locate and fix the typo (requires clarification from reporter on specific location)
2. **§3.2 Wording**: Update text to read exactly: "as the variety of consumer needs makes it very difficult if not impossible to determine a generic rule for this"
3. **§3.3 Issues**: 
   - Fix capitalization inconsistencies
   - Correct "a" / "an" usage (apply proper grammar)
   - Add missing "s" character where needed

#### Steps

1. Locate the exact text in `ig-src/input/pagecontent/use-cases.md` or included files
2. Request clarification from Brian Swinkels (Epic) on §3 typo location if needed
3. Apply the three corrections
4. Verify corrections in rendered output (`igs/imaging-r4/` and `igs/imaging-r5/`)
5. Create PR with commit message: "Fix editorial issues in §3 (FHIR-56767)"
6. Merge after review
7. Mark ticket as "Applied"

#### Justification

- **Clarity**: These are legitimate grammar and spelling improvements
- **Community Feedback**: Submitted by an experienced implementer (Epic)
- **Low Risk**: Editorial changes do not affect normative content or implementation requirements
- **Consistency**: Grammar and capitalization fixes improve specification professionalism
- **Standard Practice**: Ballot feedback corrections are routinely accepted in FHIR balloting cycle

#### Trade-offs

- Minimal — these are non-substantive corrections
- No impact on implementation or conformance requirements

---

### Disposition B: Request Clarification

#### Proposal

Before accepting, request that the reporter (Brian Swinkels) provide:
1. **Specific location** of the §3 typo (section, paragraph, or surrounding text)
2. **Current wording** of §3.2 that needs replacement (to verify the exact change needed)
3. **Specific examples** of capitalization and "a"/"an" issues in §3.3

Create a GitHub issue in the imaging repository requesting these details, and track resolution via that issue rather than implementing blind.

#### Justification

- **Precision**: The §3 typo location is vague ("Brian flagged but did not quote location")
- **Verification**: Having specific before/after text ensures we fix exactly what was intended
- **Process**: FHIR typically requires clear specification of changes in technical corrections
- **Audit Trail**: Documentation of requirements improves traceability

#### Trade-offs

- Adds delay and process overhead
- Requires follow-up communication with reporter
- May not be necessary if the corrections are obvious upon inspection

---

### Disposition C: Decline

#### Proposal

Close the ticket as "Not Persuasive" if any of the following apply:

- The §3 typo cannot be located or identified
- The suggested wording in §3.2 is a matter of editorial preference, not clarity
- The capitalization and "a"/"an" issues are stylistic rather than grammatical errors
- No clear impact on implementation or specification clarity

#### Justification

- **Scope Management**: Not all editorial feedback constitutes a required change
- **Style Preferences**: Specification language may have established conventions that differ from the suggestion
- **Community Process**: Work groups decide which feedback to adopt based on group consensus
- **Risk**: Constant small edits can lead to inconsistency if not coordinated centrally

#### Trade-offs

- May frustrate implementer feedback
- Could be perceived as dismissive of community input
- Requires articulating a clear reason for rejection

---

### Recommendation

**Recommended Disposition: A — Accept & Implement**

**Rationale:**

1. **Clarity Wins**: Editorial corrections that improve grammar, spelling, and consistency are low-risk improvements to any specification. The Use Cases section is normative in terms of scope and requirements, but the *language* can always be clearer.

2. **Implementer Confidence**: Accepting community ballot feedback signals that HL7 EU and the Imaging IG take feedback seriously. Epic's feedback carries weight—they are a major implementer.

3. **Process**: The ticket has been submitted with specific suggested text for at least two of the three issues (§3.2 is explicit; §3 requires light detective work; §3.3 describes the issues clearly). This is sufficient to proceed.

4. **Next Action**: 
   - If the §3 typo cannot be found by inspection, a quick clarification request to Brian is reasonable, but should not block the other two corrections
   - The §3.2 and §3.3 issues should be addressable from the current description

5. **Timeline**: These are quick editorial fixes that can be implemented in the next maintenance round or before final ballot publication

**Work Group Action:**

- Confirm disposition A with the group
- Assign task to create/review PR with corrections
- Set target date for implementation (e.g., next editing cycle)
- Mark ticket as "In Progress" once work begins

## Next Steps

1. **Immediate**: Present this analysis to work group for decision
2. **If A Selected**: 
   - Inspect §3 for the flagged typo; request clarification if needed
   - Prepare PR with suggested corrections to §3.2 and §3.3
   - Review wording in context and validate fixes
   - Merge PR upon approval
   - Mark ticket resolved
3. **If B Selected**: 
   - Create GitHub issue requesting clarification
   - Wait for reporter response
   - Proceed once details provided
4. **If C Selected**: 
   - Document reason for decline
   - Communicate decision to reporter
   - Mark ticket as "Not Persuasive"

## Verification Checklist

- [ ] Work group has reviewed and approved disposition
- [ ] If accepted: §3 typo location identified (clarification obtained if needed)
- [ ] If accepted: PR created with three editorial fixes
- [ ] If accepted: Changes reviewed and verified for accuracy
- [ ] If accepted: PR merged to main branch
- [ ] If accepted: Corrections visible in rendered output:
  - [ ] igs/imaging-r4/page-use-cases.html
  - [ ] igs/imaging-r5/page-use-cases.html
- [ ] Ticket status updated (Applied/Not Persuasive/Pending)
- [ ] Resolution file finalized and committed

---

**Generated**: 2026-05-07  
**Ticket Status**: Submitted → *Awaiting Work Group Decision*  
**Recommended Action**: Accept & Implement (Disposition A)
