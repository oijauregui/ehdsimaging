////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ImRadiationDoseObservation
Parent: ImRadiationDoseObservation
Id: Report-ImRadiationDoseObservation
Title: "Report obligations for ImRadiationDoseObservation"
Description: "Report obligations for ImRadiationDoseObservation"
* component.value[x]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReportBody.exposureInformation.effectiveDose, EHDSImagingReportBody.exposureInformation.equivalentDoseInformation, EHDSImagingReportBody.exposureInformation.equivalentDoseInformation.equivalentDose, EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.kap, EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.totalKerma, EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.endTubeKerma, EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.breastThickness, EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.abd, EHDSImagingStudy.phase.radiationDose"
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReportBody.exposureInformation.equivalentDoseInformation.tissueType"
