{% include variable-definitions.md %}
For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.

The table below suggests the data points that SHOULD be included, and the source of those data. Those data pointscan be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.

NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [ImComposition](StructureDefinition-ImComposition.html), which is the parent type of this Report-ImComposition profile.

## Elements to include in sections narratives

### Imaging Study

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImImagingStudy | series.specimen | EuSpecimen | EHDSImagingReportBody | specimen |
| ImImagingStudy | series.bodySite | EuBodyStructure | EHDSImagingReportBody | examinationReport.bodyPart.bodyLocation |
| ImRadiationDoseObservation | component.value[x] | - | EHDSImagingStudy | series.instancesInTheSeries.radiationDoseInformation.kap |

### Order

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImOrder | requester | EuPractitionerRole | EHDSImagingReportBody | orderInformation.orderPlacer |

### History

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImOrder | supportingInfo | EuObservation | EHDSImagingReportBody | orderInformation.supportingInformation.observation |
| ImOrder | reason | EuMedicationAdministration | EHDSImagingReportBody | orderInformation.supportingInformation.medicationAdministration |
| ImGestationalAgeObservation | value[x] | - | EHDSImagingReportBody | orderInformation.supportingInformation.gestationalAge |

### Procedure

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImRadiationDoseObservation | component.value[x] | - | EHDSImagingReportBody | exposureInformation.effectiveDose |
| ImComposition | section[procedure].entry[procedure] | EuProcedure | EHDSImagingReportBody | examinationReport.medication |

### Comparison

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImComposition | section[comparison].entry[comparedstudy] | ImImagingStudy | EHDSImagingReportBody | comparisonStudy |

### Findings

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImDiagnosticReport | result | ImFinding, ImRadiationDoseObservation | EHDSImagingReportBody | examinationReport.resultData.observationResults |

### Impression

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| ImComposition | section[impression].entry[ImFinding] | ImFinding | EHDSImagingReportBody | examinationReport.conclusion.conditionOrFinding[x] |

### Recommendation

| First order resource | Element | Referenced resource | Logical model resource | Logical model field |
| -------- | ------- | -------------- | --------------------- | ------------------ |
| EuCarePlan | goal | EuGoal | EHDSCarePlan | goal |

