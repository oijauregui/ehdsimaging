Profile: ImAdverseEvent
Parent: AdverseEvent
Title: "Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )
* suspectEntity
  * insert SliceElement( #profile, $this )
* suspectEntity contains procedure 0..*
  * procedure only Reference(ImProcedure)