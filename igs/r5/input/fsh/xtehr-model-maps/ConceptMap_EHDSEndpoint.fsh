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
  * target = $EuEndpointUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.33.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #status
    * target[+]
      * code = #status
      * display = "C.33.2 - Status"
      * relationship = #equivalent
  * element[+]
    * code = #connectionType
    * target[+]
      * code = #connectionType
      * display = "C.33.3 - Connection type"
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.33.4 - Name"
      * relationship = #equivalent
  * element[+]
    * code = #managingOrganization
    * target[+]
      * code = #managingOrganization
      * display = "C.33.5 - Managing organization"
      * relationship = #equivalent
  * element[+]
    * code = #payload
    * target[+]
      * code = #payload
      * display = "C.33.6 - Payload"
      * relationship = #equivalent
  * element[+]
    * code = #payload.type
    * target[+]
      * code = #payload.type
      * display = "C.33.6.1 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #payload.mimeType
    * target[+]
      * code = #payload.mimeType
      * display = "C.33.6.2 - Mime type"
      * relationship = #equivalent
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * display = "C.33.7 - Address"
      * relationship = #equivalent
  * element[+]
    * code = #header
    * target[+]
      * code = #header
      * display = "C.33.8 - Header"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEndpoint"
  * element[+]
    * code = #payload.profileCanonical
    * noMap = true
    * display = "lt refers to resources and logical models retrieved by an endpoint url. This is not the typical use of an Endpoint resource but more typically associated with Attachements. (C.33.6.3 - Profile Canonical)"
  * element[+]
    * code = #payload.profileUri
    * noMap = true
    * display = "lt refers to resources and logical models retrieved by an endpoint url. This is not the typical use of an Endpoint resource but more typically associated with Attachements. (C.33.6.4 - Profile uri)"

////////////////////////////////////////////////////
