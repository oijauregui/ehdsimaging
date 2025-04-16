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
      * relationship = #related-to
  * element[+]
    * code = #type
    * noMap = true
  * element[+]
    * code = #modality
    * target[+]
      * code = #modality
      * relationship = #related-to
  * element[+]
    * code = #view
    * noMap = true
  * element[+]
    * code = #subject[x]
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #created[x]
    * target[+]
      * code = #period
      * relationship = #related-to
  * element[+]
    * code = #bodysite
    * target[+]
      * code = #bodySite.concept
      * relationship = #related-to
  * element[+]
    * code = #deviceName
    * target[+]
      * code = #author
      * relationship = #related-to
  * element[+]
    * code = #device
    * target[+]
      * code = #author
      * relationship = #related-to
  * element[+]
    * code = #content
    * target[+]
      * code = #content.attachment
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #extension[note]
      * relationship = #related-to
  * element[+]
    * code = #performer
    * target[+]
      * code = #author
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedia"
  * target = $EuDeviceUrl
  * element[+]
    * code = #deviceName
    * target[+]
      * code = #name
      * relationship = #related-to

////////////////////////////////////////////////////
