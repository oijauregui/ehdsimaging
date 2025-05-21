Profile: ImAdverseEvent
Parent: AdverseEvent
Title: "Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson or ResearchSubject )
//R4* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson  )

* suspectEntity
  * insert SliceElement( #profile, instance )
* suspectEntity contains procedure 0..*
* suspectEntity[procedure].instanceReference only Reference(ImProcedure)
//R4* suspectEntity[procedure].instance only Reference(ImProcedure)




* contributingFactor
  * insert SliceElement( #profile, $this )
* contributingFactor contains allergy 0..*
* contributingFactor[allergy]
  * itemReference only Reference($EuAllergyIntolerance)
