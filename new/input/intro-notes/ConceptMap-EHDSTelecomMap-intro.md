{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSTelecom {
  <<XtEHR dataset>>
  use
  type
  value
}
link EHDSTelecom "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSTelecom.html"
class ContactPoint{
  <<FHIR>>
  use
  system
  value
}

EHDSTelecom --> ContactPoint
```

