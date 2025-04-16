{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSServiceRequest {
  <<XtEHR dataset>>
  serviceText
  serviceCode
  reasonCode
  quantity
  anatomicLocation
  reasonReference
  priority
  supportingInformation
  specimen
  subject
  encounter
  occurance[x]
  patientInstructions
  coverage
}
link EHDSServiceRequest "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSServiceRequest.html"
class EuServiceRequest{
  <<FHIR>>
  text
  code.concept
  reason.concept
  quantityQuantity
  bodySite
  reason.reference
  priority
  supportingInfo
  specimen
  subject
  encounter
  occurrenceDateTime
  occurrencePeriod
  patientInstruction.instructionMarkdown
  insurance
}

class EuCondition {
  <<FHIR>>
}
class  EuObservation {
  <<FHIR>>
}
class EuSpecimen {
  <<FHIR>>
}
class EuEncounter {
  <<FHIR>>
}
class EuCoverage {
  <<FHIR>>
}
EHDSServiceRequest --> EuServiceRequest
EuServiceRequest --> EuCondition : supportingInfo
EuServiceRequest -->  EuObservation : supportingInfo
EuServiceRequest --> EuSpecimen : specimen
EuServiceRequest --> EuEncounter : encounter
EuServiceRequest --> EuCoverage : insurance
```

