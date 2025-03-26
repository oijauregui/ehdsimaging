{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSHumanName {
  <<XtEHR dataset>>
  use
  text
  family
  given
  prefix
  suffix
}
class HumanName-eu{
  use
  text
  family
  family.extension[fathersFamily]
  family.extension[mothersFamily]
  given
  prefix
  suffix
}

EHDSHumanName --> HumanName-eu
```

