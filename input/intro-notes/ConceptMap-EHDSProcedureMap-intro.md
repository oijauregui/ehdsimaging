{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSProcedure {
  <<XtEHR dataset>>
  identifier
  description
  code
  date[x]
  performer
  anatomicLocation
  reason
  outcome
  complication
  deviceUsed
  focalDevice
  location
  note
  subject
}
link EHDSProcedure "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSProcedure.html"
class EuProcedure{
  <<FHIR>>
  identifier
  text
  code
  occurrenceDateTime
  occurrencePeriod
  performer.actor
  bodySite
  bodySite.extension[bodyStructure]
  reason
  outcome
  complication.concept
  used[device]
  focalDevice.manipulated
  location
  note
  subject
}

class EuBodyStructure{
  <<FHIR>>
  includedStructure.laterality
  includedStructure.
}

class EuPractitionerRole {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
class EuLocation {
  <<FHIR>>
}
class EuPatient {
  <<FHIR>>
}
EHDSProcedure --> EuProcedure
EuProcedure --> EuPractitionerRole : performer.actor
EuProcedure --> EuDevice : used[device]
EuProcedure --> EuLocation : location
EuProcedure --> EuPatient : subject
EHDSProcedure --> EuBodyStructure
```

