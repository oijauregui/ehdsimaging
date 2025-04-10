{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSMedia {
  <<XtEHR dataset>>
  identifier
  type
  modality
  view
  subject[x]
  created[x]
  reason
  bodysite
  deviceName
  device
  content
  note
  performer
}
link EHDSMedia "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedia.html"
class DocumentReference{
  <<FHIR>>
  identifier
  modality
  subject
  period
  extension[workflow-reason].concept
  bodySite.concept
  author
  content.attachment
  extension[note]
}

class Device{
  <<FHIR>>
  name
}

class Device {
  <<FHIR>>
}
class PractitionerRole {
  <<FHIR>>
}
class  Practitioner {
  <<FHIR>>
}
EHDSMedia --> DocumentReference
DocumentReference --> Device : author
DocumentReference --> PractitionerRole : author
DocumentReference -->  Practitioner : author
EHDSMedia --> Device
```

