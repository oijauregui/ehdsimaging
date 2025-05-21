Profile: ImAdverseEvent
Parent: AdverseEvent
Title: "Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

{{R5}}* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson or ResearchSubject )
{{R4}}* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson  )

* suspectEntity
  * insert SliceElement( #profile, instance )
* suspectEntity contains procedure 0..*
{{R5}}* suspectEntity[procedure].instanceReference only Reference(ImProcedure)
{{R4}}* suspectEntity[procedure].instance only Reference(ImProcedure)

{% if isR4 %}
* subjectMedicalHistory
  * insert SliceElement( #profile, $this )
* subjectMedicalHistory contains allergy 0..*
* subjectMedicalHistory[allergy]
* subjectMedicalHistory only Reference($EuAllergyIntolerance)
{% endif %}

{% if isR5 %}
* contributingFactor
  * insert SliceElement( #profile, $this )
* contributingFactor contains allergy 0..*
* contributingFactor[allergy]
  * itemReference only Reference($EuAllergyIntolerance)
{% endif %}