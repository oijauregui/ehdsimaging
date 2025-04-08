////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSOrganizationMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSOrganization"
Description: "Map for EHDSOrganization"
* status = #draft
* experimental = true
* title = "EHDSOrganization Mapping"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSOrganization"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSOrganization"
  * target = "http://hl7.eu/fhir/base/StructureDefinition/organization-eu"
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * relationship = #equivalent
  * element[+]
    * code = #address
    * target[+]
      * code = #contact.address
      * relationship = #equivalent
  * element[+]
    * code = #telecom
    * target[+]
      * code = #contact.telecom
      * relationship = #equivalent
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * relationship = #equivalent

////////////////////////////////////////////////////
