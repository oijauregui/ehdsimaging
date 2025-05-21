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
class EuSpecimen{
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

class EuPatientAnimal{
  <<FHIR>>
  extension[http\://hl7.org/fhir/StructureDefinition/patient-animal]
}

class EuBodyStructure{
  <<FHIR>>
  morphology
}

class EuPatientAnimal {
  <<FHIR>>
}
class EuBodyStructure {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
EHDSSpecimen --> EuSpecimen
EuSpecimen --> EuPatientAnimal : subject
EuSpecimen --> EuBodyStructure : collection.bodySite
EuSpecimen --> EuDevice : container.device
EHDSSpecimen --> EuPatientAnimal
EHDSSpecimen --> EuBodyStructure
```

