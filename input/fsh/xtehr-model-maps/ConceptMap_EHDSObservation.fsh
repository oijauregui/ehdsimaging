////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSObservationMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSObservation"
Description: "Map for EHDSObservation"
* status = #draft
* experimental = true
* title = "EHDSObservation Mapping"
* name = "EHDSObservationMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
  * target = $EuObservationUrl
  * element[+]
    * code = #observationDate[x]
    * target[+]
      * code = #effectiveDateTime
      * relationship = #related-to
    * target[+]
      * code = #effectivePeriod
      * relationship = #related-to
  * element[+]
    * code = #observationCode
    * target[+]
      * code = #code
      * relationship = #related-to
  * element[+]
    * code = #observationName
    * noMap = true
  * element[+]
    * code = #observationOriginalName
    * noMap = true
  * element[+]
    * code = #observationMethod
    * target[+]
      * code = #method
      * relationship = #related-to
  * element[+]
    * code = #observationDevice
    * target[+]
      * code = #device
      * relationship = #related-to
  * element[+]
    * code = #order
    * target[+]
      * code = #basedOn
      * relationship = #related-to
  * element[+]
    * code = #performer
    * target[+]
      * code = #performer
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #performer.extension[performerFunction]
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #reporter
    * target[+]
      * code = #performer
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #performer.extension[performerFunction]
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult
    * target[+]
      * code = #value[x]
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #component.value[x]
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.textualResult
    * target[+]
      * code = #text
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #observationResult.numericResult
    * target[+]
      * code = #value[x[
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #observationResult.numericResult.numericValue[x]
    * target[+]
      * code = #valueQuantity
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #component.valueQuantity
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #valueRange
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #valueRange.low
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #valueRange.high
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.numericResult.units
    * target[+]
      * code = #valueQuantity.system
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #valueQuantity.code
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #ValueRange.low.system
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #ValueRange.low.code
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #ValueRange.high.system
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #ValueRange.high.unit
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.numericResult.uncertainty
    * target[+]
      * code = #valueQuantity.extension[iso21090-uncertainty]
      * relationship = #related-to
    * target[+]
      * code = #valueQuantity.extension[iso21090-uncertaintyType]
      * relationship = #related-to
    * target[+]
      * code = #valueRange.low.extension[iso21090-uncertainty]
      * relationship = #related-to
    * target[+]
      * code = #valueRange.low.extension[iso21090-uncertaintyType]
      * relationship = #related-to
    * target[+]
      * code = #valueRange.high.extension[iso21090-uncertainty]
      * relationship = #related-to
    * target[+]
      * code = #valueRange.high.extension[iso21090-uncertaintyType]
      * relationship = #related-to
  * element[+]
    * code = #observationResult.codedResult
    * target[+]
      * code = #valueCodeableConcept
      * relationship = #related-to
  * element[+]
    * code = #dataAbsentReason
    * target[+]
      * code = #value[x].extension[dataAbsentReason]
      * relationship = #related-to
  * element[+]
    * code = #referenceRange
    * target[+]
      * code = #referenceRange
      * relationship = #related-to
  * element[+]
    * code = #observationInterpretation
    * target[+]
      * code = #interpretation
      * relationship = #related-to
  * element[+]
    * code = #triggeredBy[x]
    * target[+]
      * code = #triggeredBy.observation
      * relationship = #related-to
  * element[+]
    * code = #hasMember[x]
    * target[+]
      * code = #hasMember
      * relationship = #related-to
  * element[+]
    * code = #resultDescription
    * noMap = true
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * relationship = #related-to
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #component
    * target[+]
      * code = #component
      * relationship = #related-to
  * element[+]
    * code = #component.code
    * target[+]
      * code = #code
      * relationship = #related-to
  * element[+]
    * code = #component.textualResult
    * target[+]
      * code = #valueString
      * relationship = #related-to
  * element[+]
    * code = #component.numericResult
    * target[+]
      * code = #valueQuantity
      * relationship = #related-to
  * element[+]
    * code = #component.numericResult.numericValue[x]
    * target[+]
      * code = #component.valueQuantity
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange.low
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange.high
      * relationship = #related-to
  * element[+]
    * code = #component.numericResult.units
    * target[+]
      * code = #component.valueQuantity.system
      * relationship = #related-to
    * target[+]
      * code = #component.valueQuantity.code
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange.low.system
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange.low.code
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange.high.system
      * relationship = #related-to
    * target[+]
      * code = #component.ValueRange.high.unit
      * relationship = #related-to
  * element[+]
    * code = #component.numericResult.uncertainty
    * target[+]
      * code = #component.valueQuantity.extension[iso21090-uncertainty]
      * relationship = #related-to
    * target[+]
      * code = #component.valueQuantity.extension[iso21090-uncertaintyType]
      * relationship = #related-to
  * element[+]
    * code = #component.codedResult
    * target[+]
      * code = #component.valudeCodeableConcept
      * relationship = #related-to
  * element[+]
    * code = #component.dataAbsentReason
    * target[+]
      * code = #component.value[x].extension[dataAbsenseReason]
      * relationship = #related-to
  * element[+]
    * code = #component.referenceRange
    * target[+]
      * code = #component.referenceRange
      * relationship = #related-to
  * element[+]
    * code = #component.observationInterpretation
    * target[+]
      * code = #component.interpretation
      * relationship = #related-to
  * element[+]
    * code = #status
    * target[+]
      * code = #status.value
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
  * target = $EuServiceRequestUrl
  * element[+]
    * code = #order
    * target[+]
      * code = #requester
      * relationship = #related-to

////////////////////////////////////////////////////
