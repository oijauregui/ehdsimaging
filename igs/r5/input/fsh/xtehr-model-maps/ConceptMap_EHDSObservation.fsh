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
      * display = "C.10.1 - Observation date"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #effectivePeriod
      * display = "C.10.1 - Observation date"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationCode
    * target[+]
      * code = #code
      * display = "C.10.2 - Observation code"
      * relationship = #equivalent
  * element[+]
    * code = #observationName
    * target[+]
      * code = #code.coding.display
      * display = "C.10.3 - Observation name"
      * relationship = #equivalent
  * element[+]
    * code = #observationOriginalName
    * noMap = true
  * element[+]
    * code = #observationMethod
    * target[+]
      * code = #method
      * display = "C.10.5 - Observation method"
      * relationship = #equivalent
  * element[+]
    * code = #observationDevice
    * target[+]
      * code = #device
      * display = "C.10.6 - Observation device"
      * relationship = #equivalent
  * element[+]
    * code = #order
    * target[+]
      * code = #basedOn
      * display = "C.10.7 - Order"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #performer
    * target[+]
      * code = #performer
      * display = "C.10.8 - Performer"
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #performer.extension[performerFunction]
      * display = "C.10.8 - Performer"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #reporter
    * target[+]
      * code = #performer
      * display = "C.10.9 - Reporter"
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #performer.extension[performerFunction]
      * display = "C.10.9 - Reporter"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult
    * target[+]
      * code = #value[x]
      * display = "C.10.10 - Observation result"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.textualResult
    * target[+]
      * code = #valueString
      * display = "C.10.10.1 - Textual Result"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #observationResult.numericResult
    * target[+]
      * code = #valueQuantity
      * display = "C.10.10.2 - Numeric Result"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #observationResult.numericResult.numericValue[x]
    * target[+]
      * code = #valueRange
      * display = "C.10.10.2.1 - Numeric value"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.codedResult
    * target[+]
      * code = #valueCodeableConcept
      * display = "C.10.10.3 - Coded Result"
      * relationship = #equivalent
  * element[+]
    * code = #dataAbsentReason
    * noMap = true
  * element[+]
    * code = #referenceRange
    * target[+]
      * code = #referenceRange
      * display = "C.10.12 - Reference range"
      * relationship = #equivalent
  * element[+]
    * code = #observationInterpretation
    * target[+]
      * code = #interpretation
      * display = "C.10.13 - Observation interpretation"
      * relationship = #equivalent
  * element[+]
    * code = #triggeredBy[x]
    * target[+]
      * code = #triggeredBy.observation
      * display = "C.10.14 - Triggered by"
      * relationship = #equivalent
    * target[+]
      * code = #triggeredBy.type
      * display = "C.10.14 - Triggered by"
      * relationship = #equivalent
  * element[+]
    * code = #hasMember[x]
    * target[+]
      * code = #hasMember
      * display = "C.10.15 - Has member"
      * relationship = #equivalent
  * element[+]
    * code = #resultDescription
    * target[+]
      * code = #note
      * display = "C.10.16 - Result description"
      * relationship = #equivalent
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * display = "C.10.17 - Anatomic location"
      * relationship = #equivalent
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "C.10.18 - Subject"
      * relationship = #equivalent
  * element[+]
    * code = #component
    * target[+]
      * code = #component
      * display = "C.10.19 - Component"
      * relationship = #equivalent
  * element[+]
    * code = #component.code
    * target[+]
      * code = #code
      * display = "C.10.19.1 - Code"
      * relationship = #equivalent
  * element[+]
    * code = #component.textualResult
    * target[+]
      * code = #valueString
      * display = "C.10.19.2 - Textual Result"
      * relationship = #equivalent
  * element[+]
    * code = #component.numericResult
    * target[+]
      * code = #valueQuantity
      * display = "C.10.19.3 - Numeric Result"
      * relationship = #equivalent
  * element[+]
    * code = #component.numericResult.numericValue[x]
    * target[+]
      * code = #component.valueQuantity
      * display = "C.10.19.3.1 - Numeric value"
      * relationship = #equivalent
    * target[+]
      * code = #component.valueRange
      * display = "C.10.19.3.1 - Numeric value"
      * relationship = #equivalent
  * element[+]
    * code = #component.codedResult
    * target[+]
      * code = #component.valueCodeableConcept
      * display = "C.10.19.4 - Coded Result"
      * relationship = #equivalent
  * element[+]
    * code = #component.dataAbsentReason
    * noMap = true
  * element[+]
    * code = #component.referenceRange
    * target[+]
      * code = #component.referenceRange
      * display = "C.10.19.6 - Reference range"
      * relationship = #equivalent
  * element[+]
    * code = #component.observationInterpretation
    * target[+]
      * code = #component.interpretation
      * display = "C.10.19.7 - Observation interpretation"
      * relationship = #equivalent
  * element[+]
    * code = #status
    * target[+]
      * code = #status.value
      * display = "C.10.19.8 - Status"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
  * target = $EuServiceRequestUrl
  * element[+]
    * code = #order
    * target[+]
      * code = #requester
      * display = "C.10.7 - Order"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
  * target = $EuQuantityUrl
  * element[+]
    * code = #observationResult.numericResult.numericValue[x]
    * noMap = true
  * element[+]
    * code = #observationResult.numericResult.units
    * target[+]
      * code = #system
      * display = "C.10.10.2.2 - Units"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #code
      * display = "C.10.10.2.2 - Units"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #unit
      * display = "C.10.10.2.2 - Units"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.numericResult.uncertainty
    * target[+]
      * code = #extension[uncertainty]
      * comment = "Covered by data type"
      * display = "C.10.10.2.3 - Uncertainty"
      * relationship = #equivalent
    * target[+]
      * code = #extension[uncertaintyType]
      * comment = "Covered by data type"
      * display = "C.10.10.2.3 - Uncertainty"
      * relationship = #equivalent
  * element[+]
    * code = #component.numericResult.units
    * target[+]
      * code = #system
      * display = "C.10.19.3.2 - Units"
      * relationship = #equivalent
    * target[+]
      * code = #code
      * display = "C.10.19.3.2 - Units"
      * relationship = #equivalent
    * target[+]
      * code = #unit
      * display = "C.10.19.3.2 - Units"
      * relationship = #equivalent
  * element[+]
    * code = #component.numericResult.uncertainty
    * target[+]
      * code = #extension[uncertainty]
      * comment = "Covered by data type"
      * display = "C.10.19.3.3 - Uncertainty"
      * relationship = #equivalent
    * target[+]
      * code = #extension[uncertaintyType]
      * comment = "Covered by data type"
      * display = "C.10.19.3.3 - Uncertainty"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
  * target = $EuRangeUrl
  * element[+]
    * code = #observationResult.numericResult.numericValue[x]
    * target[+]
      * code = #low
      * display = "C.10.10.2.1 - Numeric value"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #high
      * display = "C.10.10.2.1 - Numeric value"
      * relationship = #source-is-broader-than-target
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSObservation"
  * target = $EuSimpleQuantityUrl
  * element[+]
    * code = #observationResult.numericResult.units
    * target[+]
      * code = #system
      * display = "C.10.10.2.2 - Units"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #code
      * display = "C.10.10.2.2 - Units"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #unit
      * display = "C.10.10.2.2 - Units"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #observationResult.numericResult.uncertainty
    * target[+]
      * code = #extension[uncertainty]
      * comment = "Covered by data type"
      * display = "C.10.10.2.3 - Uncertainty"
      * relationship = #equivalent
    * target[+]
      * code = #extension[uncertaintyType]
      * comment = "Covered by data type"
      * display = "C.10.10.2.3 - Uncertainty"
      * relationship = #equivalent
  * element[+]
    * code = #component.numericResult.units
    * target[+]
      * code = #system
      * display = "C.10.19.3.2 - Units"
      * relationship = #equivalent
    * target[+]
      * code = #code
      * display = "C.10.19.3.2 - Units"
      * relationship = #equivalent
    * target[+]
      * code = #unit
      * display = "C.10.19.3.2 - Units"
      * relationship = #equivalent
  * element[+]
    * code = #component.numericResult.uncertainty
    * target[+]
      * code = #extension[uncertainty]
      * comment = "Covered by data type"
      * display = "C.10.19.3.3 - Uncertainty"
      * relationship = #equivalent
    * target[+]
      * code = #extension[uncertaintyType]
      * comment = "Covered by data type"
      * display = "C.10.19.3.3 - Uncertainty"
      * relationship = #equivalent

////////////////////////////////////////////////////
