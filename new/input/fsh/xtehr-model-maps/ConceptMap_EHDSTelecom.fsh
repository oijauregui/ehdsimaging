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
  * target = "$ContactPointUrl"
  * element[+]
    * code = #use
    * target[+]
      * code = #use
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #system
      * relationship = #equivalent
  * element[+]
    * code = #value
    * target[+]
      * code = #value
      * relationship = #equivalent

////////////////////////////////////////////////////
