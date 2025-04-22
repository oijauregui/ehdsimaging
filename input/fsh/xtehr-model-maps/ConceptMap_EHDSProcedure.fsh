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
      * display = "C.16.1 - Identifier"
      * relationship = #related-to
  * element[+]
    * code = #description
    * target[+]
      * code = #text
      * display = "C.16.2 - Description"
      * relationship = #related-to
  * element[+]
    * code = #code
    * target[+]
      * code = #code
      * display = "C.16.3 - Code"
      * relationship = #related-to
  * element[+]
    * code = #date[x]
    * target[+]
      * code = #occurrenceDateTime
      * display = "C.16.4 - Date"
      * relationship = #related-to
    * target[+]
      * code = #occurrencePeriod
      * display = "C.16.4 - Date"
      * relationship = #related-to
  * element[+]
    * code = #performer
    * target[+]
      * code = #performer.actor
      * display = "C.16.5 - Performer"
      * relationship = #related-to
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * comment = "bodysite"
      * display = "C.16.6 - Anatomic location"
      * relationship = #related-to
    * target[+]
      * code = #bodySite.extension[bodyStructure]
      * comment = "bodysite"
      * display = "C.16.6 - Anatomic location"
      * relationship = #related-to
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason
      * display = "C.16.7 - Reason"
      * relationship = #related-to
  * element[+]
    * code = #outcome
    * target[+]
      * code = #outcome
      * display = "C.16.8 - Outcome"
      * relationship = #related-to
  * element[+]
    * code = #complication
    * target[+]
      * code = #complication.concept
      * display = "C.16.9 - Complication"
      * relationship = #related-to
  * element[+]
    * code = #deviceUsed
    * target[+]
      * code = #used[device]
      * display = "C.16.10 - Device used"
      * relationship = #related-to
  * element[+]
    * code = #focalDevice
    * target[+]
      * code = #focalDevice.manipulated
      * display = "C.16.11 - Focal device"
      * relationship = #related-to
  * element[+]
    * code = #location
    * target[+]
      * code = #location
      * display = "C.16.12 - Location"
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * display = "C.16.13 - Note"
      * relationship = #related-to
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "C.16.14 - Patient"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSProcedure"
  * target = $EuBodyStructureUrl
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #includedStructure.laterality
      * comment = "laterality"
      * display = "C.16.6 - Anatomic location"
      * relationship = #related-to
    * target[+]
      * code = #includedStructure.
      * comment = "bodysite"
      * display = "C.16.6 - Anatomic location"
      * relationship = #related-to

////////////////////////////////////////////////////
