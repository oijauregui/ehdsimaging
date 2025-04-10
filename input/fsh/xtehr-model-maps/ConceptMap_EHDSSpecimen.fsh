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
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #accessionIdentifier
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #typeOfSpecies
    * target[+]
      * code = #subject
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #material
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #collectionPeriod
    * target[+]
      * code = #collection.collected[x]
      * relationship = #related-to
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #collection.bodySite
      * relationship = #related-to
  * element[+]
    * code = #morphology
    * target[+]
      * code = #collection.bodySite
      * relationship = #related-to
  * element[+]
    * code = #sourceDevice
    * target[+]
      * code = #subject
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #collectionProcedureMethod
    * target[+]
      * code = #collection.method
      * relationship = #related-to
  * element[+]
    * code = #receivedDate
    * target[+]
      * code = #receivedTime
      * relationship = #equivalent
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #container
    * target[+]
      * code = #container
      * relationship = #related-to
  * element[+]
    * code = #container.specimenQuantity
    * target[+]
      * code = #container.specimenQuantity
      * relationship = #related-to
  * element[+]
    * code = #container.containerDevice
    * target[+]
      * code = #container.device
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSpecimen"
  * target = $EuPatientAnimalUrl
  * element[+]
    * code = #typeOfSpecies
    * target[+]
      * code = #extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSpecimen"
  * target = $EuBodyStructureUrl
  * element[+]
    * code = #morphology
    * target[+]
      * code = #morphology
      * relationship = #related-to

////////////////////////////////////////////////////
