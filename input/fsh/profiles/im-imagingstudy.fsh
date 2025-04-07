Profile: ImImagingStudy
Parent: ImagingStudy
Id: im-imagingstudy
Title: "ImagingStudy"
Description: """ 
This profile represents an imaging study instance.
"""
* insert SetFmmAndStatusRule( 1, draft )
* obeys im-imagingstudy-01

* identifier MS
  * insert SliceElement( #value, system )
* identifier contains studyInstanceUid 1..1 MS
* identifier[studyInstanceUid]
  * system MS
  * system = "urn:dicom:uid"
  * value 1.. MS

* subject 1..1
* subject only Reference( $PatientEu or $DeviceEu )

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1 MS
* insert BasedOnImOrderReference( imorderaccession )

* insert EndpointTypes 

* series
  * performer.function from ImImagingStudyPerformerTypeVS (extensible)
  * performer
    * insert SliceElement( #type, actor )
  * performer contains performer 0..1 MS and device 0..1 MS and custodian 0..1 MS
  * performer[performer]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF
    * actor only Reference( http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu )
  * performer[custodian]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST
    * actor only Reference( http://hl7.eu/fhir/base/StructureDefinition/organization-eu )
  * performer[device]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
    * actor only Reference( ImImagingDevice ) 

  * insert EndpointTypes 

  * instance
    * extension contains 
      ImImagingStudyInstanceDescription named instance-description 0..1


Extension: ImImagingStudyInstanceDescription
Id: instance-description
Title: "Instance Description"
Description: "A description of the instance in an ImagingStudy."
Context: ImagingStudy.series.instance
* value[x] only string

Invariant: im-imagingstudy-01
Description: "A DICOM instance UID must start with 'urn:oid:'"
Severity: #warning
Expression: "identifier.where(system='urn:dicom:uid').value.startsWith('urn:oid:')"

RuleSet: EndpointTypes
* endpoint 0..* MS  
  * insert SliceElement( #profile, $this )
* endpoint contains wado 0..1 MS and iid 0..1 MS
* endpoint[wado] only Reference( ImWadoEndpoint )
* endpoint[iid] only Reference( ImImageIidViewerEndpoint )