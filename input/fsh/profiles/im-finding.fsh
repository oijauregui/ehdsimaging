Profile: ImFindingProvider
Parent: ImFinding
Id: im-finding-provider
Title: "Finding (ImProvider)"
Description: "Requirements for the provider of the finding."
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* partOf[imagingstudy]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* partOf[procedure]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* code
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* subject
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* effective[x]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* performer only Reference( ImPractitionerRole )
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* value[x]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* note
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* method
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* derivedFrom[imagingstudy]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* derivedFrom[imagingselection]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )


Profile: ImFinding
Parent: Observation
Id: im-finding
Title: "Finding"
Description: "Finding during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )
  
* partOf
  * insert SliceElement( #type, $this )
* partOf contains 
    imagingstudy 0..* and
    procedure 0..* 
* partOf[imagingstudy] only Reference( ImImagingStudy )
  * ^short = "Imaging study that produced this observation"
* partOf[procedure] only Reference( ImProcedure )
  * ^short = "Procedure that produced this observation"
* category
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging

* subject only Reference( ImPatient )

* performer only Reference( ImPractitionerRole )
 
* derivedFrom
  * insert SliceElement( #type, $this )
* derivedFrom contains 
    imagingstudy 0..* and
    imagingselection 0..* 
* derivedFrom[imagingstudy] only Reference( ImImagingStudy )
  * ^short = "Imaging study that produced this observation"
* derivedFrom[imagingselection] only Reference( ImImagingSelection )
  * ^short = "Series or image that produced this observation"
