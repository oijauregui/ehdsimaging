{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSHumanName {
  <<XtEHR dataset>>
  use
  text
  family
  given
  prefix
  suffix
}
link EHDSHumanName "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSHumanName.html"
class HumanNameEU{
  <<FHIR>>
  use
  text
  family
  family.extension[fathersFamily]
  family.extension[mothersFamily]
  given
  prefix
  suffix
}

EHDSHumanName --> HumanNameEU
```

