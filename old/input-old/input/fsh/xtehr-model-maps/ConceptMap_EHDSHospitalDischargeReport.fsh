////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSHospitalDischargeReportMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSHospitalDischargeReport"
Description: "Map for EHDSHospitalDischargeReport"
* status = #draft
* experimental = true
* title = "EHDSHospitalDischargeReport Mapping"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHospitalDischargeReport"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHospitalDischargeReport"
  * target = "ImDiagnosticReport"
  * element[+]
    * code = #presentedForms
    * target[+]
      * code = #presentedForm
      * relationship = #related-to

////////////////////////////////////////////////////
