# Implementation Plan for FHIR-56772

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56772 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File |
| Recommended Disposition | Disposition A: Accept & Implement – Harmonize Guidance |
| Summary | Guidance inconsistency: §9.8 and §9.9 present conflicting recommendations for adverse reaction modeling using AdverseEvent, AllergyIntolerance, and Condition |
| Related Sections | §9.8 / §9.9 (Adverse reaction guidance) |

## Resolution Interpretation

The proposed resolution recommends **Disposition A: Harmonize Guidance** to clarify and make consistent the guidance on when to use AdverseEvent, AllergyIntolerance, and Condition resources for adverse reaction reporting.

**Core issue:** The specification currently presents a clear recommendation (use both AdverseEvent and AllergyIntolerance) in the opening guidance, but then presents all three resources as equivalent alternatives with pros/cons without clear indication that one approach is preferred.

**Resolution approach:**
1. Confirm §9.8 (opening guidance) clearly states: "adverse reactions are recorded using the `AdverseEvent` resource. If the reaction is due to an allergy, it is also recorded using the `AllergyIntolerance` resource."
2. Clarify that the "Rationale and other choices for modeling" section explains design considerations and why the primary recommendation was chosen
3. Restructure or add clarifying language to indicate that:
   - AdverseEvent + AllergyIntolerance is the **recommended approach**
   - The Condition resource section explains why it was **not selected** for this use case
4. Ensure examples align with the recommended approach

## Scope and Impact

### Affected Artifacts

- **Adverse Reaction Guidance Section** — Contains the conflicting recommendations and design rationale
- **Examples (if present)** — Must align with the recommended AdverseEvent + AllergyIntolerance approach
- **Rendered outputs** — Both R4 and R5 will reflect the clarified guidance

### Candidate Files

- **Source (authoring):**
  - `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md` — Main guidance file containing the adverse reaction modeling section
  
- **Generated outputs (to verify changes):**
  - `igs/imaging-r4/output/pagecontent/design-consideration-procedure-adverse-reaction.html` — R4 rendered output
  - `igs/imaging-r5/output/pagecontent/design-consideration-procedure-adverse-reaction.html` — R5 rendered output

### Impact Notes

- **R4 impact:** Editorial clarification only; no structural changes
- **R5 impact:** Editorial clarification only; no structural changes
- **Breaking change risk:** **Low** — This is purely editorial guidance clarification with no impact on profiles, cardinality, or resource definitions
- **Scope:** Single source file with liquid templates for R4/R5 variants
- **Examples:** Must verify that any examples in the specification follow the recommended approach (AdverseEvent + AllergyIntolerance pairing)

## Implementation Tasks

### 1. Add Section as Subsection of "Adverse reaction" with Clarified Heading

- **File:** `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- **Action:** 
  - Restructure the heading from `### Rationale and other choices for modeling` (top-level section) to `#### Design Rationale and Resource Selection` (subsection of "Adverse reaction")
  - This nests the design rationale directly under the "Adverse reaction" section, clarifying that the rationale applies only to adverse reaction modeling
  - Promote all resource subsections from `####` to `#####` to maintain proper nesting hierarchy
  - Add a prefatory sentence explaining why AdverseEvent + AllergyIntolerance was selected as the recommended approach and why other options were not chosen
- **Organizational benefit:** 
  - Clarifies that the design rationale is scoped to adverse reaction resource selection
  - Improves document structure by making the relationship between guidance and rationale explicit
  - Ensures resource subsections are properly nested under the design rationale section
- **Acceptance criteria:**
  - "Design Rationale and Resource Selection" is a `####` heading (subsection of `###` Adverse reaction)
  - All resource subsections (AdverseEvent, AllergyIntolerance, Condition) are `#####` headings
  - Section title clearly indicates it contains design rationale and decision justification, not equivalent alternatives
  - Reader understands that AdverseEvent + AllergyIntolerance is the normative choice
  - The heading hierarchy makes the relationship between guidance and rationale explicit

### 2. Restructure Condition Resource Subsection

- **File:** `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- **Action:**
  - The Condition resource subsection will be nested as `##### Condition resource – Not Recommended` under `#### Design Rationale and Resource Selection`
  - Revise the language to clarify that Condition was considered but **not recommended** for adverse reaction modeling in this IG
  - Modify the pros/cons structure to add a note like: "**Conclusion:** The Condition resource is not aligned with the clinical and data modeling requirements for capturing adverse reactions during imaging procedures. Implementers should use AdverseEvent and AllergyIntolerance as specified above."
- **Acceptance criteria:**
  - The subsection is properly nested at the `#####` heading level
  - It is unambiguous that Condition is **not** the recommended choice
  - The reason (too broad scope, cannot directly link to Procedure) is clearly explained
  - No reader should interpret Condition as an equivalent alternative

### 3. Verify and Align Examples (if present)

- **File:** `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md` and any related example files
- **Action:**
  - Verify that any concrete examples in the adverse reaction section use AdverseEvent + AllergyIntolerance together (not Condition alone)
  - Check that examples in `examples/` subdirectory, if relevant to adverse reactions, follow the recommended pattern
  - Update any examples that use only Condition or only AdverseEvent without AllergyIntolerance (for allergic reactions) to match the guidance
- **Acceptance criteria:**
  - All examples in the specification follow the recommended approach
  - No example shows Condition as the primary choice for adverse reactions
  - Examples clearly show AdverseEvent + AllergyIntolerance pairing for allergic reactions

### 4. Validate Rendering and Cross-References

- **File:** Both source and generated outputs
- **Action:**
  - After edits are made to the source file, run the preprocess and build pipeline
  - Verify that rendered HTML output in `igs/imaging-r4/output/` and `igs/imaging-r5/output/` reflects the clarified guidance
  - Check that any cross-references (links, section anchors) still work correctly
  - Ensure liquid template variables (`isR4`, `isR5`) render correctly in both versions
- **Acceptance criteria:**
  - Rendered output in both R4 and R5 shows the clarified guidance structure
  - No broken links or placeholder values remain
  - The section is readable and logically organized in the HTML output
  - Liquid conditionals render correctly for both versions

## Validation Plan

- [ ] Source file `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md` edited with clarity improvements
- [ ] Section heading and introductory text clarify that the resource selection guidance is normative, not exploratory
- [ ] Condition resource subsection clearly indicates it was considered but not recommended
- [ ] All examples in the specification use AdverseEvent + AllergyIntolerance for adverse reactions
- [ ] Preprocess script (`./_preprocessMultiVersion.sh`) executed successfully
- [ ] Build script (`./_genonce.sh`) completes without errors for both R4 and R5
- [ ] Rendered outputs verified in `igs/imaging-r4/output/pagecontent/` and `igs/imaging-r5/output/pagecontent/`
- [ ] HTML output reflects clarified guidance structure and is readable
- [ ] No unresolved liquid template placeholders in output
- [ ] Ticket requirements fully satisfied: guidance is harmonized and clear about the recommended approach

## Implementation Notes

### Editorial Changes Only

This ticket requires only editorial clarification in markdown text. No changes to:
- Profile definitions
- Resource cardinalities or element constraints
- Terminology bindings
- Capability statements
- FHIR profiles or examples (XML/JSON resources)

### File Scope

The primary change is contained in a single source file that uses liquid templating:
- Source: `ig-src/input/pagecontent/design-consideration-procedure-adverse-reaction.liquid.md`
- This file is processed by the IG build pipeline to generate both R4 and R5 outputs
- Liquid templates (`{% if isR4 %}...{% endif %}`) may differ between versions; ensure edits apply to both

### Build Verification

After making edits:
1. Run `./_preprocessMultiVersion.sh` to preprocess source files
2. Run `./_genonce.sh` to generate the full build (or use faster validation with build checks only)
3. Verify output in `igs/imaging-r4/` and `igs/imaging-r5/` directories

## Open Questions

None. The resolution clearly recommends Disposition A with actionable steps:
- Clarify the primary recommendation in the opening guidance
- Restructure the "Rationale" section to indicate design decisions, not alternatives
- Ensure the Condition resource is presented as "not recommended" rather than equivalent
- Verify examples align with the recommended approach

---

**Implementation Status:** Ready for execution  
**Disposition:** Disposition A – Harmonize Guidance (Recommended by FHIR-56772 resolution analysis)  
**Complexity:** Low (editorial text clarification)  
**Build Impact:** None (no profile/resource changes; IG build regeneration required for rendering)  
**Balloting Impact:** Addresses ballot participant feedback from Epic; improves specification clarity for implementers  

*Generated: 2026-05-08*  
*Ticket: FHIR-56772 (Technical Correction)*  
*Status: Submitted (Awaiting Workgroup Approval)*
