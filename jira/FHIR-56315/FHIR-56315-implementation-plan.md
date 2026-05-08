# Implementation Plan for FHIR-56315

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56315 |
| Title | Broken links in the HL7 Europe Imaging Report documentation |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File (FHIR-56315-resolution.md) |
| Selected Disposition | B: Alternative Approach - Link Validation & Documentation |
| Summary | Implement comprehensive documentation quality initiative including link validation, audit, maintenance policy, and correction of broken links |

## Resolution Interpretation

The selected Disposition B recommends addressing this ticket through a systematic approach that prevents documentation quality issues from recurring:

> "Instead of just fixing individual links, implement a broader documentation quality initiative: (1) Audit all external links in the specification documentation, (2) Create link validation process as part of build/CI checks, (3) Document external dependencies with version/date information, (4) Establish maintenance policy for keeping external references current, (5) Fix identified broken links as part of comprehensive cleanup."

This addresses the immediate broken links (IHE-RAD-HL7IDR reference and ImagingSelection reference) while establishing sustainable documentation maintenance processes. The implementation encompasses both infrastructure improvements and specific link corrections.

## Scope and Impact

### Affected Components

- **Documentation Infrastructure**: Build/CI/CD pipeline, documentation validation process
- **Specification Documentation**: All markdown and HTML rendered files containing external links
- **Governance**: Documentation maintenance policies and procedures
- **Specific Links Being Fixed**:
  - DiagnosticReportEuImaging profile: IHE-RAD-HL7IDR reference
  - imaging-report.html: ImagingSelection reference

### Candidate Files for Link Fix

**Source files (ig-src/ or input/):**
- `ig-src/input/pagecontent/` — Search for references to "IHE-RAD-HL7IDR" and "ImagingSelection"
- `ig-src/input/` — Check FSH files and markdown for broken external links
- `input/pagecontent/` — Corresponding files in main input directory
- `input/includes/` — Include files that may reference external resources

**Generated output locations (verification):**
- `igs/imaging-r4/output/` — R4 rendered documentation where links appear
- `igs/imaging-r5/output/` — R5 rendered documentation where links appear

**Infrastructure files to create/modify:**
- `.github/workflows/` — Add or extend CI/CD workflow for link validation (if using GitHub Actions)
- `scripts/` — Add link validation script if not using GitHub Actions
- `.github/documentation-maintenance-policy.md` — New governance document
- `external-dependencies-registry.md` — New registry file

### Impact Analysis

- **R4 Impact**: Both broken links affect R4 rendered output; fixes will be visible in `igs/imaging-r4/output/`
- **R5 Impact**: ImagingSelection reference primarily affects R5; fixes will be visible in `igs/imaging-r5/output/`
- **Breaking Change Risk**: **Low** — These are documentation-only corrections. No breaking changes to specification content, resources, or cardinality. Link fixes are purely additive/corrective.
- **Scope Expansion**: This plan expands beyond just fixing these two links to establish systematic processes that benefit the entire specification long-term.

## Implementation Tasks

### Phase 1: Planning & Discovery

1. **Document External Link Audit Strategy**
   - File: `.github/documentation-maintenance-policy.md` (new)
   - Action: Create governance document defining:
     - Which external resources are essential vs. informational
     - Categorization of links (vendor docs, standards, external IGs, draft resources)
     - Owner responsibility for each category
     - Update frequency and deprecation rules
   - Acceptance: Policy document approved by work group; aligns with FHIR governance standards

2. **Create External Dependency Registry**
   - File: `external-dependencies-registry.md` (new)
   - Action: Create registry tracking:
     - Link target URL
     - Link purpose and context
     - Last verified date
     - Expected version/stability
     - Owner/responsible party
     - Status (Valid/Deprecated/Broken)
   - Acceptance: Registry includes all current external links; includes both broken links from this ticket

### Phase 2: Link Audit & Correction

3. **Audit All External Links in Source Files**
   - Files: `ig-src/`, `input/`, `igs/imaging-r4/output`, `igs/imaging-r5/output` — all markdown, FSH, and template files
   - Action: Systematically search for and document all external hyperlinks:
     - Extract URLs using regex or manual review
     - Test accessibility of each link
     - Categorize by stability and risk
     - Generate audit report
   - Acceptance: Audit report lists all external links with status (Valid/Broken/Needs Review)

4. **Fix IHE-RAD-HL7IDR Reference**
   - Files: `ig-src/input/pagecontent/` and related source files
   - Action: 
     - Determine correct current IHE RAD.HL7IDR documentation link or deprecation status
     - Verify if link target still exists or has moved
     - Update reference with correct URL or replace with note indicating resource is external/draft
     - Update in all locations where referenced
   - Acceptance: Link resolves to accessible IHE documentation or is replaced with explanatory note; no 404 errors

5. **Fix ImagingSelection Reference**
   - Files: `ig-src/input/pagecontent/imaging-report.html` or source markdown
   - Action:
     - Confirm ImagingSelection does not exist in FHIR R4
     - Remove or replace reference with:
       - Note that this is proposed for future FHIR version, OR
       - Link to FHIR ballot/roadmap information, OR
       - Explanation of alternative pattern to use
     - Update in both R4 and R5 documentation as appropriate
   - Acceptance: ImagingSelection reference removed or corrected; no links to non-existent R4 resources

### Phase 3: Infrastructure & Process

6. **Design Link Validation CI/CD Process**
   - Files: `.github/workflows/`
   - Action: 
     - Select link validation approach:
       - Option A: Integrate existing tool (e.g., markdown-link-check, linkinator)
       - Option B: Implement custom script in bash/node
     - Define scope (which files to check)
     - Configure timeout, retry logic, allowed failure types
     - Define output format and reporting
   - Acceptance: Validation script/workflow is documented and executable; successfully identifies broken links

7. **Implement Link Validation in Build Pipeline**
   - Files: `_preprocessMultiVersion.sh`
   - Action:
     - Integrate link validation into preprocessing flow
     - Run validation after HTML generation but before artifact publication
     - Configure to fail build if critical links are broken
     - Generate validation report as build artifact
   - Acceptance: Build includes link validation step; broken links are caught before release

### Phase 4: Verification & Documentation

8. **Update Source Files & Regenerate**
   - Files: All corrected source files + rendering scripts
   - Action:
     - Make link corrections in source files (FSH, markdown, templates)
     - Run `./_preprocessMultiVersion.sh` to regenerate outputs
     - Verify changes appear in `igs/imaging-r4/output/` and `igs/imaging-r5/output/`
     - Run full build with new link validation process
   - Acceptance: Build completes successfully; rendered output shows corrected links; no new broken links introduced

9. **Verify Corrected Links Accessibility**
   - Files: `igs/imaging-r4/output/`, `igs/imaging-r5/output/` (verification)
   - Action:
     - Test each corrected link manually in browser
     - Verify R4 and R5 versions link to appropriate resource versions
     - Check for any 404, redirect loops, or timeout errors
     - Document link verification results
   - Acceptance: All corrected links resolve successfully; no HTTP errors; links point to intended resources

10. **Document Policy & Process**
    - Files: `.github/documentation-maintenance-policy.md`, implementation guide
    - Action:
      - Document link validation process and responsibilities
      - Create runbook for adding new external links
      - Define review checklist for PRs that add links
      - Update project README with documentation quality expectations
    - Acceptance: Process documentation is clear enough for new contributors to follow; policy is approved by work group

## Validation Plan

### Pre-Implementation
- [ ] Confirm IHE-RAD-HL7IDR correct target URL with IHE team or repository
- [ ] Confirm ImagingSelection handling (remove vs. explain) with work group
- [ ] Select link validation tool/approach and evaluate against other FHIR IGs' practices

### Build & Source Update
- [ ] All external links inventoried and classified in audit
- [ ] Broken link targets determined (correct URL or removal decision)
- [ ] Source files updated with corrected links in `ig-src/` and `input/`
- [ ] No new typos or formatting errors introduced in corrections
- [ ] `./_preprocessMultiVersion.sh` completes successfully
- [ ] `./_preProcessAndCheckAll.sh` passes all checks

### Rendered Output Verification
- [ ] Corrected links appear in `igs/imaging-r4/output/` HTML files
- [ ] Corrected links appear in `igs/imaging-r5/output/` HTML files
- [ ] Manual link testing confirms accessibility (no 404, timeouts, redirects)
- [ ] IHE-RAD-HL7IDR link resolves or is appropriately documented as unavailable
- [ ] ImagingSelection reference removed or replaced with correct explanation/link

### Infrastructure & Policy
- [ ] Link validation script/workflow is executable and correctly identifies broken links
- [ ] Link validation integrated into build pipeline without breaking existing builds
- [ ] External dependency registry populated with current links and verification dates
- [ ] Documentation maintenance policy documented and reviewed by work group
- [ ] PR review template updated with link validation checklist

### Final Verification
- [ ] Full build passes with new link validation enabled
- [ ] Rendered outputs are clean and ready for publication
- [ ] No unresolved placeholders or broken links in final artifacts
- [ ] Implementation PR includes link corrections + infrastructure + documentation
- [ ] FHIR-56315 ticket resolution updated with implementation evidence

## Open Questions

1. **IHE-RAD-HL7IDR Resolution**: What is the correct current link target for IHE RAD.HL7IDR? Should this remain a hard link or be documented as external/changing?
2. **ImagingSelection Handling**: Should the specification note that ImagingSelection is planned for future FHIR release, or remove the reference entirely?
3. **Link Validation Tool**: Should we use an off-the-shelf tool (markdown-link-check, linkinator) or implement custom validation?
4. **Scope of External Links Audit**: Should audit include only hyperlinks in HTML output or also URLs in text/descriptions?
5. **CI/CD Platform**: Is link validation being added to GitHub Actions workflows or other CI/CD platform?
6. **Maintenance Owner**: Who is the designated owner for keeping external links current (governance)?

## GitHub Integration

**Related Artifacts:**
- Ticket: `jira/FHIR-56315/FHIR-56315.md`
- Resolution: `jira/FHIR-56315/FHIR-56315-resolution.md`
- Implementation PR: To be created (link to update once started)

**Expected PR Contents:**
- Source file corrections (link updates in ig-src/ and input/)
- Link validation script/workflow
- External dependency registry
- Documentation maintenance policy
- Build process updates
- This implementation plan

---

*Plan Generated: 2026-05-08*
*Based on: FHIR-56315-resolution.md, Disposition B (Alternative Approach)*
*Status: Ready for Implementation Review*
