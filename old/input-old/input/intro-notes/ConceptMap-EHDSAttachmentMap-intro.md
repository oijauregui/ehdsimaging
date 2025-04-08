{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
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
class Attachment{
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

EHDSAttachment --> Attachment
```

