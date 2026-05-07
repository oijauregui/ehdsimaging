# Implementation Plan for FHIR-56767

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56767 |
| Issue Type | Technical Correction (Editorial) |
| Status | Submitted |
| Resolution Source | Proposed Resolution File (`FHIR-56767-resolution.md`) |
| Resolution/Disposition | Disposition A — Accept & Implement (Apply Editorial Fixes) |
| Summary | Editorial: §3 Use Cases — multiple small typos and wording fixes |

## Resolution Interpretation

The proposed resolution (Disposition A) requires applying three editorial corrections to the Use Cases section (§3):

1. **§3 General Typo**: Locate and fix a typo (specific location flagged by Brian Swinkels but not quoted; requires source inspection)
2. **§3.2 Wording**: Update text to read exactly: "as the variety of consumer needs makes it very difficult if not impossible to determine a generic rule for this"
3. **§3.3 Issues**: Fix capitalization inconsistencies, correct "a"/"an" usage per grammar rules, and add missing "s" character

These are minor editorial improvements that enhance clarity and consistency without changing normative content.

## Scope and Impact

### Affected Artifacts

- **Specification Section**: §3 — Use Cases
- **Capability Statements**: None directly affected
- **Rendered Pages**: 
  - `igs/imaging-r4/output/use-cases.html`
  - `igs/imaging-r5/output/use-cases.html`

### Candidate Files

- `ig-src/input/pagecontent/use-cases.md` — Primary source for Use Cases section
- Any included files referenced by use-cases.md (check for transclusion patterns)

### Impact Notes

- **R4 impact**: Minor — rendered HTML page updated, no structural changes
- **R5 impact**: Same as R4 — identical source generates R5 variant
- **Breaking change risk**: None — purely editorial corrections
- **Build risk**: Low — text-only changes in markdown content

## Implementation Tasks

### Task 1: Inspect §3 to Locate General Typo

**File**: `ig-src/input/pagecontent/use-cases.md` (and any included files)

**Action**: 
- Read the full Use Cases section (§3) from source
- Search for obvious typos and grammatical issues
- Identify the specific location of the typo flagged by Brian Swinkels

**Acceptance**: Source text reviewed; typo location clearly identified with context quote

### Task 2: Fix §3.2 Wording

**File**: `ig-src/input/pagecontent/use-cases.md` (exact subsection location to be determined in Task 1)

**Action**: Locate the text in §3.2 that discusses "variety of consumer needs" and update to read exactly:
```
as the variety of consumer needs makes it very difficult if not impossible to determine a generic rule for this
```

**Acceptance**: §3.2 text updated exactly as specified; old text is replaced cleanly without introducing line-break artifacts

### Task 3: Fix §3.3 Issues (Capitalization, Grammar, Missing Letter)

**File**: `ig-src/input/pagecontent/use-cases.md` (exact subsection location to be determined in Task 1)

**Action**: 
- Fix capitalization inconsistencies in §3.3
- Correct any "a" / "an" usage to follow English grammar rules
- Add missing "s" character in the specified location

**Acceptance**: All three editorial issues in §3.3 are corrected; text reads naturally without introduced errors

### Task 4: Run preprocessing and build check

**File**: Root of workspace

**Action**: Execute `./_preprocessMultiVersion.sh` and `ig-preprocess-build-check` to validate changes

**Acceptance**: Both R4 and R5 builds complete successfully; rendered pages display corrected text without build errors

### Task 5: Verify rendered output

**File**: `igs/imaging-r4/output/use-cases.html` and `igs/imaging-r5/output/use-cases.html`

**Action**: Inspect rendered HTML to confirm all corrections appear in the final output

**Acceptance**: Rendered use-cases.html shows all corrected text; no typos or grammatical issues remain

## Validation Plan

- [ ] Source file (`use-cases.md`) inspected and typo locations identified
- [ ] Task 2 correction applied and verified in source
- [ ] Task 3 corrections applied and verified in source
- [ ] Preprocessing completed for both versions
- [ ] Build check passed without new errors
- [ ] Rendered HTML verified to display corrected text
- [ ] No unresolved issues in rendered output
- [ ] `./_preProcessAndCheckAll.sh` passes (if available)

## Known Issues

- **§3 Typo Location**: Specific location not provided in ticket; will need to inspect source carefully
- **§3.3 Details**: Ticket description uses shorthand ("missing s") which requires context to locate; will need to read full section