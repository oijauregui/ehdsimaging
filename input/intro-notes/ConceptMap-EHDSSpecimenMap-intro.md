{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSSpecimen {
  <<XtEHR dataset>>
  identifier
  typeOfSpecies
  material
  collectionPeriod
  anatomicLocation
  morphology
  sourceDevice
  collectionProcedureMethod
  receivedDate
  subject
  container
  container.specimenQuantity
  container.containerDevice
}
class SpecimenEu{
  identifier
  accessionIdentifier
  subject
  type
  collection.collected[x]
  collection.bodySite
  collection.method
  receivedTime
  container
  container.specimenQuantity
  container.device
}

class PatientAnimalEu{
  extension[http\://hl7.org/fhir/StructureDefinition/patient-animal]
}

class BodyStructureEu{
  morphology
}

EHDSSpecimen --> SpecimenEu
SpecimenEu --> PatientAnimalEu : subject
SpecimenEu --> BodyStructureEu : collection.bodySite
SpecimenEu --> DeviceEu : container.device
EHDSSpecimen --> PatientAnimalEu
EHDSSpecimen --> BodyStructureEu
```

