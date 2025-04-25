Profile: ImComposition
Parent: CompositionEu
Title: "Imaging Composition"
Description: "Clinical document used to represent a Imaging Study Report for the scope of the HL7 Europe project."
* . ^short = "Imaging Report composition"
* . ^definition = """
Imaging Study Report composition.\n
A composition is a set of healthcare-related information that is assembled together into a single logical document that 
provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard 
to who is making the statement.\n
While a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, 
of which the Composition is the first resource contained.\n
\n
The `text` field of each section SHALL contain a textual representation of all listed entries.
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier 1..*
* extension contains 
    ImDiagnosticReportReference named diagnosticreport-reference 1..1  
* extension[diagnosticreport-reference].valueReference only Reference ( ImDiagnosticReport )

* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"

* attester 0..*
  * insert SliceElement( #value, mode )
* attester contains legalAuthenticator 0..* and resultValidator 0..*
* attester[legalAuthenticator]
  * mode 1..1
  * mode = #legal
  * party only Reference($EuPractitionerRole)
  * time 1..1
* attester[resultValidator]
  * mode 1..1
  * mode = #professional
  * party only Reference($EuPractitionerRole)
  * time 1..1

* author 1..*
  * insert SliceElement( #profile, $this )
* author contains 
    author 0..* and 
    authoringDevice 0..*
* author[author] only Reference($EuPractitionerRole)
* author[authoringDevice] only Reference($EuDevice)

// type of the report. Matching DiagnosticReport.code
// code 
* type
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains imaging-report-v1-0-0 1..1
  * coding[imaging-report-v1-0-0] = Hl7EuDocumentTypes#imaging-v1-0-0 "Imaging Report V1.0.0"

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1 
* category[imaging] = $LOINC#18748-4 "Diagnostic imaging equipment"
* category[imaging].coding 1..1

* status 

* event 2..*
  * insert SliceElement( #value, detail.concept )
* event contains 
    imagingstudy 1..* and 
    procedure 1..*
* event[imagingstudy]
  * ^short = "Modality"
  * ^definition = "The type of imaging modality used to perform the study."
  * detail 1..*
  * detail from https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_33.html (extensible)
  * detail only CodeableReference ( ImImagingStudy )
* event[procedure]
  * ^short = "Study Type"
  * ^definition = "The type of imaging study performed."
  * detail 1..*
  * detail from https://www.hl7.org/fhir/valueset-procedure-reason.html (extensible)
  * detail only CodeableReference ( ImProcedure )

* section.code 1..1 
* section 
  * insert SliceElement( #value, code )
* section.emptyReason from ImSectionEmptyReason (preferred)  
* section obeys eu-imaging-composition-1
* section contains 
    imagingstudy 1..1  and
    order 1..1 and
    history 1..1 and 
    procedure 1..1 and
    comparison 1..1 and 
    findings 1..1  and 
    impression 1..1 and 
    recommendation 1..1  and 
    communication 0..1 

// ///////////////////////////////// IMAGING STUDY SECTION ///////////////////////////////////////
* section[imagingstudy]
  * ^short = "Imaging Study"
  * ^definition = "This section holds information related to the imaging studies covered by this report."
  // * title = "Imaging Studies"
  * code = $loinc#18726-0
  * entry 
    * insert SliceElement( #profile, $this )
  * entry contains imagingstudy 1..*
  * entry[imagingstudy]
    * ^short = "Imaging Study Reference"
    * ^definition = "This entry holds a reference to the Imaging Study instance that is associated with this Composition."
  * entry[imagingstudy] only Reference(ImImagingStudy)  

// ///////////////////////////////// ORDER SECTION ///////////////////////////////////////
* section[order]
  * ^short = "Order"
  * ^definition = "This section holds information related to the order for the imaging study."
  * code = $loinc#55115-0 "Requested imaging studies information"
  * extension contains $note-url named note 0..1

  * entry
    * insert SliceElement( #profile, "$this" )
  * entry contains 
      order 0..*

  * entry[order]
    * ^short = "Order reference"
    * ^definition = "This entry holds a reference to the order for the Imaging Study and report."
  * entry[order] only Reference(ImOrder)  
  

// // ///////////////////////////////// HISTORY SECTION ///////////////////////////////////////
* section[history]
  * ^short = "History"
  * code = $loinc#11329-0 "History"
  * extension contains $note-url named note 0..1

// // ///////////////////////////////// PROCEDURE SECTION ///////////////////////////////////////
* section[procedure]
  * ^short = "Procedure"
  * code = $loinc#55111-9 "Procedure"
  * extension contains $note-url named note 0..1
  * entry 
    * insert SliceElement( #profile, $this )
  * entry contains 
      procedure 0..*
  * entry[procedure] only Reference(ImProcedure)


// ////////////////// COMPARISON SECTION //////////////////////////
* section[comparison]
  * ^short = "History"
  * code = $loinc#18834-2 "Comparison"
  * extension contains $note-url named note 0..1
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      comparedstudy 0..*
  * entry[comparedstudy] only Reference( ImImagingStudy or ImImagingSelection )

// /////////////////// FINDINGS SECTION //////////////////////////
* section[findings]
  * ^short = "Findings"
  * code = $loinc#59776-5 "Findings"
  * extension contains $note-url named note 0..1
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* and
      keyimage 0..*
  * entry[finding] only Reference(ImFinding)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImageImagingSelection)

// /////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * ^short = "Impressions"
  * code = $loinc#19005-8 "Impression"
  * extension contains $note-url named note 0..1
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* and
      impression 0..* and
      keyimage 0..*
  * entry[finding] only Reference(ImFinding)
  * entry[impression] only Reference( $EuCondition )
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImageImagingSelection)

// /////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * ^short = "Recommendations"
  * code = $loinc#18783-1 "Recommendation"
  * extension contains $note-url named note 0..1
  * entry
    * insert SliceElement( #profile, $this )
  * entry contains 
      careplan 0..*
  * entry[careplan] only Reference($EuCarePlan)


// /////////////////// COMMUNICATION SECTION //////////////////////////
* section[communication]
  * ^short = "Communications"
  * code = $loinc#18783-1 "Communication"

Invariant: eu-imaging-composition-1
Description: "When a section is empty, the emptyReason extension SHALL be present."
Severity: #error 
Expression: "entry.empty() and emptyReason.exists()"

Extension: ImDiagnosticReportReference
Id:   im-composition-diagnosticReportReference
Title:  "Document DiagnosticReport Reference"
Description: """
    This extension provides a reference to the DiagnosticReport instance that is associated with this Composition.
    """
Context: Composition
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert ExtensionContext(Composition)
* insert SetFmmAndStatusRule ( 2, trial-use)
* value[x] only Reference (ImDiagnosticReport)
