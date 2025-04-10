////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSRelatedPersonMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSRelatedPerson"
Description: "Map for EHDSRelatedPerson"
* status = #draft
* experimental = true
* title = "EHDSRelatedPerson Mapping"
* name = "EHDSRelatedPersonMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSRelatedPerson"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSRelatedPerson"
  * target = "$RelatedPersonUrl"
  * element[+]
    * code = #personalIdentifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * relationship = #related-to
  * element[+]
    * code = #relationship
    * target[+]
      * code = #relationship
      * relationship = #related-to
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * relationship = #related-to
  * element[+]
    * code = #telecom
    * target[+]
      * code = #telecom
      * relationship = #related-to

////////////////////////////////////////////////////
