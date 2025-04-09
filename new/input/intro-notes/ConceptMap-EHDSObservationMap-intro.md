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
  value[x[
  valueQuantity
  component.valueQuantity
  valueRange
  valueRange.low
  valueRange.high
  valueQuantity.system
  valueQuantity.code
  ValueRange.low.system
  ValueRange.low.code
  ValueRange.high.system
  ValueRange.high.unit
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
  component.ValueRange
  component.ValueRange.low
  component.ValueRange.high
  component.valueQuantity.system
  component.valueQuantity.code
  component.ValueRange.low.system
  component.ValueRange.low.code
  component.ValueRange.high.system
  component.ValueRange.high.unit
  component.valueQuantity.extension[iso21090-uncertainty]
  component.valueQuantity.extension[iso21090-uncertaintyType]
  component.valudeCodeableConcept
  component.value[x].extension[dataAbsenseReason]
  component.referenceRange
  component.interpretation
  status.value
}

class ServiceRequest{
  <<FHIR>>
  requester
}

class EuDevice {
  <<FHIR>>
}
class ServiceRequest {
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
EuObservation --> ServiceRequest : basedOn
EuObservation --> PractitionerRoleEU : performer
EuObservation --> ObervationEu : triggeredBy.observation
EuObservation --> ObervationEu : hasMember
EuObservation --> Resource : subject
EHDSObservation --> ServiceRequest
ServiceRequest --> HealtcareProffesionalEu : requester
```

