# Implementation Plan for FHIR-56771

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56771 |
| Issue Type | Technical Correction (Editorial) |
| Status | Submitted |
| Disposition | A — Accept & Implement (Apply Editorial Fixes) |
| Summary | Editorial: design-considerations §9.6, §9.9.1, §9.9.2, §9.10 — typos / incomplete thoughts |

## Resolution Interpretation

The proposed resolution (Disposition A) requires applying six editorial corrections across the Design Considerations section (§9):

1. **§9.6 (linking-to-bodysites)**: Fix "THe" → "The" capitalization typo
2. **§9.6 (linking-to-bodysites)**: Fix garbled sentence about search options
3. **§9.9.1 (adverse-reaction diagram)**: Fix "occurence" → "occurrence" in mermaid diagram (both R4 and R5)
4. **§9.9.1 (adverse-reaction diagram R4)**: Fix "reaction.onse" → "reaction.onset" in R4 mermaid diagram only
5. **§9.9.1 (adverse-reaction text)**: Fix "focuses mainly is" → "focuses mainly" grammatical error
6. **§9.9.2**: Fix contradictory logic "not a straightforward way… so it can be linked" → "so it cannot be directly linked"

## Implementation Tasks

### Task 1: Fix capitalization and garbled sentence in §9.6 (linking-to-bodysites)
- **File**: `ig-src/input/pagecontent/design-consideration-linking-to-bodysites.liquid.md`
- **Changes**: 
  - Fix "THe {{ehnImagingGuidelines}} requires..." → "The {{ehnImagingGuidelines}} requires..."
  - Fix garbled sentence about search options to read properly
- **Acceptance**: Both corrections applied cleanly

### Task 2: Fix typo in adverse reaction mermaid diagram (both R4 and R5)
- **File**: `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- **Change**: Fix "occurence" → "occurrence" in mermaid classDiagram
- **Acceptance**: Fixed in both R4 and R5 conditional sections

### Task 3: Fix truncated FHIR path in adverse reaction diagram (R4 only)
- **File**: `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- **Change**: Fix "reaction.onse" → "reaction.onset" in R4 `{% if isR4 %}` block only
- **Acceptance**: Fixed in R4 block only

### Task 4: Fix grammatical error in §9.9.1 text
- **File**: `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- **Change**: Fix "focuses mainly is on" → "focuses mainly on"
- **Acceptance**: Text reads naturally

### Task 5: Fix contradictory logic in §9.9.2
- **File**: `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- **Change**: Fix "not a straightforward way… so it can be linked" → "so it cannot be directly linked"
- **Acceptance**: Logic is consistent

### Task 6: Fix typo in §9.10 (if present in keyimages)
- **File**: `ig-src/input/pagecontent/design-consideration-keyimages.liquid.md`
- **Change**: Locate and fix typo (specific location to be determined)
- **Acceptance**: Typo located and fixed

### Task 7: Run preprocessing and build check
- Execute `./_preprocessMultiVersion.sh` and `ig-preprocess-build-check`
- **Acceptance**: Both R4 and R5 build successfully with no new errors
