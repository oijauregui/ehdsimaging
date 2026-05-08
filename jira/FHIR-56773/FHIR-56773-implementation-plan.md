# Implementation Plan for FHIR-56773

## Ticket Overview

**Key**: FHIR-56773  
**Title**: Editorial: DiagnosticReportEuImaging profile uses MS rather than the obligation framework  
**Type**: Technical Correction  
**Disposition**: A (Refactor to Obligations Only)  
**Related Sections**: DiagnosticReportEuImaging profile and obligation framework

## Implementation Goal

Consolidate DiagnosticReportEuImaging conformance requirements into the obligation framework by removing Must Support (MS) cardinality from the main profile and migrating all constraints to the obligation profile using obligation codes.

**Outcome**: Single, unified obligation-based conformance model for DiagnosticReportEuImaging

## Technical Scope

### Source Files

**Primary**:
- `ig-src/input/fsh/profiles/im-diagnosticreport.liquid.fsh` — Main DiagnosticReportEuImaging profile (liquid template for R4/R5)
- `ig-src/input/fsh/obligations/DiagnosticReportObligationEuImaging.liquid.fsh` — Obligation profile (liquid template)

**Generated Outputs** (auto-updated by preprocessing):
- `igs/imaging-r4/input/fsh/profiles/im-diagnosticreport.fsh` — R4 variant
- `igs/imaging-r5/input/fsh/profiles/im-diagnosticreport.fsh` — R5 variant
- `igs/imaging-r4/input/fsh/obligations/DiagnosticReportObligationEuImaging.fsh` — R4 obligation variant
- `igs/imaging-r5/input/fsh/obligations/DiagnosticReportObligationEuImaging.fsh` — R5 obligation variant

**Related Files**:
- `ig-src/input/fsh/profiles/im-diagnosticreport-rules.fsh` — Common rules macro (may contain MS constraints)
- `ig-src/input/pagecontent/profiles_diagnosticreport.md` — Profile narrative documentation

---

## Implementation Tasks

### Task 1: Analyze DiagnosticReportEuImaging MS Constraints

**Objective**: Document all Must Support cardinality in the profile

**Steps**:
1. Search `im-diagnosticreport.liquid.fsh` for MS constraint patterns:
   - Look for `* fieldname` declarations with MS modifiers
   - Identify sliced elements with MS constraints
   - Check macros like `DiagnosticReportEuImagingCommonRules` for inherited MS constraints
2. Cross-reference with `im-diagnosticreport-rules.fsh` to find macro-based constraints
3. Create comprehensive list of elements with MS cardinality

**Acceptance Criteria**:
- List of all MS-constrained elements documented
- Mapping between profile location and obligation profile equivalent

**Estimated Scope**: 30-40 MS-constrained elements (based on similar imaging profiles)

### Task 2: Map MS Constraints to Obligation Codes

**Objective**: Define obligation code equivalent for each MS constraint

**Mapping Strategy**:

| Profile Constraint | Obligation Code | Rationale |
|---|---|---|
| Element present (min > 0) | `SHALL:able-to-populate` | Required for system conformance |
| Element MS (must support) | `SHOULD:able-to-populate` or `SHALL:able-to-populate` | Depends on conformance level |
| Element recommended | `SHOULD:able-to-populate` | Implementation guidance |
| Optional element | `MAY:able-to-populate` | Optional system support |

**Steps**:
1. Review each MS-constrained element from Task 1
2. Determine appropriate obligation code based on conformance intent
3. Document in spreadsheet/mapping file:
   - Element path
   - Current MS status
   - Proposed obligation code
   - Justification

**Acceptance Criteria**:
- Complete mapping document created
- 100% of Task 1 elements have obligation code mapping

### Task 3: Remove MS Cardinality from DiagnosticReportEuImaging Profile

**Objective**: Strip Must Support constraints from main profile

**Steps**:
1. Open `ig-src/input/fsh/profiles/im-diagnosticreport.liquid.fsh`
2. Search for MS cardinality modifiers (typically `^mustSupport = true` or MS indicator)
3. For each MS-constrained element:
   - Remove MS constraint
   - Add comment indicating conformance moved to obligation profile
   - Example: `// Conformance defined in DiagnosticReportObligationEuImaging`
4. Verify profile still has valid parent-child relationship with base DiagnosticReport
5. Check that element definitions remain valid (only MS removed)

**Acceptance Criteria**:
- No `^mustSupport = true` remaining in main profile
- Profile compiles without errors
- Comments added for all removed MS constraints
- Parent/child inheritance maintained

**Files Modified**:
- `ig-src/input/fsh/profiles/im-diagnosticreport.liquid.fsh`

### Task 4: Migrate Constraints to DiagnosticReportObligationEuImaging

**Objective**: Add obligation codes for all conformance requirements

**Steps**:
1. Open `ig-src/input/fsh/obligations/DiagnosticReportObligationEuImaging.liquid.fsh`
2. For each element from the mapping (Task 2):
   - Find existing obligation definition (if present)
   - Add or update obligation code using mapping from Task 2
   - Ensure actor and documentation fields populated
   - Example structure:
     ```fsh
     * fieldname
       * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
       * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
       * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "..."
     ```
3. Handle R4/R5 differences using liquid conditionals:
   ```
   {% if isR5 %}
   [R5-specific obligation]
   {% endif %}
   {% if isR4 %}
   [R4-specific obligation]
   {% endif %}
   ```
4. Verify all previously-MS elements now have corresponding obligations

**Acceptance Criteria**:
- Obligation profile compiles without errors
- All Task 1 elements have corresponding obligation definitions
- R4 and R5 conditional sections properly formatted
- Actor references correct (EuImagingReportProducer)

**Files Modified**:
- `ig-src/input/fsh/obligations/DiagnosticReportObligationEuImaging.liquid.fsh`

### Task 5: Check Common Rules Macro

**Objective**: Verify `DiagnosticReportEuImagingCommonRules` macro doesn't contain MS constraints

**Steps**:
1. Search for `DiagnosticReportEuImagingCommonRules` definition in `im-diagnosticreport-rules.fsh`
2. If macro contains MS constraints:
   - Remove MS modifiers
   - Add comment: conformance moved to obligation profile
3. If macro is clean, add note to Task 2 mapping

**Acceptance Criteria**:
- Macro verified as MS-free
- Documentation note added if changes made

**Files Modified** (if needed):
- `ig-src/input/fsh/profiles/im-diagnosticreport-rules.fsh`

### Task 6: Update Profile Narrative Documentation

**Objective**: Document the obligation-based conformance approach

**Steps**:
1. Open `ig-src/input/pagecontent/profiles_diagnosticreport.md`
2. Add section explaining conformance model:
   - Old model: MS cardinality + obligation framework (dual approach)
   - New model: Obligation framework only (unified approach)
3. Explain obligation code meanings for implementers
4. Add cross-reference to obligation profile
5. Update any examples that reference MS conformance

**Content Template**:
```markdown
## Conformance and Obligations

This profile uses the FHIR obligation framework to define system conformance requirements. 
Obligations are expressed in [DiagnosticReportObligationEuImaging](StructureDefinition-diagnostic-report-obligation-eu-imaging.html).

Obligation codes used:
- `SHALL:able-to-populate`: System MUST support this element
- `SHOULD:able-to-populate`: System SHOULD support this element  
- `MAY:able-to-populate`: System MAY support this element

See the obligation profile for actor-specific requirements.
```

**Acceptance Criteria**:
- Narrative added to profile page
- Obligation codes documented
- Cross-references working

**Files Modified**:
- `ig-src/input/pagecontent/profiles_diagnosticreport.md`

### Task 7: Preprocess R4/R5 Variants

**Objective**: Generate R4/R5 versions from liquid sources

**Steps**:
1. Run `./_preprocessMultiVersion.sh` from workspace root
2. Verify successful output:
   - Command completes without errors
   - Files generated in `igs/imaging-r4/input/fsh/` and `igs/imaging-r5/input/fsh/`
3. Spot-check generated files:
   ```bash
   grep -n "mustSupport\|obligation" igs/imaging-r4/input/fsh/profiles/im-diagnosticreport.fsh
   grep -n "mustSupport\|obligation" igs/imaging-r5/input/fsh/profiles/im-diagnosticreport.fsh
   ```
4. Verify:
   - No MS cardinality in generated profiles
   - Obligation codes present in generated obligation files
   - R4 and R5 variants match expected structure

**Acceptance Criteria**:
- Preprocessing completes successfully
- Generated profiles contain no MS constraints
- Generated obligation files have correct obligation codes
- R4 and R5 variants are consistent

### Task 8: Build Verification

**Objective**: Validate changes through FHIR Publisher build

**Steps**:
1. Run `./_genonce.sh` to execute full IG build
2. Monitor for errors:
   - SUSHI compilation errors
   - Profile validation failures
   - Obligation extension errors
3. Review build output for warnings related to DiagnosticReportEuImaging:
   - Search for "DiagnosticReport" in output
   - Check for conformance-related warnings
4. Verify HTML rendering:
   - Profile page renders correctly
   - Obligation profile page renders correctly
   - No broken references

**Acceptance Criteria**:
- Build completes successfully
- No new errors related to FHIR-56773 changes
- Profile pages render without errors
- Obligation documentation accessible

### Task 9: Validation and Cross-Check

**Objective**: Verify conformance model consistency

**Steps**:
1. Open generated `igs/imaging-r4/input/fsh/obligations/DiagnosticReportObligationEuImaging.fsh`
2. Verify all previously-MS elements have obligation codes:
   ```bash
   # Count obligation definitions
   grep -c "extension\[code\]" igs/imaging-r4/input/fsh/obligations/DiagnosticReportObligationEuImaging.fsh
   ```
3. Compare with Task 1 MS element count
4. Spot-check key elements (subject, status, identifier, category, etc.):
   - Verify obligation codes match mapping
   - Verify actor/documentation populated
5. Cross-reference with FHIR-56772 (adverse reaction) and FHIR-56748 (scope) changes if applicable

**Acceptance Criteria**:
- Obligation element count ≥ MS element count from Task 1
- Key elements verified as correct
- No gaps in coverage
- Consistent with other obligation profiles

---

## Execution Order

```
Task 1 (Analysis)
  ↓
Task 2 (Mapping)
  ↓
Task 3 (Remove MS) → Task 5 (Check Macro)
  ↓
Task 4 (Add Obligations)
  ↓
Task 6 (Update Documentation)
  ↓
Task 7 (Preprocess)
  ↓
Task 8 (Build)
  ↓
Task 9 (Validation)
```

**Critical Path**: Tasks 1, 2, 3, 4, 7, 8 must complete successfully

---

## Rollback Plan

If build fails at Task 8:

1. Revert source files in `ig-src/`:
   ```bash
   git restore ig-src/input/fsh/profiles/im-diagnosticreport.liquid.fsh
   git restore ig-src/input/fsh/obligations/DiagnosticReportObligationEuImaging.liquid.fsh
   ```

2. Regenerate R4/R5:
   ```bash
   ./_preprocessMultiVersion.sh
   ```

3. Verify build:
   ```bash
   ./_genonce.sh
   ```

4. Document failure and blockers for work group review

---

## Success Criteria

- [x] Disposition A selected in resolution file
- [ ] All Task 1-9 completed
- [ ] DiagnosticReportEuImaging profile contains zero MS constraints
- [ ] DiagnosticReportObligationEuImaging profile contains all conformance obligations
- [ ] R4 and R5 variants generated and validated
- [ ] Build completes successfully with no new errors
- [ ] Profile narrative updated with obligation-based model explanation
- [ ] Validation step confirms 100% coverage of previous MS constraints

---

## Notes

- This is a **refactoring** change, not a new feature
- No functional change to conformance requirements, only mechanism
- Obligation framework already in use for other imaging profiles
- Plan includes comprehensive validation at each step
- Expected timeline: ~1-2 hours for full execution if no blockers

---

## Related Tickets

- FHIR-56772: Adverse reaction guidance harmonization (independent)
- FHIR-56748: Missing OAuth2 scopes (independent)
- FHIR-56747: Search interaction clarification (parallel coordination, if needed)
