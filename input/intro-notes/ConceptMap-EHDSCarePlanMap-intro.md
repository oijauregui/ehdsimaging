{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSCarePlan {
  <<XtEHR dataset>>
  identifier
  status
  intent
  title
  description
  patient
  period
  custodian
  contributor
  addresses
  goal
  activity
  note
}
class CareplanEu{
  identifier
  status
  intent
  title
  title.extension[http\://hl7.org/fhir/StructureDefinition/rendering-xhtml]
  description
  description.extension[http\://hl7.org/fhir/StructureDefinition/rendering-xhtml]
  subject
  period
  custodian
  contributor
  goal
  activity
  note
}

EHDSCarePlan --> CareplanEu
CareplanEu --> patient-eu : subject
CareplanEu --> practitionerRole-eu : custodian
CareplanEu --> practitionerRole-eu : contributor
CareplanEu --> EuGoal : goal
```

