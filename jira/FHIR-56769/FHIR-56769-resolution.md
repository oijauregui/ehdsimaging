# Proposed Resolution for FHIR-56769

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56769 |
| Title | Editorial: small typo in §10.2 ("as" should be "and") |
| Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe (Epic) |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Related Sections | §10.2 Obligations |

## Description

Small typo in §10.2 — meant to have 'and' not 'as'.

Raised by Brian Swinkels from Epic during ballot review.

## Implementation Status

### Current Status: Submitted (Unresolved)

This is a new technical correction ticket that has been submitted for editorial review. No implementation work has been initiated yet.

### Location of Defect

**File**: `ig-src/input/pagecontent/obligations.md`  
**Section**: §10.2 Obligations  
**Line**: Last paragraph

**Current Text**:
```
Note that no display related obligations are used as the variety of {{ConsumerActor}}s 
makes it very difficult if not impossible to determine a generic rule for this.
```

**Corrected Text**:
```
Note that no display related obligations are used and the variety of {{ConsumerActor}}s 
makes it very difficult if not impossible to determine a generic rule for this.
```

### Evidence

- **Ticket Type**: Technical Correction
- **Issue Origin**: Ballot Review (1.0.0-ballot)
- **Reporter**: Brian Swinkels, Epic
- **Grammar**: The article "as" is grammatically incorrect; should be coordinating conjunction "and"
- **Current Rendering**: 
  - R4 Build: `igs/imaging-r4/input/pagecontent/obligations.md`
  - R5 Build: `igs/imaging-r5/input/pagecontent/obligations.md`
- **Source Template**: `ig-src/input/pagecontent/obligations.md` (processed by Liquid preprocessing)

## Disposition Analysis

### Disposition Taken

**Classification**: Pending Governance Review

This ticket represents a straightforward editorial correction identified during ballot review. The disposition will be determined by work group consensus on whether the proposed change aligns with the intended meaning.

### Rational Analysis

1. **Issue Clarity**: The typo is unambiguous — "as" is an incorrect article in this context
2. **Scope**: Editorial-only change; no breaking changes or specification logic impact
3. **Impact**: Minimal — improves clarity of the Obligations section introduction
4. **Fix Complexity**: Trivial — single word replacement across liquid template and both R4/R5 preprocessed outputs
5. **Ballot Feedback**: Reported by implementation partner (Epic), suggesting active review

### Implementation Path (if Accepted)

If approved:
1. Update `ig-src/input/pagecontent/obligations.md` (source template)
2. Update `igs/imaging-r4/input/pagecontent/obligations.md` (R4 preprocessed)
3. Update `igs/imaging-r5/input/pagecontent/obligations.md` (R5 preprocessed)
4. Run `_preprocessMultiVersion.sh` to verify no conflicts
5. Run `_genonce.sh` to validate rendered output
6. Create PR for review and merge to `master`

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Correct the typo in §10.2 Obligations from "as" to "and" in the last sentence of the Obligations section introduction.

**Change**: Single word replacement  
```diff
- Note that no display related obligations are used as the variety of {{ConsumerActor}}s
+ Note that no display related obligations are used and the variety of {{ConsumerActor}}s
```

This change will be applied to:
- `ig-src/input/pagecontent/obligations.md` (source)
- `igs/imaging-r4/input/pagecontent/obligations.md` (R4 output)
- `igs/imaging-r5/input/pagecontent/obligations.md` (R5 output)

#### Justification

- **Grammatical Correctness**: "as" is an incorrect article; "and" is the appropriate coordinating conjunction for connecting two independent clauses
- **Clarity**: The corrected sentence properly conveys that display-related obligations are not used, and the reason is the variety of Consumer Actors
- **Low Risk**: Editorial-only change with zero impact on technical specifications, profiles, or implementation guidance
- **Ballot Feedback**: Reported by active implementer (Epic) during formal review process
- **Best Practice**: Technical corrections identified during ballot should be addressed to improve specification quality

---

### Disposition B: Alternative Approach

#### Proposal

Rather than replacing "as" with "and", restructure the sentence for improved clarity and grammatical flow:

**Option B1** (Causal relationship):
```
Note that no display related obligations are used since the variety of {{ConsumerActor}}s
makes it very difficult if not impossible to determine a generic rule for this.
```

**Option B2** (Additional clause):
```
Note that no display related obligations are used. The variety of {{ConsumerActor}}s
makes it very difficult if not impossible to determine a generic rule for this.
```

#### Justification

- **Better Grammar**: "since" or sentence separation conveys causal relationship more clearly than "and"
- **Reader Understanding**: Explicitly shows that the inability to create a generic rule is the *reason* obligations are not used
- **Parallel Structure**: Separating the two ideas may improve readability
- **Trade-off**: Slightly more intrusive edit than simple word replacement, requires judgment on optimal phrasing

---

### Disposition C: Decline

#### Proposal

Leave the current text unchanged. The phrase "as the variety" could be interpreted as acceptable in informal technical writing where "as" is used colloquially to mean "given that" or "considering that."

#### Justification

- **Colloquial Usage**: Some readers may accept "as" in this context as conversational English
- **Minimal Impact**: The error does not affect technical correctness or implementer understanding
- **Stability**: Avoids making edits to content that is already in ballot
- **Risk Aversion**: Any change, even editorial, could introduce unintended consequences

---

### Recommendation

**Recommended disposition: A (Accept As Requested)**

This is a straightforward editorial correction that improves grammatical clarity without changing technical meaning. The typo was identified by an active implementer (Epic) during formal ballot review, indicating genuine concern about readability. 

**Rationale for Recommendation A over B**:
- The reporter specifically requested changing "as" to "and," indicating that is the intended fix
- Option B introduces subjective judgment about optimal sentence structure, whereas A addresses the specific grammatical error
- Minimal change reduces risk and simplifies review
- "and" is semantically appropriate for connecting two statements about the handling of display obligations

**Rationale for Recommendation A over C**:
- Ballot feedback should be addressed to improve specification quality
- "as" in this context is grammatically incorrect and should be corrected
- The change is purely editorial with zero technical impact

## Next Steps

### Verification Checklist

- [ ] **Governance Review**: Work group reviews and approves proposed change
- [ ] **Source Update**: Update `ig-src/input/pagecontent/obligations.md`
- [ ] **Build Verification**: Run `_preprocessMultiVersion.sh` to verify preprocessing
- [ ] **Output Verification**: Confirm changes appear in `igs/imaging-r4/` and `igs/imaging-r5/`
- [ ] **Rendering Check**: Run `_genonce.sh` and verify output HTML renders correctly
- [ ] **PR Creation**: Create pull request with editorial change
- [ ] **PR Review**: Get approval from work group/reviewers
- [ ] **Merge**: Merge to `master` branch
- [ ] **Release Notes**: Document in next release notes as editorial correction

### Current State

**Status**: Ready for Governance Review  
**Assigned To**: IG Work Group  
**Priority**: Low (editorial, non-blocking)  
**Estimated Effort**: 5 minutes (once approved)

---

*Resolution proposal generated: 2026-05-07*  
*Ticket age: 7 days (submitted during 1.0.0-ballot)*  
*Classification: Technical Correction - Editorial*
