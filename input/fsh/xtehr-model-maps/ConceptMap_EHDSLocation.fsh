////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSLocationMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSLocation"
Description: "Map for EHDSLocation"
* status = #draft
* experimental = true
* title = "EHDSLocation Mapping"
* name = "EHDSLocationMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSLocation"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSLocation"
  * target = "$EuLocationUrl"
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
    * code = #description
    * target[+]
      * code = #description
      * comment = "Source is xml"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * relationship = #related-to
  * element[+]
    * code = #position
    * target[+]
      * code = #position
      * relationship = #related-to
  * element[+]
    * code = #position.longitude
    * target[+]
      * code = #position.longitude
      * relationship = #related-to
  * element[+]
    * code = #position.latitude
    * target[+]
      * code = #position.latitude
      * relationship = #related-to
  * element[+]
    * code = #managingOrganization
    * target[+]
      * code = #managingOrganization
      * relationship = #related-to
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * relationship = #related-to

////////////////////////////////////////////////////
