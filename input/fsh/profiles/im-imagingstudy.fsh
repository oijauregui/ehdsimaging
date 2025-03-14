Profile: ImImagingStudyProvider
Parent: ImImagingStudy
Id: im-imagingstudy-provider
Title: "ImagingStudy (ImProvider)"
Description: "Requirements for the provider of the imaging study."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* status 
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* description
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* endpoint
* series
  * performer[performer]
    * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
  * performer[custodian]
    * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
  * performer[device]
    * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImImagingStudy
Parent: ImagingStudy
Id: im-imagingstudy
Title: "ImagingStudy"
Description: """ 
This profile represents an imaging study instance.
"""
* insert SetFmmAndStatusRule( 1, draft )
* obeys im-imagingstudy-01

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1 
* insert BasedOnImOrderReference( imorderaccession )

* identifier
  * insert SliceElement( #value, system )
* identifier contains studyInstanceUid 1..1 
* identifier[studyInstanceUid]
  * system 
  * system = "urn:dicom:uid"
  * value 1.. 
  * value

* endpoint 0..*
  * insert SliceElement( #profile, $this )
* endpoint contains wado 0..1 and iid 0..1
* endpoint[wado] only Reference( ImWadoEndpoint )
* endpoint[iid] only Reference( ImImageIidViewerEndpoint )

* series
  * performer 0..1
    * insert SliceElement( #type, actor )
  * performer contains performer 0..1 and device 0..1 and custodian 0..1
  * performer[performer]
    * actor only Reference( ImPractitionerRole )
  * performer[custodian]
    * actor only Reference( ImOrganization )
  * performer[device]
    * actor only Reference( ImImagingDevice )
  * uid 1..1
  * description 0..1
  * modality 1..1
  * number 0..1
  
  * endpoint 0..*
    * insert SliceElement( #profile, $this )
  * endpoint contains wado 0..1 and iid 0..1
  * endpoint[wado] only Reference( ImWadoEndpoint )
  * endpoint[iid] only Reference( ImImageIidViewerEndpoint )
  
  * instance
    * uid 1..1
    * sopClass 1..1
    * number 0..1

* subject 1..1
* subject only Reference(ImPatient)

Invariant: im-imagingstudy-01
Description: "A DICOM instance UID must start with 'urn:oid:'"
Severity: #warning
Expression: "identifier.where(system='urn:dicom:uid').value.startsWith('urn:oid:')"