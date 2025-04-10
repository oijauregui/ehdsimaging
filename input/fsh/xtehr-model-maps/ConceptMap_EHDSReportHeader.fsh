////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSReportHeaderMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSReportHeader"
Description: "Map for EHDSReportHeader"
* status = #draft
* experimental = true
* title = "EHDSReportHeader Mapping"
* name = "EHDSReportHeaderMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSReportHeader"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSReportHeader"
  * target = "$ImDiagnosticReportUrl"
  * element[+]
    * code = #documentMetadata.presentedForm
    * target[+]
      * code = #presentedForm
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.media
    * target[+]
      * code = #media
      * relationship = #related-to

////////////////////////////////////////////////////
