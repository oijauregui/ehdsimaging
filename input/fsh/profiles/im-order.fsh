Profile: ImOrder
Parent: $EuServiceRequest
Title: "IM Imaging Order"
Description: "This profile on ServiceRequest represents the order for the Imaging Study and report."
* insert SetFmmAndStatusRule( 1, draft )
* insert PartOfImagingManifest

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $SCT#363679005 "Imaging"

* identifier
  * insert SliceElement( #value, type )
* identifier contains accessionNumber 0..1
* identifier[accessionNumber] only ImAccessionNumberIdentifier

* supportingInfo 0..*
  * insert SliceElement( #value, $this )
* supportingInfo contains pregnacy 0..1
* supportingInfo[pregnacy] from http://hl7.org/fhir/uv/ips/ValueSet/pregnancy-status-uv-ips

// * status 1..1

// * subject 1..1
// * subject only Reference(ImPatient)

// // TODO obligation for client?
// * intent 1..1

// * insurance 0..1
//   * insert SetPopulateIfKnown
// * insurance only Reference(ImCoverage)

// * requester 0..1
//   * insert SetPopulateIfKnown
// * requester only Reference(ImOrderPlacer or ImPatient)

// * authoredOn 0..1
//   * insert SetPopulateIfKnown

// * reason 0..*
//   * insert SetPopulateIfKnown
//   * ^short = "Clinical question/reason for the order"
//   * ^definition = "The reason for the order. Can be coded, textual or a reference to a structured element."




Mapping: DicomToImOrder
Source: ImOrder
Target: "http://nema.org/dicom"
Id: dicom-2-im-order-mapping
Title: "Mapping from DICOM to Imaging Order"
Description: "Mapping from DICOM to Imaging Order."
* identifier[accessionNumber] -> "AccessionNumber (0008,0050)"
* subject -> "(0010/*)"
* note -> "RequestedProcedureDescription (0040,0100)"
* code -> "RequestedProcedureCodeSequence (0040,1001)"
* reason.concept.text -> "ReasonForTheRequestedProcedure (0040,1002)"
* reason.concept -> "ReasonForTheRequestedProcedure (0040,100A)"