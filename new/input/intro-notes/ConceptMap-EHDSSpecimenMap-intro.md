{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
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
link EHDSSpecimen "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSSpecimen.html"
class SpecimenEu{
  <<FHIR>>
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
  <<FHIR>>
  extension[http\://hl7.org/fhir/StructureDefinition/patient-animal]
}

class BodyStructureEu{
  <<FHIR>>
  morphology
}

class PatientAnimalEu {
  <<FHIR>>
}
class BodyStructureEu {
  <<FHIR>>
}
class DeviceEu {
  <<FHIR>>
}
EHDSSpecimen --> SpecimenEu
SpecimenEu --> PatientAnimalEu : subject
SpecimenEu --> BodyStructureEu : collection.bodySite
SpecimenEu --> DeviceEu : container.device
EHDSSpecimen --> PatientAnimalEu
EHDSSpecimen --> BodyStructureEu
```

