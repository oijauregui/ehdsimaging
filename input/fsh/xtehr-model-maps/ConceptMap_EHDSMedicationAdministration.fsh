////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSMedicationAdministrationMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSMedicationAdministration"
Description: "Map for EHDSMedicationAdministration"
* status = #draft
* experimental = true
* title = "EHDSMedicationAdministration Mapping"
* name = "EHDSMedicationAdministrationMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedicationAdministration"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedicationAdministration"
  * target = $EuMedicationAdministrationUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.18.1 - Identifier"
      * relationship = #related-to
  * element[+]
    * code = #status
    * target[+]
      * code = #status
      * display = "C.18.2 - Status"
      * relationship = #related-to
  * element[+]
    * code = #statusReason
    * target[+]
      * code = #statusReason
      * display = "C.18.3 - Status reason"
      * relationship = #related-to
  * element[+]
    * code = #medication
    * target[+]
      * code = #medication
      * display = "C.18.4 - Medication"
      * relationship = #related-to
  * element[+]
    * code = #occurance[x]
    * target[+]
      * code = #occurenceDateTime
      * display = "C.18.5 - Occurance"
      * relationship = #related-to
    * target[+]
      * code = #occurencePeriod
      * display = "C.18.5 - Occurance"
      * relationship = #related-to
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason
      * display = "C.18.6 - Reason"
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * display = "C.18.7 - Note"
      * relationship = #related-to
  * element[+]
    * code = #dosage
    * target[+]
      * code = #dosage
      * display = "C.18.8 - Dosage"
      * relationship = #related-to
  * element[+]
    * code = #dosage.dosageDescription
    * target[+]
      * code = #dosage.text
      * display = "C.18.8.1 - Dosage description"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #dosage.site
    * target[+]
      * code = #dosage.site
      * display = "C.18.8.2 - Site"
      * relationship = #related-to
  * element[+]
    * code = #dosage.route
    * target[+]
      * code = #dosage.route
      * display = "C.18.8.3 - Route"
      * relationship = #related-to
  * element[+]
    * code = #dosage.method
    * target[+]
      * code = #dosage.method
      * display = "C.18.8.4 - Method"
      * relationship = #related-to
  * element[+]
    * code = #dosage.dose
    * target[+]
      * code = #dosage.dose
      * display = "C.18.8.5 - Dose"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #dosage.rate[x]
    * target[+]
      * code = #dosage.rateRatio
      * display = "C.18.8.6 - Rate"
      * relationship = #related-to
    * target[+]
      * code = #dosage.rateQuantity
      * display = "C.18.8.6 - Rate"
      * relationship = #related-to
  * element[+]
    * code = #sibject
    * target[+]
      * code = #subject
      * display = "C.18.9 - Patient"
      * relationship = #related-to

////////////////////////////////////////////////////
