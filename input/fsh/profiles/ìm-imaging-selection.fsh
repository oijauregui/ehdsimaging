Profile: ImImagingSelectionProvider
Parent: ImImagingSelection
Title: "Represents the part of an imaging study. (ImProvider)"
Description: "Requirements for the provider of the imaging selection."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* status
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )

  
Profile: ImImagingStudyPhaseProvider
Parent: ImImagingStudyPhase
Id: im-imaging-study-phase-provider
Title: "Imaging results from Procedure Phase (ImProvider)"
Description: "Requirements for the provider of the imaging study phase."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )


Profile: ImImagingSelection
Parent: ImagingSelection
Title: "Represents the part of an imaging study."
* insert SetFmmAndStatusRule( 1, draft )
* subject 1..1

  
Profile: ImImagingStudyPhase
Parent: ImImagingSelection
Id: im-imaging-study-phase
Title: "Imaging results from Procedure Phase"
Description: "Represents the part of an imaging study that relates to a procedure phase such as e.g., without contrast, arterial phase, venous 
phase, delayed phase. Only some types of studies have phases."
* insert SetFmmAndStatusRule( 1, draft )

* category
  * insert SliceElement( #value, "coding" )
* category contains phase 1..1
* category[phase]
  * coding 1..1
  * coding = $sct#128954007 "Procedure phase"  