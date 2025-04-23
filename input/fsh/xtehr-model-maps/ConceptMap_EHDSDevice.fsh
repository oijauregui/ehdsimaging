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
  * target = $EuDeviceUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.12.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #manufacturer
    * target[+]
      * code = #manufacturer
      * display = "C.12.2 - Manufacturer"
      * relationship = #equivalent
  * element[+]
    * code = #manufactureDate
    * target[+]
      * code = #manufactureDate
      * display = "C.12.3 - Manufacture date"
      * relationship = #equivalent
  * element[+]
    * code = #expiryDate
    * target[+]
      * code = #expirationDate
      * display = "C.12.4 - Expiry date"
      * relationship = #equivalent
  * element[+]
    * code = #lotNumber
    * target[+]
      * code = #lotNumber
      * display = "C.12.5 - Lot number"
      * relationship = #equivalent
  * element[+]
    * code = #serialNumber
    * target[+]
      * code = #serialNumber
      * display = "C.12.6 - Serial number"
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.12.7 - Name"
      * relationship = #equivalent
  * element[+]
    * code = #modelNumber
    * target[+]
      * code = #modelNumber
      * display = "C.12.8 - Model number"
      * relationship = #equivalent
  * element[+]
    * code = #version
    * target[+]
      * code = #version
      * display = "C.12.9 - Version"
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.12.10 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * display = "C.12.11 - Note"
      * relationship = #equivalent

////////////////////////////////////////////////////
