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
  * target = $EuRelatedPersonUrl
  * element[+]
    * code = #personalIdentifier
    * target[+]
      * code = #identifier
      * display = "C.13.1 - Personal identifier"
      * relationship = #related-to
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.13.2 - Name"
      * relationship = #related-to
  * element[+]
    * code = #relationship
    * target[+]
      * code = #relationship
      * display = "C.13.3 - Relationship"
      * relationship = #related-to
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * display = "C.13.4 - Address"
      * relationship = #related-to
  * element[+]
    * code = #telecom
    * target[+]
      * code = #telecom
      * display = "C.13.5 - Telecom"
      * relationship = #related-to

////////////////////////////////////////////////////
