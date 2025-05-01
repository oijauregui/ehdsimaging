{% include variable-definitions.md %}
For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.

The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.

NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [ImComposition](StructureDefinition-ImComposition.html), which is the parent type of this Report-ImComposition profile.

## Elements to include in sections narratives

### Imaging Study

The following table lists the elements that should be included in the narrative of the Imaging Study section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImImagingStudy | series.specimen | EuSpecimen | EHDSImagingReportBody.specimen |
| ImImagingStudy | series.bodySite | EuBodyStructure | EHDSImagingReportBody.examinationReport.bodyPart.bodyLocation |
| ImRadiationDoseObservation | component.value[x] | - | EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.kap |

### Order

The following table lists the elements that should be included in the narrative of the Order section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImOrder | requester | EuPractitionerRole | EHDSImagingReportBody.orderInformation.orderPlacer |

### History

The following table lists the elements that should be included in the narrative of the History section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImOrder | supportingInfo | EuObservation | EHDSImagingReportBody.orderInformation.supportingInformation.observation |
| ImOrder | reason | EuMedicationAdministration | EHDSImagingReportBody.orderInformation.supportingInformation.medicationAdministration |
| ImGestationalAgeObservation | value[x] | - | EHDSImagingReportBody.orderInformation.supportingInformation.gestationalAge |

### Procedure

The following table lists the elements that should be included in the narrative of the Procedure section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImRadiationDoseObservation | component.value[x] | - | EHDSImagingReportBody.exposureInformation.effectiveDose |
| ImComposition | section[procedure].entry[procedure] | EuProcedure | EHDSImagingReportBody.examinationReport.medication |

### Comparison

The following table lists the elements that should be included in the narrative of the Comparison section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImComposition | section[comparison].entry[comparedstudy] | ImImagingStudy | EHDSImagingReportBody.comparisonStudy |

### Findings

The following table lists the elements that should be included in the narrative of the Findings section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImDiagnosticReport | result | ImFinding, ImRadiationDoseObservation | EHDSImagingReportBody.examinationReport.resultData.observationResults |

### Impression

The following table lists the elements that should be included in the narrative of the Impression section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImComposition | section[impression].entry[ImFinding] | ImFinding | EHDSImagingReportBody.examinationReport.conclusion.conditionOrFinding[x] |

### Recommendation

The following table lists the elements that should be included in the narrative of the Recommendation section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCarePlan | goal | EuGoal | EHDSCarePlan.goal |

