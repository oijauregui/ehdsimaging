{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSDevice {
  <<XtEHR dataset>>
  identifier
  manufacturer
  manufactureDate
  expiryDate
  lotNumber
  serialNumber
  name
  modelNumber
  version
  type
  note
}
class Device{
  identifier
  manufacturer
  manufactureDate
  expirationDate
  lotNumber
  serialNumber
  name
  modelNumber
  version
  type
  note
}

EHDSDevice --> Device
```

