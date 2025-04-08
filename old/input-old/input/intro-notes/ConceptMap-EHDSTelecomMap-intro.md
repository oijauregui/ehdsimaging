{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSTelecom {
  <<XtEHR dataset>>
  use
  type
  value
}
class ContactPoint{
  use
  system
  value
}

EHDSTelecom --> ContactPoint
```

