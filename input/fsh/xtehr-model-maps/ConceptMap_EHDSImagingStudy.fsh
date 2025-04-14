////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSImagingStudyMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSImagingStudy"
Description: "Map for EHDSImagingStudy"
* status = #draft
* experimental = true
* title = "EHDSImagingStudy Mapping"
* name = "EHDSImagingStudyMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * target = $ImImagingStudyUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier[studyInstanceUid]
      * relationship = #equivalent
  * element[+]
    * code = #modality
    * target[+]
      * code = #modality
      * relationship = #equivalent
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * relationship = #equivalent
  * element[+]
    * code = #encounter
    * target[+]
      * code = #encounter
      * relationship = #equivalent
  * element[+]
    * code = #started
    * target[+]
      * code = #started
      * relationship = #equivalent
  * element[+]
    * code = #basedOn
    * target[+]
      * code = #basedOn
      * relationship = #equivalent
  * element[+]
    * code = #numberOfSeries
    * target[+]
      * code = #numberOfSeries
      * relationship = #equivalent
  * element[+]
    * code = #numberOfInstances
    * target[+]
      * code = #numberOfInstances
      * relationship = #equivalent
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * relationship = #equivalent
  * element[+]
    * code = #studyCustodian
    * target[+]
      * code = #series.performer[custodian]
      * relationship = #equivalent
  * element[+]
    * code = #studyEndpoint
    * target[+]
      * code = #endpoint
      * relationship = #equivalent
  * element[+]
    * code = #series
    * target[+]
      * code = #series
      * relationship = #related-to
  * element[+]
    * code = #series.seriesUid
    * target[+]
      * code = #series.uid
      * relationship = #related-to
  * element[+]
    * code = #series.number
    * target[+]
      * code = #series.number
      * relationship = #related-to
  * element[+]
    * code = #series.acquisitionModality
    * target[+]
      * code = #series.modality
      * relationship = #related-to
  * element[+]
    * code = #series.description
    * target[+]
      * code = #series.description
      * relationship = #related-to
  * element[+]
    * code = #series.numberOfInstances
    * target[+]
      * code = #series.numberOfInstances
      * relationship = #related-to
  * element[+]
    * code = #series.seriesEndpoint
    * target[+]
      * code = #series.endpoint
      * relationship = #related-to
  * element[+]
    * code = #series.bodySite
    * target[+]
      * code = #series.bodySite
      * relationship = #related-to
  * element[+]
    * code = #series.laterality
    * target[+]
      * code = #series.laterality
      * relationship = #related-to
  * element[+]
    * code = #series.specimen
    * target[+]
      * code = #series.specimen
      * relationship = #related-to
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #series.started
    * target[+]
      * code = #series.started
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries
    * target[+]
      * code = #series.instance
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.instanceTitle
    * target[+]
      * code = #series.instance.extension[instance-description]
      * comment = "Not regular"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries.instanceUid
    * target[+]
      * code = #series.instance.uid
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.sopClass
    * target[+]
      * code = #series.instance.sopClass
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.instanceNumber
    * target[+]
      * code = #series.instance.number
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation
    * target[+]
      * code = #series.instance
      * comment = "Present in referred DICOM SR document"
      * relationship = #source-is-narrower-than-target
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * target = $ImCompositionUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #modality
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #description
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #series.seriesUid
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #series.acquisitionModality
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #series.description
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #series.bodySite
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #series.laterality
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * target = $ImRadiationDoseObservationUrl
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.kap
    * target[+]
      * code = #component.value[x]
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.totalKerma
    * target[+]
      * code = #component.value[x]
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.endTubeKerma
    * target[+]
      * code = #component.value[x]
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.breastThickness
    * target[+]
      * code = #component.value[x]
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.abd
    * target[+]
      * code = #component.value[x]
      * relationship = #related-to
  * element[+]
    * code = #phase.radiationDose
    * target[+]
      * code = #component.value[x]
      * comment = "Present in referred DICOM SR document"
      * relationship = #source-is-narrower-than-target

////////////////////////////////////////////////////
