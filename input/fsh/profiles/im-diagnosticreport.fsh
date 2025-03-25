Profile: ImDiagnosticReportProvider
Parent: ImDiagnosticReport
Id: im-diagnostic-report-provider
Title: "Imaging Diagnostic Report (ImProvider)"
Description: "Requirements for the provider of the imaging diagnostic report."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* result
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* study
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* supportingInfo[procedure]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* resultsInterpreter[author]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* conclusion
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* conclusionCode
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* presentedForm
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImDiagnosticReport
Parent: DiagnosticReport
Id: im-diagnostic-report
Title: "Imaging Diagnostic Report"
Description: """
Diagnostic Report profile for Imaging Reports. This document represents the report of an imaging study. It is the anchor resource that refers to all structured data as well as the `Composition` resource that contains the narrative text of the report.
"""
* insert SetFmmAndStatusRule( 1, draft )

* extension contains
  $artifact-version-url named artifactVersion 0..1

//business identifier and relation with the composition resource
* identifier
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this Imaging Report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"

* status
  * ^short = "Status of the Report"
  * ^comment = "DiagnosticReport.status and Composition.status shall be aligned"

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )

* basedOn

* subject 1..1
* subject only Reference(ImPatient)

* issued 1..1
  * ^short = "DateTime that this diagnostic report is published."
  * ^definition = "The date and time that this version of the imaging report."

* result only Reference(ImFinding)

// refer to the imaging study
* study 0..1
* study only Reference(ImImagingStudy)
  
// supporting info
* supportingInfo
  * insert SliceElement( #value, "reference" )
  * type from DiagnosticReportSupportingInfoVCodes (extensible)
* supportingInfo contains  procedure 0..*
* supportingInfo[procedure]
  * type = DiagnosticReportSupportingInfoCodeSystem#imaging-procedure
  * reference only Reference(ImProcedure)
// TODO only main elements or all elements of the eHN dataset?   

// author etc.
* resultsInterpreter 0..*
  * insert SliceElement( #profile, [[resolve()]] )
* resultsInterpreter contains author 0..* 
* resultsInterpreter[author] only Reference(ImAuthor)
  
// refer to the mandatory composition
* composition 1..1
* composition ^short = "Imaging Diagnostic Report"
* composition only Reference(ImComposition)

// code 
* code 1..
* code from ImagingReportTypesEuVS (preferred) // valueset to be revised. 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Specifies that it refers to a Imaging Report"
  * ^comment = "At least one DiagnosticReport.code.coding and Composition.type.coding SHALL be equal"
  
* presentedForm
  * ^short = "Printed versions of the report."
