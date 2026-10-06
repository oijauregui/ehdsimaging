Profile: ServiceRequestFillerOrderEuImaging
Parent: $EuServiceRequest
Title: "ServiceRequest: Imaging Filler Order"
Description: """
This profile on ServiceRequest represents the **filler order**: the internal order created by the imaging department
(typically by the RIS acting as Order Filler) when it accepts one or more placer orders
(see [ServiceRequestPlacerOrderEuImaging](StructureDefinition-ServiceRequestPlacerOrderEuImaging.html)).

The filler order carries the *Accession Number* that drives the departmental workflow (scheduling, modality
worklist, acquisition, reporting) and links the order(s), the imaging studies and the imaging report(s).
The `code` element holds the requested procedure as protocolled by the imaging department, which may be more specific
than the orderable requested in the placer order.

The relation between placer orders and filler orders is many-to-many: a filler order MAY fulfil several placer orders
(`basedOn`), and a placer order MAY be fulfilled by several filler orders.

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
* identifier contains accessionNumber 1..1
* identifier[accessionNumber] only AccessionNumberIdentifierEuImaging
* identifier[accessionNumber].type = $v2-0203#ACSN
* identifier[accessionNumber] ^short = "Accession Number assigned by the imaging department"

* basedOn only Reference(ServiceRequestPlacerOrderEuImaging)
* basedOn ^short = "Placer order(s) fulfilled by this filler order"
* basedOn ^definition = """
The placer order(s) that this filler order fulfils. When the placer order is not available as a FHIR
resource, a logical reference using `identifier` (type `PLAC`) MAY be used.
"""

* intent ^comment = """
Systems SHOULD use `filler-order` as the filler order is the imaging department's view on the placer order(s).
`order` MAY be used when the placer order and the filler order are represented by the same resource.
"""

* code ^short = "Requested procedure (as protocolled by the imaging department)"
* code from ProcedureEuImagingType (example)

Mapping: DicomToServiceRequestFillerOrderEuImaging
Source: ServiceRequestFillerOrderEuImaging
Target: "http://nema.org/dicom"
Title: "Mapping from DICOM to Imaging Filler Order"
Description: "Mapping from DICOM to Imaging Filler Order."
* identifier[accessionNumber] -> "AccessionNumber (0008,0050)"
* basedOn.identifier -> "PlacerOrderNumberImagingServiceRequest (0040,2016)"
* subject -> "(0010/*)"
* code -> "RequestedProcedureCodeSequence (0032,1064), RequestedProcedureDescription (0032,1060)"
