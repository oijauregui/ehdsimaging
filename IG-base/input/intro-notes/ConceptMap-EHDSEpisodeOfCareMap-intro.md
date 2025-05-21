{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSEpisodeOfCare {
  <<XtEHR dataset>>
  identifier
  type
  reasonText
  reason
  diagnosis
  diagnosis.description
  diagnosis.condition
  patient
}
link EHDSEpisodeOfCare "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSEpisodeOfCare.html"
class EuEpisodeOfCare{
  <<FHIR>>
  identifier
  type
  reason.value.concept.text
  reason.value
  diagnosis
  diagnosis.condition.concept.text
  diagnosis.condition
  patient
}

EHDSEpisodeOfCare --> EuEpisodeOfCare
```

