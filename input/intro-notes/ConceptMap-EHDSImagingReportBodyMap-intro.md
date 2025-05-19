{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSImagingReportBody {
  <<XtEHR dataset>>
  orderInformation
  orderInformation.orderId
  orderInformation.orderDateAndTime
  orderInformation.orderPlacer
  orderInformation.orderReasonText
  orderInformation.orderReason
  orderInformation.clinicalQuestion
  orderInformation.supportingInformation
  orderInformation.supportingInformation.observation
  orderInformation.supportingInformation.condition
  orderInformation.supportingInformation.medicationAdministration
  orderInformation.supportingInformation.devices
  orderInformation.supportingInformation.pregnancyStatus
  orderInformation.supportingInformation.gestationalAge
  orderInformation.supportingInformation.sexForClinicalUse
  orderInformation.supportingInformation.otherSupportingInformation
  specimen
  serviceRequest
  exposureInformation
  exposureInformation.effectiveDose
  exposureInformation.equivalentDoseInformation
  exposureInformation.equivalentDoseInformation.equivalentDose
  exposureInformation.equivalentDoseInformation.tissueType
  examinationReport
  examinationReport.modality
  examinationReport.bodyPart
  examinationReport.bodyPart.bodyLocation
  examinationReport.bodyPart.laterality
  examinationReport.imagingProcedures
  examinationReport.medication
  examinationReport.adverseReaction
  examinationReport.resultData
  examinationReport.resultData.resultText
  examinationReport.resultData.observationResults
  examinationReport.conclusion
  examinationReport.conclusion.impression
  examinationReport.conclusion.conditionOrFinding[x]
  recommendation
  recommendation.description
  recommendation.carePlan
  comparisonStudy
}
link EHDSImagingReportBody "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSImagingReportBody.html"
class ImComposition{
  <<FHIR>>
  section[order]
  identifier
  section[order].entry[order]
  section[order].extension[note]
  section[history].entry
  subject
  section[procedure].entry[procedure]
  section[findings]
  section[findings].extension[note]
  section[findings].entry[ImFinding]
  section[impression]
  section[impression].entry[ImFinding]
  section[impression].entry[impression]
  section[recommendation]
  section[recommendation].entry[careplan]
  section[comparison].entry[comparedstudy]
}

class ImOrder{
  <<FHIR>>
  authoredOn
  requester
  reason.concept.text
  reason.concept
  supportingInfo
  reason
  supportingInfo[pregnancy]
}

class ImGestationalAgeObservation{
  <<FHIR>>
  value[x]
}

class ImPatient{
  <<FHIR>>
  extension[sex-for-clinical-use]
  extension[sex-for-clinical-use].extension[value].valueCodeableConcept
  extension[sex-for-clinical-use].extension[period].valuePeriod
}

class ImImagingStudy{
  <<FHIR>>
  series.specimen
  series.modality
  series.bodySite
}

class ImRadiationDoseObservation{
  <<FHIR>>
  component.value[x]
  bodySite
}

class EuBodyStructure{
  <<FHIR>>
  morphology
  includedStructure.structure
  includedStructure.laterality
}

class EuMedicationAdministration{
  <<FHIR>>
  partOf
}

class ImAdverseEvent{
  <<FHIR>>
  suspectEntity[procedure]
  contributingFactor[allergy]
  status
  code
  subject
}

class EuAllergyIntolerance
class ImDiagnosticReport{
  <<FHIR>>
  result
  conclusion
}

class EuCarePlan{
  <<FHIR>>
  description
}

class ImOrder {
  <<FHIR>>
}
class EuObservation {
  <<FHIR>>
}
class EuCondition {
  <<FHIR>>
}
class EuMedicationAdministration {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
class Observation-pregnancy-status-uv-ips {
  <<FHIR>>
}
class ImGestationalAgeObservation {
  <<FHIR>>
}
class ImPatient {
  <<FHIR>>
}
class EuProcedure {
  <<FHIR>>
}
class ImFinding {
  <<FHIR>>
}
class ImImpression {
  <<FHIR>>
}
class EuCarePlan {
  <<FHIR>>
}
class ImImagingStudy {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class  EuObservation {
  <<FHIR>>
}
class EuSpecimen {
  <<FHIR>>
}
class EuBodyStructure {
  <<FHIR>>
}
class ImProcedure {
  <<FHIR>>
}
class EuAllergyIntolerance {
  <<FHIR>>
}
class  ImRadiationDoseObservation {
  <<FHIR>>
}
EHDSImagingReportBody --> ImComposition
ImComposition --> ImOrder : section[order].entry[order]
ImComposition --> EuObservation : section[history].entry
ImComposition --> EuCondition : section[history].entry
ImComposition --> EuMedicationAdministration : section[history].entry
ImComposition --> EuDevice : section[history].entry
ImComposition --> Observation-pregnancy-status-uv-ips : section[history].entry
ImComposition --> ImGestationalAgeObservation : section[history].entry
ImComposition --> ImPatient : subject
ImComposition --> EuProcedure : section[procedure].entry[procedure]
ImComposition --> ImFinding : section[findings].entry[ImFinding]
ImComposition --> ImFinding : section[impression].entry[ImFinding]
ImComposition --> ImImpression : section[impression].entry[impression]
ImComposition --> EuCarePlan : section[recommendation].entry[careplan]
ImComposition --> ImImagingStudy : section[comparison].entry[comparedstudy]
EHDSImagingReportBody --> ImOrder
ImOrder --> EuPractitionerRole : requester
ImOrder --> EuCondition : supportingInfo
ImOrder -->  EuObservation : supportingInfo
ImOrder --> EuObservation : supportingInfo
ImOrder --> EuMedicationAdministration : reason
ImOrder --> EuDevice : supportingInfo
EHDSImagingReportBody --> ImGestationalAgeObservation
EHDSImagingReportBody --> ImPatient
EHDSImagingReportBody --> ImImagingStudy
ImImagingStudy --> EuSpecimen : series.specimen
ImImagingStudy --> EuBodyStructure : series.bodySite
EHDSImagingReportBody --> ImRadiationDoseObservation
EHDSImagingReportBody --> EuBodyStructure
EHDSImagingReportBody --> EuMedicationAdministration
EuMedicationAdministration --> ImProcedure : partOf
EHDSImagingReportBody --> ImAdverseEvent
ImAdverseEvent --> ImProcedure : suspectEntity[procedure]
ImAdverseEvent --> EuAllergyIntolerance : contributingFactor[allergy]
ImAdverseEvent --> ImPatient : subject
EHDSImagingReportBody --> EuAllergyIntolerance
EHDSImagingReportBody --> ImDiagnosticReport
ImDiagnosticReport --> ImFinding : result
ImDiagnosticReport -->  ImRadiationDoseObservation : result
EHDSImagingReportBody --> EuCarePlan
```

