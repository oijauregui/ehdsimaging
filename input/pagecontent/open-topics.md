This page containts open topics detected in the specification that are recognized and still need to be resolved.

* The definition of what a _information recipient_ is is not completly clear. We follow the guidance from hdr in this until more information is available. If it represents a request for info - CommunicationRequest would be an option, if it represents a log of who received the info, Communication or Provenance could address this.
* Include A.4 Specimen as it sounds like requiring a Digital Pathology report which may have a different structure from a radiology report.
* Add invariant stating that Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists

* DiagnosticReport.code and Composition.type are bound to a value set with one LOINC code. The value set should be replaced. The best candidate it the (FHIR version) of Radlex/LOINC playbook, as proposed by IDR.

* DiagnosticReport.code and Composition.type should match enforced by an invariant.
* Likewise, DiagnosticReport.status and Composition.status shall be aligned, thus an invariant should be implemented.

* Content in Composition and DiagnosticReport
  * Is all eHN information required to be in both?
  * What resources to refer to?

* Provide narrative on the use of the model and define the mandatory relationships between resources (e.g. DR.conclusion and Comp.section.text)

* Provide description of contents of section.title and text.

* Some valuesets refer to EDQM codes - where is this code system defined? 

* Check whether we need to refer to https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_A.html for document categories or types.

* Check whether Diagnostic Imaging Report titles could benifit from https://dicom.nema.org/dicom/2013/output/chtml/part16/sect_CID_7000.html

#### other

Composition structure - IDR/eHN/...

health care professional

IDR only overlap eHN

Presented form -->
	DiagnositicReport.presentform
	Composition

US Core
	DiagnosticReport  - identifier
	DocumentReference - identifier

Content requirement
	Composition - all info in DR
	Presented form - on its own
		PresentedForm vs compositon --> data in both have to be the same

Composition resources and text
	text needs to represent the linked resources (.entry)
	text may contain additional info (i.e. notes from the Prac)
