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
* name = "EHDSPatientMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSPatient"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSPatient"
  * target = $EuPatientUrl
  * element[+]
    * code = #personalIdentifier
    * target[+]
      * code = #identifier
      * display = "C.1.1 - Personal identifier"
      * relationship = #equivalent
  * element[+]
    * code = #name
    * target[+]
      * code = #name
      * display = "C.1.2 - Name"
      * relationship = #equivalent
  * element[+]
    * code = #dateOfBirth
    * target[+]
      * code = #birthDate
      * display = "C.1.3 - Date of birth"
      * relationship = #equivalent
  * element[+]
    * code = #administrativeGender
    * target[+]
      * code = #gender
      * display = "C.1.4 - Administrative gender"
      * relationship = #equivalent
  * element[+]
    * code = #address
    * target[+]
      * code = #address
      * display = "C.1.5 - Address"
      * relationship = #equivalent
  * element[+]
    * code = #telecom
    * target[+]
      * code = #telecom
      * display = "C.1.6 - Telecom"
      * relationship = #equivalent
  * element[+]
    * code = #maritalStatus
    * target[+]
      * code = #maritalStatus
      * display = "C.1.7 - Marital status"
      * relationship = #equivalent
  * element[+]
    * code = #citizenship
    * target[+]
      * code = #extension[patient-citizenship]
      * display = "C.1.8 - Citizenship (nationality)"
      * relationship = #equivalent
    * target[+]
      * code = #extension[patient-nationality]
      * display = "C.1.8 - Citizenship (nationality)"
      * relationship = #equivalent
  * element[+]
    * code = #communicationLanguage
    * target[+]
      * code = #communication.language
      * display = "C.1.9 - Communcation language"
      * relationship = #equivalent

////////////////////////////////////////////////////
