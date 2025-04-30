
ValueSet: ImSectionEmptyReason
Title: "Reasons a section in an imaging report is empty."
Description: "Reasons a section in an imaging report is empty."
* include codes from valueset http://terminology.hl7.org/CodeSystem/list-empty-reason
* $loinc#LA4720-4 "Not applicable"


ValueSet: ImImagingReportTypesEuVS
Title: "HL7 EU Imaging Report Types"
Description: "HL7 EU Imaging Report Types used in Compositions and DiagnosticReports."
* ^experimental = false
* Hl7EuDocumentTypes#imaging-manifest-v0-0-1 "Imaging Manifest V0.0.1" 

ValueSet: ImImagingManifestTypesEuVS
Title: "HL7 EU Imaging Report Types"
Description: "HL7 EU Imaging Manifest Types used in Compositions and DiagnosticReports."
* ^experimental = false
* Hl7EuDocumentTypes#imaging-report-v0-0-1 "Imaging Report V0.0.1" 


CodeSystem: Hl7EuDocumentTypes
Title: "HL7 EU Document Types"
Description: "Document types (templates) as defined by HL7 EU. It identifies the type and template of the document."
* ^experimental = false
* ^caseSensitive = true
* ^jurisdiction.coding = http://unstats.un.org/unsd/methods/m49/m49.htm#150 "Europe"
* ^jurisdiction.text = "Europe"
* ^hierarchyMeaning = #is-a

* #imaging-report "Imaging Reports" "HL7 EU Imaging Report"
  * #imaging-report-v0-0-1 "Imaging Report V1.0.0" "Version 1.0.0 of the HL7 EU Imaging Report"
* #imaging-manifest "Imaging Manifest" "HL7 EU Imaging Manifest"
  * #imaging-manifest-v0-0-1 "Imaging Manifest V1.0.0" "Version 1.0.0 of the HL7 EU Imaging Manifest"
// add other document types as needed