////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSImagingReportMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSImagingReport"
Description: "Map for EHDSImagingReport"
* status = #draft
* experimental = true
* title = "EHDSImagingReport Mapping"
* name = "EHDSImagingReportMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReport"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReport"
  * target = $ImCompositionUrl
  * element[+]
    * code = #imagingReportHeader
    * target[+]
      * code = #section
      * display = "A.1 - Imaging Report header"
      * relationship = #related-to
  * element[+]
    * code = #imagingReportStructuredBody
    * noMap = true
  * element[+]
    * code = #imagingReportAttachments[x]
    * target[+]
      * code = #section[comparison].entry[comparedstudy]
      * comment = "Comparison studie"
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
    * target[+]
      * code = #section[comparison].entry[comparedstudy]
      * comment = "key images"
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
    * target[+]
      * code = #section[comparison].entry[comparedstudy]
      * comment = "other data"
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReport"
  * target = $ImDiagnosticReportUrl
  * element[+]
    * code = #imagingReportHeader
    * noMap = true
  * element[+]
    * code = #imagingReportStructuredBody
    * noMap = true
  * element[+]
    * code = #presentedForms
    * target[+]
      * code = #presentedForm
      * display = "A.3 - Presented forms"
      * relationship = #related-to
  * element[+]
    * code = #imagingReportAttachments[x]
    * target[+]
      * code = #media
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReport"
  * target = $ImFindingUrl
  * element[+]
    * code = #imagingReportAttachments[x]
    * target[+]
      * code = #derivedFrom
      * comment = "Comparison studie"
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
    * target[+]
      * code = #derivedFrom
      * comment = "key images"
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
    * target[+]
      * code = #derivedFrom
      * comment = "other data"
      * display = "A.4 - Attachment, Media"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReport"
  * target = $ImImagingStudyUrl
  * element[+]
    * code = #dicomStudyMetadata
    * noMap = true

////////////////////////////////////////////////////
