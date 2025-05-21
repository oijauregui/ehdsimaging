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
* name = "EHDSOrganizationMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSOrganization"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSOrganization"
  * target = $EuOrganizationUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.3.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.3.2 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.3.3 - Name"
      * relationship = #equivalent
  * element[+]
    * code = #address
    * target[+]
      * code = #contact.address
      * display = "C.3.4 - Address"
      * relationship = #equivalent
  * element[+]
    * code = #telecom
    * target[+]
      * code = #contact.telecom
      * display = "C.3.5 - Telecom"
      * relationship = #equivalent
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * display = "C.3.6 - Part of"
      * relationship = #equivalent

////////////////////////////////////////////////////
