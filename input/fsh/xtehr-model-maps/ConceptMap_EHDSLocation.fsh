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
  * target = $EuLocationUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.17.1 - Identifier"
      * relationship = #related-to
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.17.2 - Name"
      * relationship = #related-to
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * comment = "Source is xml"
      * display = "C.17.3 - Description"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.17.4 - Type"
      * relationship = #related-to
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * display = "C.17.5 - Address"
      * relationship = #related-to
  * element[+]
    * code = #position
    * target[+]
      * code = #position
      * display = "C.17.6 - Position"
      * relationship = #related-to
  * element[+]
    * code = #position.longitude
    * target[+]
      * code = #position.longitude
      * display = "C.17.6.1 - Longitude"
      * relationship = #related-to
  * element[+]
    * code = #position.latitude
    * target[+]
      * code = #position.latitude
      * display = "C.17.6.2 - Latitude"
      * relationship = #related-to
  * element[+]
    * code = #managingOrganization
    * target[+]
      * code = #managingOrganization
      * display = "C.17.7 - Managing organization"
      * relationship = #related-to
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * display = "C.17.8 - Part of"
      * relationship = #related-to

////////////////////////////////////////////////////
