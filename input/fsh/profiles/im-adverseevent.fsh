Profile: ImAdverseEvent
Parent: AdverseEvent
Title: "Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson or ResearchSubject )

* suspectEntity
  * insert SliceElement( #profile, $this )
* suspectEntity contains procedure 0..*
  * procedure only Reference(ImProcedure)

* contributingFactor
  * insert SliceElement( #profile, $this )
* contributingFactor contains allergy 0..*
* contributingFactor[allergy]
  * itemReference only Reference($EuAllergyIntolerance)