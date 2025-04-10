////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSCoverageMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSCoverage"
Description: "Map for EHDSCoverage"
* status = #draft
* experimental = true
* title = "EHDSCoverage Mapping"
* name = "EHDSCoverageMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCoverage"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCoverage"
  * target = $EuCoverageUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #patient
    * target[+]
      * code = #beneficiary
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #payor
    * target[+]
      * code = #kind
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #paymentBy.party
      * comment = "When selfpay, include reference to party that will pay"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #payor.payorEntity
    * target[+]
      * code = #insurer
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #payor.subscriberId
    * target[+]
      * code = #subscriberId
      * relationship = #source-is-broader-than-target

////////////////////////////////////////////////////
