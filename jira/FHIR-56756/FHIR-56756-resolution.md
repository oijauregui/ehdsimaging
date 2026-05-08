# Proposed Resolution for FHIR-56756

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | FHIR-56756 |
| **Type** | Technical Correction |
| **Status** | Submitted |
| **Resolution** | Unresolved |
| **Reporter** | JoshPriebe |
| **Assignee** | Unassigned |
| **Created** | 2026-04-30 |
| **Related Section** | DocumentReferenceImagingReport |

## Description

**Title:** Modality extension is 1..1; relax to 1..* for PET-CT, SPECT-CT, PET-MR

**Problem:** The modality extension is currently constrained to 1..1 (exactly one). This fails multi-modality studies where a single DocumentReference or study involves multiple modalities (e.g., PET-CT combines PET and CT, SPECT-CT combines SPECT and CT, PET-MR combines PET and MR).

**Proposed Resolution:** Relax the cardinality constraint from 1..1 to 1..* to permit multiple modalities per study.

**Reporter Context:** Dan Schon, Epic

## Current Implementation Status

The modality constraint is currently defined in:

### R4 (Extension):
- **File:** [ig-src/input/fsh/profiles/im-keyimage-documentreference.liquid.fsh](im-keyimage-documentreference.liquid.fsh#L30)
- **Current definition (Line 30):** `http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.modality named modality 1..1`
- **Cardinality:** 1..1 (exactly one modality required)

### R5 (Native element):
- **File:** [ig-src/input/fsh/profiles/im-keyimage-documentreference.liquid.fsh](im-keyimage-documentreference.liquid.fsh#L43)
- **Current definition (Line 43):** `* modality 1..1`
- **Cardinality:** 1..1 (exactly one modality required)

**Status:** Not yet implemented. The constraint remains at 1..1 in both R4 and R5 versions.

## Related Tickets

No parent tickets or direct groupings identified for this technical correction.

## Disposition Analysis

### Current Classification

| Aspect | Assessment |
|--------|-----------|
| **Ticket Status** | Submitted (awaiting review and decision) |
| **Issue Type** | Technical Correction (legitimate constraint issue) |
| **Scope** | In-scope (affects DocumentReference capability) |
| **Use Case Validity** | Valid (multi-modality imaging is a real clinical scenario) |
| **Complexity** | Low (simple cardinality change) |
| **Implementation Status** | Not yet applied |

### Disposition Taken

**Pending Decision** — This ticket requires work group governance review to determine final disposition.

### Rationale for Pending Status

1. **Valid Use Case:** Multi-modality imaging studies (PET-CT, SPECT-CT, PET-MR) are well-established in clinical practice and are referenced in the ticket description.
2. **Straightforward Change:** The fix is a simple cardinality relaxation, not a structural redesign.
3. **Backward Compatible:** Changing from 1..1 to 1..* is backward compatible (existing single-modality instances remain valid).
4. **No Blocker:** No technical or architectural concerns identified.
5. **Requires Decision:** As a submitted technical correction, it needs explicit work group consensus before implementation.

## Proposed Dispositions

---

### Disposition A: Accept As Requested

#### Proposal

Relax the modality cardinality constraint from **1..1** (exactly one) to **1..*** (one or more) in both R4 and R5 versions:

**R4 (Extension-based) — File:** `ig-src/input/fsh/profiles/im-keyimage-documentreference.liquid.fsh`
```
{{R4}}* extension contains 	
{{R4}}     http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.basedOn named basedOn 0..* and
{{R4}}     http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.modality named modality 1..*  {CHANGE: 1..1 → 1..*}
```

**R5 (Native element) — Same file:**
```
{{R5}}* modality 1..*  {CHANGE: 1..1 → 1..*}
```

**Rationale:**
- **Clinical Accuracy:** Multi-modality studies are routine in imaging (PET-CT, SPECT-CT, PET-MR). The current 1..1 constraint artificially prevents modeling the clinical reality.
- **FHIR Design Pattern:** FHIR elements use 0..* and 1..* when multiple values are clinically valid. Modality is analogous to ImagingStudy.series.modality, which is 1..* in FHIR R5.
- **Backward Compatibility:** Existing DocumentReference instances with exactly one modality remain compliant; the change permits *additional* valid instances.
- **Implementation Simplicity:** No breaking changes, no extension redefinition needed, purely a cardinality relaxation.

#### Implementation Impact

1. **Updated Profile:** Render the profile with updated cardinality in generated HTML and JSON Schema.
2. **Updated Examples:** Consider adding an example DocumentReference showing multiple modalities (e.g., PET-CT study with modality[0]=PET and modality[1]=CT).
3. **Updated Terminology Binding:** Confirm that the modality value set permits multiple values (it does by design).
4. **Build Validation:** Regenerate and validate both R4 and R5 IG outputs to ensure no unintended side effects.

---

### Disposition B: Alternative — Use Extension Pattern for Additional Modalities

#### Proposal

Keep the primary modality as 1..1 (representing the "primary" or "first" modality for backward compatibility), and introduce a new repeating extension for additional modalities:

```fsh
* extension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.modality named modality 1..1 and
    http://example.org/StructureDefinition/extension-DocumentReference.additionalModality named additionalModality 0..*
```

#### Justification

- **Backward Compatibility:** Existing implementations that rely on exactly one modality are unaffected.
- **Explicit Semantics:** Distinguishes between primary and secondary modalities if clinical workflows care about that distinction.
- **Extensibility:** Allows independent reasoning about the primary modality vs. the full set.

**Trade-offs:**
- **More Complex:** Implementers must now understand two separate elements; more documentation burden.
- **Semantic Redundancy:** If both modality and additionalModality are used, there's information duplication without clear value.
- **Aligns Poorly with FHIR R5:** R5 uses a single modality 1..* element; this pattern diverges unnecessarily.

---

### Disposition C: Decline — Maintain 1..1

#### Proposal

Keep the modality constraint at 1..1. Multi-modality studies should be represented by creating multiple DocumentReference instances, each with a single modality, linked via basedOn or relatedDocument references.

#### Justification

- **Data Normalization:** Avoids unnormalized storage of multiple modalities in a single element.
- **Simplicity:** Enforces a "one DocumentReference = one modality" pattern, reducing complexity.
- **Query Consistency:** Simpler queries; "find all documents with modality=PET" does not require array filtering.

**Trade-offs & Concerns:**
- **Clinically Awkward:** Multi-modality studies are reported as a unit in clinical practice; splitting them feels artificial.
- **Contradicts FHIR R5:** FHIR R5 DocumentReference.modality is 1..* natively, so R4 should follow this for consistency.
- **Incompatible with ImagingStudy:** ImagingStudy.series.modality is 1..* in both R4 and R5, creating an inconsistency if DocumentReference.modality is 1..1.
- **Difficult for Implementers:** Epic and other EHRs store multi-modality studies as single entities; forcing decomposition adds implementation burden.

---

## Recommendation

**Recommended Disposition:** **A — Accept As Requested**

### Rationale

1. **Alignment with FHIR Core:** The change aligns the imaging IG with FHIR R5 native design (where DocumentReference.modality is 1..*).
2. **Clinical Necessity:** Multi-modality imaging is a standard clinical scenario. The 1..1 constraint is a known gap that implementers (Epic, cited in ticket) have flagged.
3. **Backward Compatibility:** The change is purely permissive; existing compliant instances remain valid.
4. **Simplicity:** Disposition A is the simplest fix with no new extensions or workarounds required.
5. **No Downside:** There is no technical or design rationale for declining or choosing the alternative approach.

The work group should approve this change and schedule it for implementation in the next editorial cycle or ballot update.

---

## Next Steps

### Verification Checklist

- [ ] Work group governance decision on proposed disposition
- [ ] Update cardinality in `ig-src/input/fsh/profiles/im-keyimage-documentreference.liquid.fsh` (both R4 line 30 and R5 line 43)
- [ ] Add or update examples showing multi-modality DocumentReference instances
- [ ] Run IG build validation (`_preprocessMultiVersion.sh` and `_genonce.sh`) to confirm no errors
- [ ] Validate rendered profiles in both R4 and R5 output directories
- [ ] Commit changes with reference to FHIR-56756
- [ ] Close ticket with resolution record

### Recommended Implementation Steps (if Disposition A approved)

1. **Modify Source Profile:**
   - File: `ig-src/input/fsh/profiles/im-keyimage-documentreference.liquid.fsh`
   - Change line 30: `1..1` → `1..*` (R4 extension)
   - Change line 43: `1..1` → `1..*` (R5 native element)

2. **Add Multi-Modality Example:**
   - Create or update an example DocumentReference showing both PET and CT modalities
   - Place in `examples/fsh/` or reference existing examples

3. **Validate Build:**
   ```bash
   cd /home/nly98977/SwArchives/hl7eu/imaging
   bash _preprocessMultiVersion.sh
   bash _genonce.sh
   ```

4. **Review Output:**
   - Check `igs/imaging-r4/StructureDefinition/DocumentReference*.html` (profile rendering)
   - Check `igs/imaging-r5/StructureDefinition/DocumentReference*.html` (profile rendering)
   - Verify cardinality now shows 1..* in generated profiles

5. **Commit and Close:**
   ```bash
   git add ig-src/input/fsh/profiles/im-keyimage-documentreference.liquid.fsh
   git commit -m "Fix FHIR-56756: Relax modality cardinality from 1..1 to 1..* for multi-modality support (PET-CT, SPECT-CT, PET-MR)"
   ```

---

## Document History

- **Created:** 2026-05-08
- **Status:** Pending Work Group Review
- **Last Updated:** 2026-05-08

---

*This resolution proposal is prepared for presentation to the HL7 EU Imaging IG work group. Final disposition decisions will be recorded in the Jira ticket once governance review is complete.*
