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
| EuDevice | type |  | EHDSDevice.type |
| ImImagingStudy | series.specimen | EuSpecimen | EHDSImagingReportBody.specimen |
| ImImagingStudy | series.modality |  | EHDSImagingReportBody.examinationReport.modality |
| ImImagingStudy | series.bodySite | EuBodyStructure | EHDSImagingReportBody.examinationReport.bodyPart.bodyLocation |
| ImImagingStudy | series.bodySite | EuBodyStructure | EHDSImagingReportBody.examinationReport.bodyPart.laterality |
| EuBodyStructure | includedStructure.laterality |  | EHDSImagingReportBody.examinationReport.bodyPart.laterality |
| ImImagingStudy | identifier[studyInstanceUid] |  | EHDSImagingStudy.identifier |
| ImImagingStudy | modality |  | EHDSImagingStudy.modality |
| ImImagingStudy | numberOfSeries |  | EHDSImagingStudy.numberOfSeries |
| ImImagingStudy | description |  | EHDSImagingStudy.description |
| ImImagingStudy | series.bodySite | EuBodyStructure | EHDSImagingStudy.series.bodySite |
| ImImagingStudy | series.laterality |  | EHDSImagingStudy.series.laterality |
| ImImagingStudy | series.specimen | EuSpecimen | EHDSImagingStudy.series.specimen |
| ImImagingStudy | series.started |  | EHDSImagingStudy.series.started |
| ImRadiationDoseObservation | component.value[x] | - | EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.kap |
| EuDevice | name |  | EHDSMedia.deviceName |

### Order

The following table lists the elements that should be included in the narrative of the Order section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImOrder | authoredOn |  | EHDSImagingReportBody.orderInformation.orderDateAndTime |
| ImOrder | requester | EuPractitionerRole | EHDSImagingReportBody.orderInformation.orderPlacer |
| ImComposition | section[order].extension[note] |  | EHDSImagingReportBody.orderInformation.orderReasonText |
| ImOrder | reason.concept |  | EHDSImagingReportBody.orderInformation.orderReason |
| ImOrder | reason.concept |  | EHDSImagingReportBody.orderInformation.clinicalQuestion |
| ImOrder | identifier[accessionNumber] |  | EHDSImagingReportHeader.documentMetadata.accessionNumber |

### History

The following table lists the elements that should be included in the narrative of the History section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ImOrder | supportingInfo | EuObservation | EHDSImagingReportBody.orderInformation.supportingInformation.observation |
| ImOrder | supportingInfo | EuCondition | EHDSImagingReportBody.orderInformation.supportingInformation.condition |
| ImOrder | reason | EuMedicationAdministration | EHDSImagingReportBody.orderInformation.supportingInformation.medicationAdministration |
| ImOrder | supportingInfo[pregnancy] |  | EHDSImagingReportBody.orderInformation.supportingInformation.pregnancyStatus |
| ImGestationalAgeObservation | value[x] | - | EHDSImagingReportBody.orderInformation.supportingInformation.gestationalAge |
| ImPatient | extension[sex-for-clinical-use] |  | EHDSImagingReportBody.orderInformation.supportingInformation.sexForClinicalUse |
| ImPatient | extension[sex-for-clinical-use].extension[value].valueCodeableConcept |  | EHDSImagingReportBody.orderInformation.supportingInformation.sexForClinicalUse |
| ImPatient | extension[sex-for-clinical-use].extension[period].valuePeriod |  | EHDSImagingReportBody.orderInformation.supportingInformation.sexForClinicalUse |

### Procedure

The following table lists the elements that should be included in the narrative of the Procedure section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuAllergyIntolerance | text |  | EHDSAllergyIntolerance.allergyDescription |
| EuAllergyIntolerance | reaction |  | EHDSAllergyIntolerance.allergyManifestation |
| EuAllergyIntolerance | reaction.severity |  | EHDSAllergyIntolerance.allergyManifestation.severity |
| EuAllergyIntolerance | reaction.description |  | EHDSAllergyIntolerance.allergyManifestation.description |
| EuAllergyIntolerance | reaction.manifestation |  | EHDSAllergyIntolerance.allergyManifestation.manifestation |
| EuAllergyIntolerance | criticality |  | EHDSAllergyIntolerance.criticality |
| EuAllergyIntolerance | onsetPeriod |  | EHDSAllergyIntolerance.onsetDate |
| EuAllergyIntolerance | onsetDateTime |  | EHDSAllergyIntolerance.onsetDate |
| EuDevice | type |  | EHDSDevice.type |
| ImRadiationDoseObservation | component.value[x] | - | EHDSImagingReportBody.exposureInformation.effectiveDose |
| ImComposition | section[procedure].entry[procedure] | EuProcedure | EHDSImagingReportBody.examinationReport.medication |
| EuMedicationAdministration | partOf | ImProcedure | EHDSImagingReportBody.examinationReport.medication |
| ImAdverseEvent | status |  | EHDSImagingReportBody.examinationReport.adverseReaction |
| ImAdverseEvent | code |  | EHDSImagingReportBody.examinationReport.adverseReaction |
| EuDevice | name |  | EHDSMedia.deviceName |
| EuMedicationAdministration | reason |  | EHDSMedicationAdministration.reason |
| EuMedicationAdministration | note |  | EHDSMedicationAdministration.note |
| EuMedicationAdministration | dosage.text |  | EHDSMedicationAdministration.dosage.dosageDescription |
| EuMedicationAdministration | dosage.site |  | EHDSMedicationAdministration.dosage.site |
| EuMedicationAdministration | dosage.route |  | EHDSMedicationAdministration.dosage.route |
| EuMedicationAdministration | dosage.dose |  | EHDSMedicationAdministration.dosage.dose |

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
| ImComposition | section[findings].extension[note] |  | EHDSImagingReportBody.examinationReport.resultData.resultText |
| ImDiagnosticReport | result | ImFinding, ImRadiationDoseObservation | EHDSImagingReportBody.examinationReport.resultData.observationResults |

### Impression

The following table lists the elements that should be included in the narrative of the Impression section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCondition | note |  | EHDSCondition.description |
| EuCondition | code |  | EHDSCondition.code |
| EuCondition | clinicalStatus |  | EHDSCondition.clinicalStatus |
| EuCondition | severity |  | EHDSCondition.severity |
| EuCondition | bodySite |  | EHDSCondition.anatomicLocation |
| ImDiagnosticReport | conclusion |  | EHDSImagingReportBody.examinationReport.conclusion.impression |
| ImComposition | section[impression].entry[ImFinding] | ImFinding | EHDSImagingReportBody.examinationReport.conclusion.conditionOrFinding[x] |

### Recommendation

The following table lists the elements that should be included in the narrative of the Recommendation section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCarePlan | status |  | EHDSCarePlan.status |
| EuCarePlan | title |  | EHDSCarePlan.title |
| EuCarePlan | description |  | EHDSCarePlan.description |
| EuCarePlan | goal | EuGoal | EHDSCarePlan.goal |
| EuCarePlan | activity |  | EHDSCarePlan.activity |
| EuCarePlan | note |  | EHDSCarePlan.note |
| EuCarePlan | description |  | EHDSImagingReportBody.recommendation.description |

