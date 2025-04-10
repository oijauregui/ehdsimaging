////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSHealthProfessionalMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSHealthProfessional"
Description: "Map for EHDSHealthProfessional"
* status = #draft
* experimental = true
* title = "EHDSHealthProfessional Mapping"
* name = "EHDSHealthProfessionalMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHealthProfessional"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHealthProfessional"
  * target = $EuPractitionerUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #name
    * target[+]
      * code = #name
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
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHealthProfessional"
  * target = $EuPractitionerRoleUrl
  * element[+]
    * code = #role
    * target[+]
      * code = #code
      * relationship = #related-to
  * element[+]
    * code = #organization
    * target[+]
      * code = #organization
      * relationship = #related-to
  * element[+]
    * code = #specialty
    * target[+]
      * code = #specialty
      * relationship = #related-to

////////////////////////////////////////////////////
