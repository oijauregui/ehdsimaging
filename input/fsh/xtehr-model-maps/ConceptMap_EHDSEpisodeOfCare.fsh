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
      * relationship = #related-to
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.30.2 - Type"
      * relationship = #related-to
  * element[+]
    * code = #reasonText
    * target[+]
      * code = #reason.value.concept.text
      * display = "C.30.3 - Reason text"
      * relationship = #related-to
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason.value
      * display = "C.30.4 - Reason"
      * relationship = #related-to
  * element[+]
    * code = #diagnosis
    * target[+]
      * code = #diagnosis
      * display = "C.30.5 - Diagnosis"
      * relationship = #related-to
  * element[+]
    * code = #diagnosis.description
    * target[+]
      * code = #diagnosis.condition.concept.text
      * display = "C.30.5.1 - Description"
      * relationship = #related-to
  * element[+]
    * code = #diagnosis.condition
    * target[+]
      * code = #diagnosis.condition
      * display = "C.30.5.2 - Condition"
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #patient
      * display = "C.30.6 - Patient"
      * relationship = #related-to

////////////////////////////////////////////////////
