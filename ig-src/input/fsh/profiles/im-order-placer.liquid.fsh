Profile: ServiceRequestPlacerOrderEuImaging
Parent: $EuServiceRequest
Title: "ServiceRequest: Imaging Placer Order"
Description: """
This profile on ServiceRequest represents the **placer order**: the order for imaging placed by the requester
(typically from the EHR) and received by the imaging department. It carries the information provided by the requester,
such as the reason for the order, the clinical question, the requester and the date of the order.
The `code` element represents the requested orderable, which may be generic (e.g. "imaging of the knee").

The imaging department fulfils the placer order through one or more filler orders
(see [ServiceRequestFillerOrderEuImaging](StructureDefinition-ServiceRequestFillerOrderEuImaging.html)) that carry the
Accession Number and the requested procedure as protocolled by the department. One filler order MAY fulfil
several placer orders.
"""

* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $sct#363679005 // "Imaging"

* identifier
  * insert SliceElement( #value, type )
* identifier contains placerOrder 0..1 and fillerOrder 0..1
* identifier[placerOrder] ^short = "Placer order number assigned by the requester"
* identifier[placerOrder]
  * type 1..1
  * type = $v2-0203#PLAC
  * system 1..1
  * value 1..1
* identifier[fillerOrder] ^short = "Filler order number assigned by the receiving imaging department"
* identifier[fillerOrder] ^definition = "The number assigned to this placer order by the order filler (typically the RIS), as returned to the placer (e.g. HL7 v2 ORC-3, IHE RAD-3)."
* identifier[fillerOrder]
  * type 1..1
  * type = $v2-0203#FILL
  * system 1..1
  * value 1..1

* code
  * ^short = "Requested orderable"
* code from ProcedureEuImagingType (example)

{{R4}}* supportingInfo.extension contains 
{{R4}}    http://hl7.org/fhir/5.0/StructureDefinition/extension-ServiceRequest.supportingInfo named codeableConcept 0..*
// {{R4}}* supportingInfo.extension[codeableConcept]
// {{R4}}  * valueCodeableConcept from http://hl7.org/fhir/uv/ips/ValueSet/pregnancy-status-uv-ips

{{R5}}* supportingInfo 0..*
{{R5}}  * insert SliceElement( #value, $this )
{{R5}}* supportingInfo contains pregnancy 0..1
{{R5}}* supportingInfo[pregnancy] from http://hl7.org/fhir/uv/ips/ValueSet/pregnancy-status-uv-ips

{{R4}}* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-ServiceRequest.reason named reason 0..*

// * status 1..1

// * subject 1..1
// * subject only Reference($EuPatient)

// // TODO obligation for client?
// * intent 1..1

// * insurance 0..1
//   * insert SetPopulateIfKnown
// * insurance only Reference(ImCoverage)

// * requester 0..1
//   * insert SetPopulateIfKnown
// * requester only Reference(ServiceRequestOrderEuImagingPlacer or $EuPatient)

// * authoredOn 0..1
//   * insert SetPopulateIfKnown

// * reason 0..*
//   * insert SetPopulateIfKnown
//   * ^short = "Clinical question/reason for the order"
//   * ^definition = "The reason for the order. Can be coded, textual or a reference to a structured element."



Mapping: DicomToServiceRequestPlacerOrderEuImaging
Source: ServiceRequestPlacerOrderEuImaging
Target: "http://nema.org/dicom"
Title: "Mapping from DICOM to Imaging Placer Order"
Description: "Mapping from DICOM to Imaging Placer Order."
{{R }}* identifier[placerOrder] -> "PlacerOrderNumberImagingServiceRequest (0040,2016)"
{{R }}* identifier[fillerOrder] -> "FillerOrderNumberImagingServiceRequest (0040,2017)"
{{R }}* subject -> "(0010/*)"
{{R }}* requester -> "RequestingPhysician (0032,1032)"
{{R4}}* extension[reason].valueCodeableConcept.text -> "ReasonForTheRequestedProcedure (0040,1002)"
{{R5}}* reason.concept.text -> "ReasonForTheRequestedProcedure (0040,1002)"
{{R4}}* extension[reason].valueCodeableConcept -> "ReasonForTheRequestedProcedure (0040,100A)"
{{R5}}* reason.concept -> "ReasonForTheRequestedProcedure (0040,100A)"
