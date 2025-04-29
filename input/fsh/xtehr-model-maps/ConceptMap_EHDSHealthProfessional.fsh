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
      * display = "C.2.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.2.2 - Name"
      * relationship = #equivalent
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * display = "C.2.3 - Address"
      * relationship = #equivalent
  * element[+]
    * code = #telecom
    * target[+]
      * code = #telecom
      * display = "C.2.4 - Telecom"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHealthProfessional"
  * target = $EuPractitionerRoleUrl
  * element[+]
    * code = #role
    * target[+]
      * code = #code
      * display = "C.2.5 - Role"
      * relationship = #equivalent
  * element[+]
    * code = #organization
    * target[+]
      * code = #organization
      * display = "C.2.6 - Organization"
      * relationship = #equivalent
  * element[+]
    * code = #specialty
    * target[+]
      * code = #specialty
      * display = "C.2.7 - Specialty"
      * relationship = #equivalent

////////////////////////////////////////////////////
