////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSSpecimenMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSSpecimen"
Description: "Map for EHDSSpecimen"
* status = #draft
* experimental = true
* title = "EHDSSpecimen Mapping"
* name = "EHDSSpecimenMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSpecimen"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSpecimen"
  * target = $EuSpecimenUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.9.1 - Identifier"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #accessionIdentifier
      * display = "C.9.1 - Identifier"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #typeOfSpecies
    * target[+]
      * code = #subject
      * display = "C.9.2 - Type of species"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #material
    * target[+]
      * code = #type
      * display = "C.9.3 - Material"
      * relationship = #related-to
  * element[+]
    * code = #collectionPeriod
    * target[+]
      * code = #collection.collected[x]
      * display = "C.9.4 - Collection period"
      * relationship = #related-to
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #collection.bodySite
      * display = "C.9.5 - Anatomic location"
      * relationship = #related-to
  * element[+]
    * code = #morphology
    * target[+]
      * code = #collection.bodySite
      * display = "C.9.6 - Morphology"
      * relationship = #related-to
  * element[+]
    * code = #sourceDevice
    * target[+]
      * code = #subject
      * display = "C.9.7 - Source Device"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #collectionProcedureMethod
    * target[+]
      * code = #collection.method
      * display = "C.9.8 - Collection procedure method"
      * relationship = #related-to
  * element[+]
    * code = #receivedDate
    * target[+]
      * code = #receivedTime
      * display = "C.9.9 - Received date"
      * relationship = #equivalent
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "C.9.10 - Subject"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #container
    * target[+]
      * code = #container
      * display = "C.9.11 - Container"
      * relationship = #related-to
  * element[+]
    * code = #container.specimenQuantity
    * target[+]
      * code = #container.specimenQuantity
      * display = "C.9.11.1 - Specimen quantity"
      * relationship = #related-to
  * element[+]
    * code = #container.containerDevice
    * target[+]
      * code = #container.device
      * display = "C.9.11.2 - Container device"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSpecimen"
  * target = $EuPatientAnimalUrl
  * element[+]
    * code = #typeOfSpecies
    * target[+]
      * code = #extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
      * display = "C.9.2 - Type of species"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSpecimen"
  * target = $EuBodyStructureUrl
  * element[+]
    * code = #morphology
    * target[+]
      * code = #morphology
      * display = "C.9.6 - Morphology"
      * relationship = #related-to

////////////////////////////////////////////////////
