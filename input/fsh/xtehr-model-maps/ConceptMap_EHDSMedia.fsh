////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSMediaMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSMedia"
Description: "Map for EHDSMedia"
* status = #draft
* experimental = true
* title = "EHDSMedia Mapping"
* name = "EHDSMediaMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedia"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedia"
  * target = $EuDocumentReferenceUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.14.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * comment = "part of the mimetype"
      * display = "C.14.2 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #modality
    * target[+]
      * code = #modality
      * display = "C.14.3 - Modality"
      * relationship = #equivalent
  * element[+]
    * code = #view
    * target[+]
      * code = #extension[view]
      * display = "C.14.4 - View"
      * relationship = #equivalent
  * element[+]
    * code = #subject[x]
    * target[+]
      * code = #subject
      * display = "C.14.5 - Subject"
      * relationship = #equivalent
  * element[+]
    * code = #created[x]
    * target[+]
      * code = #period
      * display = "C.14.6 - Created"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #reason
    * target[+]
      * code = #event
      * comment = "Event codes the context or the reason for the DocumentReference."
      * display = "C.14.7 - Reason"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #bodysite
    * target[+]
      * code = #bodySite.concept
      * display = "C.14.8 - BodySite"
      * relationship = #equivalent
  * element[+]
    * code = #deviceName
    * target[+]
      * code = #author
      * display = "C.14.9 - Device name"
      * relationship = #equivalent
  * element[+]
    * code = #device
    * target[+]
      * code = #author
      * display = "C.14.10 - Device"
      * relationship = #equivalent
  * element[+]
    * code = #content
    * target[+]
      * code = #content.attachment
      * display = "C.14.11 - Content"
      * relationship = #equivalent
  * element[+]
    * code = #note
    * target[+]
      * code = #extension[note]
      * display = "C.14.12 - Note"
      * relationship = #equivalent
  * element[+]
    * code = #performer
    * target[+]
      * code = #author
      * display = "C.14.13 - Performer"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedia"
  * target = $EuDeviceUrl
  * element[+]
    * code = #deviceName
    * target[+]
      * code = #name
      * display = "C.14.9 - Device name"
      * relationship = #equivalent

////////////////////////////////////////////////////
