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
      * display = "C.31.1 - Identifier"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.31.2 - Type"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #patient
    * target[+]
      * code = #beneficiary
      * display = "C.31.3 - Patient"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #payor
    * target[+]
      * code = #kind
      * display = "C.31.4 - Payor"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #paymentBy.party
      * comment = "When selfpay, include reference to party that will pay"
      * display = "C.31.4 - Payor"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #payor.payorEntity
    * target[+]
      * code = #insurer
      * display = "C.31.4.1 - Payor entity"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #payor.subscriberId
    * target[+]
      * code = #subscriberId
      * display = "C.31.4.2 - Subscriber Id"
      * relationship = #source-is-broader-than-target

////////////////////////////////////////////////////
