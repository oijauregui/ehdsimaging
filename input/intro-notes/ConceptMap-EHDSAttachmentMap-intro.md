{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSAttachment {
  <<XtEHR dataset>>
  contentType
  language
  data
  url
  size
  hash
  title
  creationDate
  height
  width
  frames
  duration
}
link EHDSAttachment "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSAttachment.html"
class EuAttachment{
  <<FHIR>>
  contentType
  language
  data
  url
  size
  hash
  title
  creation
  height
  width
  frames
  duration
}

EHDSAttachment --> EuAttachment
```

