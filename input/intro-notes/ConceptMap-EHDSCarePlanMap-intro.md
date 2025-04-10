{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
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
link EHDSCarePlan "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSCarePlan.html"
class EuCarePlan{
  <<FHIR>>
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

class patient-eu {
  <<FHIR>>
}
class practitionerRole-eu {
  <<FHIR>>
}
class EuGoal {
  <<FHIR>>
}
EHDSCarePlan --> EuCarePlan
EuCarePlan --> patient-eu : subject
EuCarePlan --> practitionerRole-eu : custodian
EuCarePlan --> practitionerRole-eu : contributor
EuCarePlan --> EuGoal : goal
```

