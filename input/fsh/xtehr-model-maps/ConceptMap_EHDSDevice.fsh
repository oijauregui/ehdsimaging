////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSDeviceMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSDevice"
Description: "Map for EHDSDevice"
* status = #draft
* experimental = true
* title = "EHDSDevice Mapping"
* name = "EHDSDeviceMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSDevice"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSDevice"
  * target = "$DeviceUrl"
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #manufacturer
    * target[+]
      * code = #manufacturer
      * relationship = #related-to
  * element[+]
    * code = #manufactureDate
    * target[+]
      * code = #manufactureDate
      * relationship = #related-to
  * element[+]
    * code = #expiryDate
    * target[+]
      * code = #expirationDate
      * relationship = #related-to
  * element[+]
    * code = #lotNumber
    * target[+]
      * code = #lotNumber
      * relationship = #related-to
  * element[+]
    * code = #serialNumber
    * target[+]
      * code = #serialNumber
      * relationship = #related-to
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * relationship = #related-to
  * element[+]
    * code = #modelNumber
    * target[+]
      * code = #modelNumber
      * relationship = #related-to
  * element[+]
    * code = #version
    * target[+]
      * code = #version
      * relationship = #related-to
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * relationship = #related-to

////////////////////////////////////////////////////
