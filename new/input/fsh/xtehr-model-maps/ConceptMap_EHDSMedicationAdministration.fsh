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
  * target = "$MedicationAdministrationUrl"
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #status
    * target[+]
      * code = #status
      * relationship = #related-to
  * element[+]
    * code = #statusReason
    * target[+]
      * code = #statusReason
      * relationship = #related-to
  * element[+]
    * code = #medication
    * target[+]
      * code = #medication
      * relationship = #related-to
  * element[+]
    * code = #occurance[x]
    * target[+]
      * code = #occuranceDateTime
      * relationship = #related-to
    * target[+]
      * code = #occurancePeriod
      * relationship = #related-to
  * element[+]
    * code = #reason
    * target[+]
      * code = #reason
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * relationship = #related-to
  * element[+]
    * code = #dosage
    * target[+]
      * code = #dosage
      * relationship = #related-to
  * element[+]
    * code = #dosage.dosageDescription
    * target[+]
      * code = #dosage.text
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #dosage.site
    * target[+]
      * code = #dosage.site
      * relationship = #related-to
  * element[+]
    * code = #dosage.route
    * target[+]
      * code = #dosage.route
      * relationship = #related-to
  * element[+]
    * code = #dosage.method
    * target[+]
      * code = #dosage.method
      * relationship = #related-to
  * element[+]
    * code = #dosage.dose
    * target[+]
      * code = #dosage,dose
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #dosage.rate[x]
    * target[+]
      * code = #dosage.rateRatio
      * relationship = #related-to
    * target[+]
      * code = #dosage.rateQuantity
      * relationship = #related-to
  * element[+]
    * code = #sibject
    * target[+]
      * code = #subject
      * relationship = #related-to

////////////////////////////////////////////////////
