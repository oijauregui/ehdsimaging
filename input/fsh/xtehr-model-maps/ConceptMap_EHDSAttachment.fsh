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
* name = "EHDSAttachmentMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAttachment"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAttachment"
  * target = $EuAttachmentUrl
  * element[+]
    * code = #contentType
    * target[+]
      * code = #contentType
      * comment = "FHIR requires binding."
      * display = "C.7.1 - Content Type"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #language
    * target[+]
      * code = #language
      * display = "C.7.2 - Language"
      * relationship = #equivalent
  * element[+]
    * code = #data
    * target[+]
      * code = #data
      * display = "C.7.3 - Data"
      * relationship = #equivalent
  * element[+]
    * code = #url
    * target[+]
      * code = #url
      * display = "C.7.4 - URL"
      * relationship = #equivalent
  * element[+]
    * code = #size
    * target[+]
      * code = #size
      * display = "C.7.5 - Size"
      * relationship = #equivalent
  * element[+]
    * code = #hash
    * target[+]
      * code = #hash
      * display = "C.7.6 - Hash"
      * relationship = #equivalent
  * element[+]
    * code = #title
    * target[+]
      * code = #title
      * display = "C.7.7 - Title"
      * relationship = #equivalent
  * element[+]
    * code = #creationDate
    * target[+]
      * code = #creation
      * display = "C.7.8 - Creation date"
      * relationship = #equivalent
  * element[+]
    * code = #height
    * target[+]
      * code = #height
      * display = "C.7.9 - Height"
      * relationship = #equivalent
  * element[+]
    * code = #width
    * target[+]
      * code = #width
      * display = "C.7.10 - Width"
      * relationship = #equivalent
  * element[+]
    * code = #frames
    * target[+]
      * code = #frames
      * display = "C.7.11 - Frames"
      * relationship = #equivalent
  * element[+]
    * code = #duration
    * target[+]
      * code = #duration
      * display = "C.7.12 - Duration"
      * relationship = #equivalent

////////////////////////////////////////////////////
