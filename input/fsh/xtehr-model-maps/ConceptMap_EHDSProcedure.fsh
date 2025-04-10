////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSProcedureMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSProcedure"
Description: "Map for EHDSProcedure"
* status = #draft
* experimental = true
* title = "EHDSProcedure Mapping"
* name = "EHDSProcedureMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSProcedure"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSProcedure"
  * target = $EuProcedureUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #description
    * target[+]
      * code = #text
      * relationship = #related-to
  * element[+]
    * code = #code
    * target[+]
      * code = #code
      * relationship = #related-to
  * element[+]
    * code = #date[x]
    * target[+]
      * code = #occurenceDateTime
      * relationship = #related-to
    * target[+]
      * code = #occurancePeriod
      * relationship = #related-to
  * element[+]
    * code = #performer
    * target[+]
      * code = #performer.actor
      * relationship = #related-to
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * comment = "bodysite"
      * relationship = #related-to
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason
      * relationship = #related-to
  * element[+]
    * code = #outcome
    * target[+]
      * code = #outcome
      * relationship = #related-to
  * element[+]
    * code = #complication
    * target[+]
      * code = #complication.concept
      * relationship = #related-to
  * element[+]
    * code = #deviceUsed
    * target[+]
      * code = #used.concept[device]
      * relationship = #related-to
  * element[+]
    * code = #focalDevice
    * target[+]
      * code = #focalDevice.manipulated
      * relationship = #related-to
  * element[+]
    * code = #location
    * target[+]
      * code = #location
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * relationship = #related-to
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * relationship = #related-to

////////////////////////////////////////////////////
