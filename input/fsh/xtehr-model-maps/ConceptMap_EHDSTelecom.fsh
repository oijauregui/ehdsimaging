////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSTelecomMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSTelecom"
Description: "Map for EHDSTelecom"
* status = #draft
* experimental = true
* title = "EHDSTelecom Mapping"
* name = "EHDSTelecomMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSTelecom"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSTelecom"
  * target = $EuContactPointUrl
  * element[+]
    * code = #use
    * target[+]
      * code = #use
      * display = "C.6.1 - Use"
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #system
      * display = "C.6.2 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #value
    * target[+]
      * code = #value
      * display = "C.6.3 - Value"
      * relationship = #equivalent

////////////////////////////////////////////////////
