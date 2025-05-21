////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSEpisodeOfCareMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSEpisodeOfCare"
Description: "Map for EHDSEpisodeOfCare"
* status = #draft
* experimental = true
* title = "EHDSEpisodeOfCare Mapping"
* name = "EHDSEpisodeOfCareMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEpisodeOfCare"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEpisodeOfCare"
  * target = $EuEpisodeOfCareUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.30.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.30.2 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #reasonText
    * target[+]
      * code = #reason.value.concept.text
      * display = "C.30.3 - Reason text"
      * relationship = #equivalent
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason.value
      * display = "C.30.4 - Reason"
      * relationship = #equivalent
  * element[+]
    * code = #diagnosis
    * target[+]
      * code = #diagnosis
      * display = "C.30.5 - Diagnosis"
      * relationship = #equivalent
  * element[+]
    * code = #diagnosis.description
    * target[+]
      * code = #diagnosis.condition.concept.text
      * display = "C.30.5.1 - Description"
      * relationship = #equivalent
  * element[+]
    * code = #diagnosis.condition
    * target[+]
      * code = #diagnosis.condition
      * display = "C.30.5.2 - Condition"
      * relationship = #equivalent
  * element[+]
    * code = #patient
    * target[+]
      * code = #patient
      * display = "C.30.6 - Patient"
      * relationship = #equivalent

////////////////////////////////////////////////////
