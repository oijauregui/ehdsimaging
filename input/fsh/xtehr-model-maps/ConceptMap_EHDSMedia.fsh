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
      * relationship = #related-to
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * comment = "part of the mimetype"
      * display = "C.14.2 - Type"
      * relationship = #related-to
  * element[+]
    * code = #modality
    * target[+]
      * code = #modality
      * display = "C.14.3 - Modality"
      * relationship = #related-to
  * element[+]
    * code = #view
    * target[+]
      * code = #extension[view]
      * display = "C.14.4 - View"
      * relationship = #related-to
  * element[+]
    * code = #subject[x]
    * target[+]
      * code = #subject
      * display = "C.14.5 - Subject"
      * relationship = #related-to
  * element[+]
    * code = #created[x]
    * target[+]
      * code = #period
      * display = "C.14.6 - Created"
      * relationship = #related-to
  * element[+]
    * code = #bodysite
    * target[+]
      * code = #bodySite.concept
      * display = "C.14.8 - BodySite"
      * relationship = #related-to
  * element[+]
    * code = #deviceName
    * target[+]
      * code = #author
      * display = "C.14.9 - Device name"
      * relationship = #related-to
  * element[+]
    * code = #device
    * target[+]
      * code = #author
      * display = "C.14.10 - Device"
      * relationship = #related-to
  * element[+]
    * code = #content
    * target[+]
      * code = #content.attachment
      * display = "C.14.11 - Content"
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #extension[note]
      * display = "C.14.12 - Note"
      * relationship = #related-to
  * element[+]
    * code = #performer
    * target[+]
      * code = #author
      * display = "C.14.13 - Performer"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedia"
  * target = $EuDeviceUrl
  * element[+]
    * code = #deviceName
    * target[+]
      * code = #name
      * display = "C.14.9 - Device name"
      * relationship = #related-to

////////////////////////////////////////////////////
