Profile: ImagingServiceRequestEuImaging
Parent: $EuServiceRequest
Title: "ServiceRequest: Imaging Service Request"
Description: """
This profile on ServiceRequest represents the **Imaging Service Request**: the internal order created by the imaging
department (typically by the RIS acting as Order Filler) when it accepts one or more orders placed by a requester
(see [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html)).

The Imaging Service Request carries the *Accession Number* that drives the departmental workflow (scheduling, modality
worklist, acquisition, reporting) and links the order(s), the imaging studies and the imaging report(s).
The `code` element holds the requested procedure as protocolled by the imaging department, which may be more specific
than the orderable requested in the placer order.

The relation between placer orders and Imaging Service Requests is many-to-many: an Imaging Service Request MAY fulfil
several placer orders (`basedOn`), and a placer order MAY be fulfilled by several Imaging Service Requests.

This profile corresponds to the DICOM *Imaging Service Request* and *Requested Procedure* and is aligned with the
`ImagingServiceRequestProfile` of the [HL7 FHIR Imaging ServiceRequest IG](https://build.fhir.org/ig/HL7/imaging-service-request-ig/).
"""
* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $sct#363679005 // "Imaging"

* identifier 1..*
  * insert SliceElement( #value, type )
* identifier contains accessionNumber 1..1 and fillerOrder 0..1
* identifier[accessionNumber] only AccessionNumberIdentifierEuImaging
* identifier[accessionNumber] ^short = "Accession Number assigned by the imaging department"
* identifier[fillerOrder] ^short = "Filler order number assigned by the imaging department"
* identifier[fillerOrder]
  * type 1..1
  * type = $v2-0203#FILL
  * system 1..1
  * value 1..1

* basedOn only Reference(ServiceRequestOrderEuImaging)
* basedOn ^short = "Placer order(s) fulfilled by this Imaging Service Request"
* basedOn ^definition = """
The placer order(s) that this Imaging Service Request fulfils. When the placer order is not available as a FHIR
resource, a logical reference using `identifier` (type `PLAC`) MAY be used.
"""

* intent ^comment = """
Systems SHOULD use `filler-order` as the Imaging Service Request is the imaging department's view on the placer order(s).
`order` MAY be used when the placer order and the Imaging Service Request are represented by the same resource.
"""

* code ^short = "Requested procedure (as protocolled by the imaging department)"
* code from ProcedureEuImagingType (example)

Mapping: DicomToImagingServiceRequestEuImaging
Source: ImagingServiceRequestEuImaging
Target: "http://nema.org/dicom"
Title: "Mapping from DICOM to Imaging Service Request"
Description: "Mapping from DICOM to Imaging Service Request."
* identifier[accessionNumber] -> "AccessionNumber (0008,0050)"
* identifier[fillerOrder] -> "FillerOrderNumberImagingServiceRequest (0040,2017)"
* basedOn.identifier -> "PlacerOrderNumberImagingServiceRequest (0040,2016)"
* subject -> "(0010/*)"
* code -> "RequestedProcedureCodeSequence (0032,1064), RequestedProcedureDescription (0032,1060)"
