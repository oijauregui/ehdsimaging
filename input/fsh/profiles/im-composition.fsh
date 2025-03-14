Profile: ImComposition
Parent: http://hl7.org/fhir/StructureDefinition/clinicaldocument
Id: im-composition
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
* insert MandateLanguageAndSecurity

* extension contains 
    ImDiagnosticReportReference named diagnosticreport-reference 1..1 MS and
    $event-basedOn-url named basedOn 0..* and
    $information-recipient-url named informationRecipient 0..* and
    $artifact-version-url named artifactVersion 0..1
* extension[diagnosticreport-reference].valueReference only Reference ( ImDiagnosticReport )
* extension[basedOn].valueReference only Reference ( ServiceRequest )
// TODO see open issues - readdress the status of the information recipient.
* extension[informationRecipient].valueReference only Reference ( ImInformationRecipient )

* meta
  * security 0..* MS

* language 0..1 MS

//business identifier and relation with the DiagnosticReport resource
* identifier
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this Imaging Report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"

* status
  * ^short = "Status of the Report"
  * ^comment = "DiagnosticReport.status and Composition.status shall be aligned"

* subject 1..1 MS
* subject only Reference(ImPatient)

* custodian MS
* custodian only Reference(ImOrganization)
  * ^short = "Organization that manages the Imaging Report"
  * insert SetPopulateIfKnown

* attester 0..* MS
  * insert SetPopulateIfKnown
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "$this.mode"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* attester contains legalAuthenticator 0..* MS and resultValidator 0..* MS
* attester[legalAuthenticator]
  * insert SetPopulateIfKnown
  * mode 1..1 MS
  * mode = #legal
  * party only Reference(ImLegalAuthenticator)
* attester[resultValidator]
  * insert SetPopulateIfKnown
  * mode 1..1 MS
  * mode = #professional
  * party only Reference(ImResultValidator)

* author 1..* MS
  * insert SliceElement( #profile, $this )
* author contains 
    author 0..* MS and 
    authoring-device 0..* MS
* author[author] only Reference(ImPractitionerRole)
* author[authoring-device] only Reference(ImAuthoringDevice)

// type of the report. Matching DiagnosticReport.code
// code 
* type 1..
* type from ImagingReportTypesEuVS (preferred) // valueset to be revised. 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Specifies that it refers to a Imaging Report"
  * ^comment = "At least one DiagnosticReport.code.coding and Composition.type.coding SHALL be equal"

* date MS
  * ^short = "Date the report was last changed."

* section MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* section.entry MS
* section.code 1..1 MS  // LOINC code for the section
* section.title MS
* section.text MS
* section contains 
    imagingstudy 1..1 MS and 
    order 1..1 MS and 
    history 1..1 MS and
    procedure 1..1 MS and
    comparison 1..1 MS and
    findings 1..1 MS and
    impression 1..1 MS and
    recommendation 1..1 MS and
    communication 1..1 MS

///////////////////////////////// IMAGING STUDY SECTION ///////////////////////////////////////
* section[imagingstudy]
  * ^short = "Imaging Study"
  * ^definition = "This section holds information related to the imaging studies covered by this report."
  // * title = "Imaging Studies"
  * code = $loinc#18726-0
  * entry MS
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * entry contains imagingstudy 1..* MS
  * entry[imagingstudy]
    * ^short = "Imaging Study Reference"
    * ^definition = "This entry holds a reference to the Imaging Study instance that is associated with this Composition."
  * entry[imagingstudy] only Reference(ImImagingStudy)  

///////////////////////////////// ORDER SECTION ///////////////////////////////////////
* section[order]
  * ^short = "Order"
  * ^definition = "This section holds information related to the order for the imaging study."
  * code = $loinc#55115-0 "Order"

  * entry MS
    * insert SliceElement( #profile, "$this" )
  * entry contains 
      order 0..* MS and 
      orderPlacer 0..* MS and 
      insurance 0..* MS and 
      insurranceprovider 0..* MS

  * entry[order]
    * ^short = "Order reference"
    * ^definition = "This entry holds a reference to the order for the Imaging Study and report."
  * entry[order] only Reference(ImOrder)  
  
  * entry[orderPlacer]
    * ^short = "Order Placer"
    * ^definition = "This entry holds a reference to order placer."
  * entry[orderPlacer] only Reference(ImOrderPlacer)  

  * entry[insurance]
    * ^short = "Insurrance"
    * ^definition = "This entry holds a reference to insurance."
  * entry[insurance] only Reference(ImCoverage)  

  * entry[insurranceprovider]
    * ^short = "Insurrance"
    * ^definition = "This entry holds a reference to insurance provider."
  * entry[insurranceprovider] only Reference(ImHealthInsuranceProvider)  

  
///////////////////////////////// HISTORY SECTION ///////////////////////////////////////
* section[history]
  * ^short = "History"
  * code = $loinc#11329-0 "History"

///////////////////////////////// PROCEDURE SECTION ///////////////////////////////////////
* section[procedure]
  * ^short = "Procedure"
  * code = $loinc#55111-9 "Procedure"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      procedure 0..* MS and
      performer 0..* MS and
      imaging-device 0..* MS and
      imaging-phase 0..* MS and
      medication 0..* MS
  * entry[procedure] only Reference(ImProcedure)
  * entry[performer] only Reference(ImPerformer) 
  * entry[imaging-device] only Reference(ImImagingDevice)
  * entry[imaging-phase] only Reference(ImImagingStudyPhase)
  * entry[medication] only Reference(ImMedicationAdministration)

////////////////// COMPARISON SECTION //////////////////////////
* section[comparison]
  * ^short = "History"
  * code = $loinc#18834-2 "Comparison"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      comparedstudy 0..* MS
  * entry[comparedstudy] only Reference(ImImagingStudy or ImImagingSelection)

/////////////////// FINDINGS SECTION //////////////////////////
* section[findings]
  * ^short = "Findings"
  * code = $loinc#59776-5 "Findings"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* MS and
      keyimage 0..* MS
  * entry[finding] only Reference(ImFinding)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImagesSelection)

/////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * ^short = "Impressions"
  * code = $loinc#19005-8 "Impression"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* MS and
      impression 0..* MS and
      keyimage 0..* MS
  * entry[finding] only Reference(ImFinding)
  * entry[impression] only Reference(ImImpression)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImagesSelection)

/////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * ^short = "Recommendations"
  * code = $loinc#18783-1 "Recommendation"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      recommendedCarePlan 0..* MS
  * entry[recommendedCarePlan] only Reference(ImRecommendedCarePlan)


/////////////////// COMMUNICATION SECTION //////////////////////////
* section[communication]
  * ^short = "Communications"
  * code = $loinc#18783-1 "Communication"


Extension: ImDiagnosticReportReference
Id:   im-composition-diagnosticReportReference
Title:  "Document DiagnosticReport Reference"
Description: """
    This extension provides a reference to the DiagnosticReport instance that is associated with this Composition.
    """
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert ExtensionContext(Composition)
* insert SetFmmAndStatusRule ( 2, trial-use)
* value[x] only Reference (ImDiagnosticReport)

Instance: ImComposition-example
InstanceOf: ImComposition
Title: "Brain MRI example"
Description: "This is an example of a EU Imaging IG Composition for a Brain MRI report."
* status = #final
* language = #es-AR
* subject = Reference(ImPatient-example)
* extension[diagnosticreport-reference].valueReference = Reference(ImDiagnosticReport-example)
* extension[basedOn].valueReference = Reference(ImOrder-example)
* extension[informationRecipient].valueReference = Reference(ImInformationRecipient-example)
* extension[artifactVersion].valueString = "0.1.0"
* identifier
  * system = "http://example.org/composition"
  * value = "123456"
* type = $loinc#18726-0
* date = "2021-01-01T00:00:00Z"
* author[0] = Reference(ImAuthor-example)
* author[+] = Reference(ImAuthoringDevice-example)
* title = "Brain MRI pre and post contrast"
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].party = Reference(ImLegalAuthenticator-example)
* attester[resultValidator].mode = #professional
* attester[resultValidator].party = Reference(ImResultValidator-example)
* custodian = Reference(ImOrganization-example)

// Imaging Study Section
* section[imagingstudy].title = "Brain MRI pre and post contrast"
* section[imagingstudy].code = $loinc#18726-0
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Study</h3>
 <p>MRI Brain with and without contrast.</p>
</div>
"""
* section[imagingstudy].entry[0] = Reference(ImImagingStudy-example)

// Order Section
* section[order].title = "Order"
* section[order].code = $loinc#55115-0 "Order"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Order</h3>
 <ul>
 <li><strong>Accession #:</strong> 123456789</li>
 <li><strong>Referring Physician:</strong> Dr. John Doe, Neurology Associates</li>
 <li><strong>Indication:</strong> Persistent headaches and recent onset of visual disturbances.</li>
 <li><strong>Clinical Question:</strong> Rule out intracranial mass or demyelinating disease.</li>
 </ul>
</div>
"""
* section[order].entry[0] = Reference(ImOrder-example)

// History Section
* section[history].title = "History"
* section[history].code = $loinc#11329-0 "History"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Patient History</h3>
 <ul>
 <li>52-year-old female with a history of hypertension and type 2 diabetes mellitus.</li>
 <li>No known prior history of intracranial pathology.</li>
 <li>Reports progressive headaches over the past three months, unresponsive to NSAIDs.</li>
 <li>Recent onset of blurred vision in the left eye.</li>
 <li>No prior intracranial surgeries or significant head trauma.</li>
 </ul>
</div>
"""
* section[history].entry[0] = Reference(ImImpression-example)

// Procedure Section
* section[procedure].title = "Procedure"
* section[procedure].code = $loinc#55111-9 "Procedure"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Procedure and Materials</h3>
 <ul>
 <li>MRI of the brain was performed on <strong>[DATE]</strong> using a 3T scanner.</li>
 <li>Sequences obtained: Axial T1, T2, FLAIR, DWI, ADC, GRE, and post-contrast T1-weighted imaging.</li>
 <li>Contrast: 10 mL of gadobutrol (Gadavist) was administered intravenously without immediate complications.</li>
 <li>No motion artifacts noted. Image quality was diagnostic.</li>
 </ul>
</div>
"""
// tbd if other entries are needed
* section[procedure].entry[0] = Reference(ImProcedure-example)

// Comparison Section
* section[comparison].title = "Comparison"
* section[comparison].code = $loinc#18834-2 "Comparison"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Comparison</h3>
 <ul>
 <li>No prior brain MRI available for direct comparison.</li>
 <li>Most recent head CT (dated <strong>[DATE]</strong>) reviewed for correlation.</li>
 </ul>
</div>
"""
* section[comparison].entry[0] = Reference(ImImagingStudy-example)

// Findings Section
* section[findings].title = "Findings"
* section[findings].code = $loinc#59776-5 "Findings"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Findings</h3>
 <ul>
 <li><strong>Gray and White Matter:</strong> No acute infarct, mass, or significant cortical atrophy.</li>
 <li><strong>Ventricular System and CSF Spaces:</strong> Normal in size and configuration without evidence of hydrocephalus or midline shift.</li>
 <li><strong>Basal Ganglia and Thalami:</strong> No abnormal signal or mass effect.</li>
 <li><strong>Brainstem and Cerebellum:</strong> No focal lesions.</li>
 <li><strong>Vascular Structures:</strong> No evidence of abnormal flow voids or vascular malformations.</li>
 <li><strong>Post-Contrast Imaging:</strong> No abnormal enhancement to suggest neoplasm, infection, or active demyelination.</li>
 <li><strong>Incidental Findings:</strong> Mild chronic small vessel ischemic changes within the periventricular white matter, consistent with the patient’s age and vascular risk factors.</li>
 </ul>
</div>
"""
* section[findings].entry[0] = Reference(ImFinding-example)
* section[findings].entry[1] = Reference(ImKeyImagesSelection-example)

// Impression Section
* section[impression].title = "Impressions"
* section[impression].code = $loinc#19005-8 "Impression"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Impression</h3>
 <ol>
 <li>No acute intracranial pathology identified.</li>
 <li>No evidence of mass, hemorrhage, or demyelinating disease.</li>
 <li>Mild chronic small vessel ischemic changes, likely secondary to hypertension and diabetes.</li>
 <li>Consider clinical correlation for non-structural causes of headaches and visual disturbances. Neurology follow-up recommended.</li>
 </ol>
</div>
"""
* section[impression].entry[0] = Reference(ImImpression-example)
* section[impression].entry[1] = Reference(ImKeyImagesSelection-example)

// Recommendation Section
* section[recommendation].title = "Recommendations"
* section[recommendation].code = $loinc#18783-1 "Recommendation"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Communication</h3>
 <ul>
 <li><strong>Critical findings:</strong> None.</li>
 <li>Routine results conveyed to the referring physician, Dr. John Doe, via electronic medical record at <strong>[TIME]</strong> on <strong>[DATE]</strong>.</li>
 <li>No urgent follow-up required. The patient will be advised to follow up with their neurologist for further management.</li>
 </ul>
</div>
"""
* section[recommendation].entry[0] = Reference(ImRecommendedCarePlan-example)

// Communication Section
* section[communication].title = "Communications"
* section[communication].code = $loinc#18783-1 "Communication"
* text
  * status = #additional
  * div = """
<div xmlns="http://www.w3.org/1999/xhtml">
 <h3>Communication</h3>
 <ul>
 <li><strong>Critical findings:</strong> None.</li>
 <li>Routine results conveyed to the referring physician, Dr. John Doe, via electronic medical record at <strong>[TIME]</strong> on <strong>[DATE]</strong>.</li>
 <li>No urgent follow-up required. The patient will be advised to follow up with their neurologist for further management.</li>
 </ul>
</div>
"""
// TBD if needed a communication resource reference
//* section[communication].entry[0] = Reference(ImCommunication-example)