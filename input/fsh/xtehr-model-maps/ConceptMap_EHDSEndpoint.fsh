////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSEndpointMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSEndpoint"
Description: "Map for EHDSEndpoint"
* status = #draft
* experimental = true
* title = "EHDSEndpoint Mapping"
* name = "EHDSEndpointMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEndpoint"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEndpoint"
  * target = "$EndpointUrl"
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #status
    * target[+]
      * code = #status
      * relationship = #related-to
  * element[+]
    * code = #connectionType
    * target[+]
      * code = #connectionType
      * relationship = #related-to
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * relationship = #related-to
  * element[+]
    * code = #managingOrganization
    * target[+]
      * code = #managingOrganization
      * relationship = #related-to
  * element[+]
    * code = #payload
    * target[+]
      * code = #payload
      * relationship = #related-to
  * element[+]
    * code = #payload.type
    * target[+]
      * code = #payload.type
      * relationship = #related-to
  * element[+]
    * code = #payload.mimeType
    * target[+]
      * code = #payload.mimeType
      * relationship = #related-to
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * relationship = #related-to
  * element[+]
    * code = #header
    * target[+]
      * code = #header
      * relationship = #related-to

////////////////////////////////////////////////////
