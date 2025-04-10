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
class Procedure{
  <<FHIR>>
  identifier
  text
  code
  occurenceDateTime
  occurancePeriod
  performer.actor
  bodySite
  reason
  outcome
  complication.concept
  used.concept[device]
  focalDevice.manipulated
  location
  note
  subject
}

class HealthcareProffesionalEu {
  <<FHIR>>
}
class DeviceEu {
  <<FHIR>>
}
class LocationEu {
  <<FHIR>>
}
class PatientEu {
  <<FHIR>>
}
EHDSProcedure --> Procedure
Procedure --> HealthcareProffesionalEu : performer.actor
Procedure --> DeviceEu : used.concept[device]
Procedure --> LocationEu : location
Procedure --> PatientEu : subject
```

