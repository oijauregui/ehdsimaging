Profile: TESTImDiagnosticReport
Parent: DiagnosticReport
Title: "Imaging Diagnostic Report"
Description: """
Diagnostic Report profile for Imaging Reports. This document represents the report of an imaging study. It is the anchor resource that refers to all structured data as well as the `Composition` resource that contains the narrative text of the report.
"""

* extension contains

  $cvDiagnosticReport-supportingInfo named supportingInfo 0..*

* extension[supportingInfo].extension[type].value[x] from DiagnosticReportSupportingInfoVCodes (extensible)

* extension ^slicing.discriminator[+].type = #value
* extension ^slicing.discriminator[=].path = "extension.value"

* extension[supportingInfo] contains procedure 0..*

* extension[supportingInfo][procedure].extension[type].value[x] = DiagnosticReportSupportingInfoCodeSystem#imaging-procedure
* extension[supportingInfo][procedure].extension[reference].value[x] only Reference(ImProcedure)