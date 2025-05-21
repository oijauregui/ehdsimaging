Profile: ImDiagnosticReport
Parent: DiagnosticReport
Title: "Imaging Diagnostic Report"
Description: """
Diagnostic Report profile for Imaging Reports. This document represents the report of an imaging study. It is the anchor resource that refers to all structured data as well as the `Composition` resource that contains the narrative text of the report.
"""
* insert SetFmmAndStatusRule( 1, draft )
// * insert MandateLanguageAndSecurity

* extension contains
  $artifact-version-url named artifactVersion 0..1
{% if isR4 %}
  and $cvDiagnosticReport-supportingInfo named supportingInfo 0..*
  and $cvDiagnosticReport-composition named composition 1..1
{% endif %}
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

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* category[imaging].coding 1..1

* subject only Reference(ImPatient)

{{R5}}* study only Reference(ImImagingStudy)
{{R4}}* imagingStudy only Reference(ImImagingStudy)

{% if isR5 %}
// supporting info
* supportingInfo
  * insert SliceElement( #value, reference )
  * type from DiagnosticReportSupportingInfoVCodes (extensible)
* supportingInfo contains
    procedure 0..*
* supportingInfo[procedure]
  * type = DiagnosticReportSupportingInfoCodeSystem#imaging-procedure
  * reference only Reference(ImProcedure)
// TODO only main elements or all elements of the eHN dataset?   
{% endif %}

{% if isR4 %}
* extension[supportingInfo]
  * insert SliceElement( #value, reference )
  * type from DiagnosticReportSupportingInfoVCodes (extensible)
* extension[supportingInfo] contains
    procedure 0..*
* extension[supportingInfo][procedure]
  * type = DiagnosticReportSupportingInfoCodeSystem#imaging-procedure
  * reference only Reference(ImProcedure)
{% endif %}


* performer 
  * insert SliceElement( #profile, $this )
* performer contains author 1..*
* performer[author] only Reference($EuPractitionerRole)

// author etc.
* resultsInterpreter 0..*
  * insert SliceElement( #profile, [[resolve()]] )
* resultsInterpreter contains 
    author 0..* 
* resultsInterpreter[author] only Reference($EuPractitionerRole)

{% if isR5 %}
// refer to the mandatory composition
* composition 1..1
* composition ^short = "Imaging Diagnostic Report"
* composition only Reference(ImComposition)
{% endif %}

{% if isR4 %}
// refer to the mandatory composition
* extension[composition] 1..1
* extension[composition] ^short = "Imaging Diagnostic Report"
* extension[composition] only Reference(ImComposition)
{% endif %}

// code 
* code
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains eu-template 1..1
  * coding[eu-template] = Hl7EuDocumentTypes#imaging-report-v0-0-1 "Imaging Report V0.0.1"
