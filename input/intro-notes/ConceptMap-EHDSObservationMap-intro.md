{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSObservation {
  <<XtEHR dataset>>
  observationDate[x]
  observationCode
  observationName
  observationOriginalName
  observationMethod
  observationDevice
  order
  performer
  reporter
  observationResult
  observationResult.textualResult
  observationResult.numericResult
  observationResult.numericResult.numericValue[x]
  observationResult.numericResult.units
  observationResult.numericResult.uncertainty
  observationResult.codedResult
  dataAbsentReason
  referenceRange
  observationInterpretation
  triggeredBy[x]
  hasMember[x]
  resultDescription
  anatomicLocation
  subject
  component
  component.code
  component.textualResult
  component.numericResult
  component.numericResult.numericValue[x]
  component.numericResult.units
  component.numericResult.uncertainty
  component.codedResult
  component.dataAbsentReason
  component.referenceRange
  component.observationInterpretation
  status
}
link EHDSObservation "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSObservation.html"
class EuObservation{
  <<FHIR>>
  effectiveDateTime
  effectivePeriod
  code
  code.coding.display
  method
  device
  basedOn
  performer
  performer.extension[performerFunction]
  value[x]
  valueString
  valueQuantity
  valueRange
  valueCodeableConcept
  referenceRange
  interpretation
  triggeredBy.observation
  triggeredBy.type
  hasMember
  note
  bodySite
  subject
  component
  component.valueQuantity
  component.valueRange
  component.valueCodeableConcept
  component.referenceRange
  component.interpretation
  status.value
}

class EuServiceRequest{
  <<FHIR>>
  requester
}

class EuQuantity{
  <<FHIR>>
  system
  code
  unit
  extension[uncertainty]
  extension[uncertaintyType]
}

class EuRange{
  <<FHIR>>
  low
  high
}

class EuSimpleQuantity{
  <<FHIR>>
  system
  code
  unit
  extension[uncertainty]
  extension[uncertaintyType]
}

class EuDevice {
  <<FHIR>>
}
class EuServiceRequest {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class EuObervation {
  <<FHIR>>
}
class Resource {
  <<FHIR>>
}
EHDSObservation --> EuObservation
EuObservation --> EuDevice : device
EuObservation --> EuServiceRequest : basedOn
EuObservation --> EuPractitionerRole : performer
EuObservation --> EuObervation : triggeredBy.observation
EuObservation --> EuObervation : hasMember
EuObservation --> Resource : subject
EHDSObservation --> EuServiceRequest
EuServiceRequest --> EuPractitionerRole : requester
EHDSObservation --> EuQuantity
EHDSObservation --> EuRange
EHDSObservation --> EuSimpleQuantity
```

