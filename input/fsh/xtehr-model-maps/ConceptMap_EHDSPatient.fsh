////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSPatientMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSPatient"
Description: "Map for EHDSPatient"
* status = #draft
* experimental = true
* title = "EHDSPatient Mapping"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSPatient"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSPatient"
  * target = "ImPatient"
  * element[+]
    * code = #personalIdentifier
    * target[+]
      * code = #identifier
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * relationship = #equivalent
  * element[+]
    * code = #dateOfBirth
    * target[+]
      * code = #birthDate
      * relationship = #equivalent
  * element[+]
    * code = #administrativeGender
    * target[+]
      * code = #gender
      * relationship = #equivalent
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * relationship = #equivalent
  * element[+]
    * code = #telecom
    * target[+]
      * code = #telecom
      * relationship = #equivalent
  * element[+]
    * code = #maritalStatus
    * target[+]
      * code = #maritalStatus
      * relationship = #equivalent
  * element[+]
    * code = #citizenship
    * target[+]
      * code = #extension[patient-citizenship]
      * relationship = #equivalent
    * target[+]
      * code = #extension[patient-nationality]
      * relationship = #equivalent
  * element[+]
    * code = #communicationLanguage
    * target[+]
      * code = #communication.language
      * relationship = #equivalent

////////////////////////////////////////////////////
