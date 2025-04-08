{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSGoal {
  <<XtEHR dataset>>
}
class Goal
EHDSGoal --> Goal
```

