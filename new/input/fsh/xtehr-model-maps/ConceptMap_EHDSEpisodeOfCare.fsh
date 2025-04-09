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
  * target = "$EpisodeOfCareUrl"
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #reasonText
    * target[+]
      * code = #reason.value.concept.text
      * relationship = #related-to
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason.value
      * relationship = #related-to
  * element[+]
    * code = #diagnosis
    * target[+]
      * code = #diagnosis
      * relationship = #related-to
  * element[+]
    * code = #diagnosis.description
    * target[+]
      * code = #diagnosis.condition.concept.text
      * relationship = #related-to
  * element[+]
    * code = #diagnosis.condition
    * target[+]
      * code = #diagnosis.condition
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * relationship = #related-to

////////////////////////////////////////////////////
