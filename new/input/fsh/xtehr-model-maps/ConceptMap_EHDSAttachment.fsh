////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSAttachmentMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSAttachment"
Description: "Map for EHDSAttachment"
* status = #draft
* experimental = true
* title = "EHDSAttachment Mapping"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAttachment"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAttachment"
  * target = "Attachment"
  * element[+]
    * code = #contentType
    * target[+]
      * code = #contentType
      * comment = "FHIR requires binding."
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #language
    * target[+]
      * code = #language
      * relationship = #equivalent
  * element[+]
    * code = #data
    * target[+]
      * code = #data
      * relationship = #equivalent
  * element[+]
    * code = #url
    * target[+]
      * code = #url
      * relationship = #equivalent
  * element[+]
    * code = #size
    * target[+]
      * code = #size
      * relationship = #equivalent
  * element[+]
    * code = #hash
    * target[+]
      * code = #hash
      * relationship = #equivalent
  * element[+]
    * code = #title
    * target[+]
      * code = #title
      * relationship = #equivalent
  * element[+]
    * code = #creationDate
    * target[+]
      * code = #creation
      * relationship = #equivalent
  * element[+]
    * code = #height
    * target[+]
      * code = #height
      * relationship = #equivalent
  * element[+]
    * code = #width
    * target[+]
      * code = #width
      * relationship = #equivalent
  * element[+]
    * code = #frames
    * target[+]
      * code = #frames
      * relationship = #equivalent
  * element[+]
    * code = #duration
    * target[+]
      * code = #duration
      * relationship = #equivalent

////////////////////////////////////////////////////
