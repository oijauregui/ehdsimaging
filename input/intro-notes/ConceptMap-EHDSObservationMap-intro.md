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
  method
  device
  basedOn
  performer
  performer.extension[performerFunction]
  value[x]
  component.value[x]
  text
  valueQuantity
  component.valueQuantity
  valueRange
  valueRange.low
  valueRange.high
  valueQuantity.system
  valueQuantity.code
  valueRange.low.system
  valueRange.low.code
  valueRange.high.system
  valueRange.high.unit
  valueQuantity.extension[iso21090-uncertainty]
  valueQuantity.extension[iso21090-uncertaintyType]
  valueRange.low.extension[iso21090-uncertainty]
  valueRange.low.extension[iso21090-uncertaintyType]
  valueRange.high.extension[iso21090-uncertainty]
  valueRange.high.extension[iso21090-uncertaintyType]
  valueCodeableConcept
  value[x].extension[dataAbsentReason]
  referenceRange
  interpretation
  triggeredBy.observation
  hasMember
  bodySite
  subject
  component
  valueString
  component.valueRange
  component.valueRange.low
  component.valueRange.high
  component.valueQuantity.system
  component.valueQuantity.code
  component.valueRange.low.system
  component.valueRange.low.code
  component.valueRange.high.system
  component.valueRange.high.unit
  component.valueQuantity.extension[iso21090-uncertainty]
  component.valueQuantity.extension[iso21090-uncertaintyType]
  component.valudeCodeableConcept
  component.value[x].extension[dataAbsenseReason]
  component.referenceRange
  component.interpretation
  status.value
}

class EuServiceRequest{
  <<FHIR>>
  requester
}

class EuDevice {
  <<FHIR>>
}
class EuServiceRequest {
  <<FHIR>>
}
class PractitionerRoleEU {
  <<FHIR>>
}
class ObervationEu {
  <<FHIR>>
}
class Resource {
  <<FHIR>>
}
class HealtcareProffesionalEu {
  <<FHIR>>
}
EHDSObservation --> EuObservation
EuObservation --> EuDevice : device
EuObservation --> EuServiceRequest : basedOn
EuObservation --> PractitionerRoleEU : performer
EuObservation --> ObervationEu : triggeredBy.observation
EuObservation --> ObervationEu : hasMember
EuObservation --> Resource : subject
EHDSObservation --> EuServiceRequest
EuServiceRequest --> HealtcareProffesionalEu : requester
```

