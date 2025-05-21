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
      * display = "C.32.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #modality
    * target[+]
      * code = #modality
      * display = "C.32.2 - Modality"
      * relationship = #equivalent
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "C.32.3 - Subject"
      * relationship = #equivalent
  * element[+]
    * code = #encounter
    * target[+]
      * code = #encounter
      * display = "C.32.4 - Encounter"
      * relationship = #equivalent
  * element[+]
    * code = #started
    * target[+]
      * code = #started
      * display = "C.32.5 - Started"
      * relationship = #equivalent
  * element[+]
    * code = #basedOn
    * target[+]
      * code = #basedOn
      * display = "C.32.6 - Based on"
      * relationship = #equivalent
  * element[+]
    * code = #numberOfSeries
    * target[+]
      * code = #numberOfSeries
      * display = "C.32.7 - Number of series"
      * relationship = #equivalent
  * element[+]
    * code = #numberOfInstances
    * target[+]
      * code = #numberOfInstances
      * display = "C.32.8 - Number of instances"
      * relationship = #equivalent
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * display = "C.32.9 - Description"
      * relationship = #equivalent
  * element[+]
    * code = #studyCustodian
    * target[+]
      * code = #series.performer[custodian]
      * display = "C.32.10 - Study custodian"
      * relationship = #equivalent
  * element[+]
    * code = #studyEndpoint
    * target[+]
      * code = #endpoint
      * display = "C.32.11 - Study endpoint"
      * relationship = #equivalent
  * element[+]
    * code = #series
    * target[+]
      * code = #series
      * display = "C.32.12 - Series"
      * relationship = #equivalent
  * element[+]
    * code = #series.seriesUid
    * target[+]
      * code = #series.uid
      * display = "C.32.12.1 - Series UID"
      * relationship = #equivalent
  * element[+]
    * code = #series.number
    * target[+]
      * code = #series.number
      * display = "C.32.12.2 - Number"
      * relationship = #equivalent
  * element[+]
    * code = #series.acquisitionModality
    * target[+]
      * code = #series.modality
      * display = "C.32.12.3 - Acquisition modality"
      * relationship = #equivalent
  * element[+]
    * code = #series.description
    * target[+]
      * code = #series.description
      * display = "C.32.12.4 - Description"
      * relationship = #equivalent
  * element[+]
    * code = #series.numberOfInstances
    * target[+]
      * code = #series.numberOfInstances
      * display = "C.32.12.5 - Number of instances"
      * relationship = #equivalent
  * element[+]
    * code = #series.seriesEndpoint
    * target[+]
      * code = #series.endpoint
      * display = "C.32.12.6 - Series endpoint"
      * relationship = #equivalent
  * element[+]
    * code = #series.bodySite
    * target[+]
      * code = #series.bodySite
      * display = "C.32.12.7 - Body site"
      * relationship = #equivalent
  * element[+]
    * code = #series.laterality
    * target[+]
      * code = #series.laterality
      * display = "C.32.12.8 - Laterality"
      * relationship = #equivalent
  * element[+]
    * code = #series.specimen
    * target[+]
      * code = #series.specimen
      * display = "C.32.12.9 - Specimen"
      * relationship = #equivalent
  * element[+]
    * code = #series.started
    * target[+]
      * code = #series.started
      * display = "C.32.12.10 - Started"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries
    * target[+]
      * code = #series.instance
      * display = "C.32.12.11 - Instances in the series"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries.instanceTitle
    * target[+]
      * code = #series.instance.extension[instance-description]
      * comment = "Not regular"
      * display = "C.32.12.11.1 - Instance title"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries.instanceUid
    * target[+]
      * code = #series.instance.uid
      * display = "C.32.12.11.2 - Instance UID"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries.sopClass
    * target[+]
      * code = #series.instance.sopClass
      * display = "C.32.12.11.3 - SOP class"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries.instanceNumber
    * target[+]
      * code = #series.instance.number
      * display = "C.32.12.11.4 - Instance number"
      * relationship = #equivalent
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation
    * target[+]
      * code = #series.instance
      * comment = "Present in referred DICOM SR document"
      * display = "C.32.12.11.5 - Radiation dose information"
      * relationship = #source-is-narrower-than-target
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * target = $ImWadoEndpointUrl
  * element[+]
    * code = #studyEndpoint
    * noMap = true
  * element[+]
    * code = #series.seriesEndpoint
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * target = $ImImageIidViewerEndpointUrl
  * element[+]
    * code = #studyEndpoint
    * noMap = true
  * element[+]
    * code = #series.seriesEndpoint
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * target = $ImRadiationDoseObservationUrl
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.kap
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "C.32.12.11.5.1 - KAP"
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.totalKerma
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "C.32.12.11.5.2 - Total Kerma"
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.endTubeKerma
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "C.32.12.11.5.3 - End tube Kerma"
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.breastThickness
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "C.32.12.11.5.4 - Breast thickness"
      * relationship = #related-to
  * element[+]
    * code = #series.instancesInTheSeries.radiationDoseInformation.abd
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "C.32.12.11.5.5 - 2ABD"
      * relationship = #related-to
  * element[+]
    * code = #phase.radiationDose
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "C.32.13.2 - Radiation dose"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingStudy"
  * element[+]
    * code = #phase
    * noMap = true
    * display = "(C.32.13 - Phase)"
  * element[+]
    * code = #phase.phaseCode
    * noMap = true
    * display = "(C.32.13.1 - Phase code)"

////////////////////////////////////////////////////
