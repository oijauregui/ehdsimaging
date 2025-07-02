Profile: ImAdverseEvent
Parent: AdverseEvent
Title: "Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

{{R5}}* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson or ResearchSubject )
{{R4}}* subject only Reference(ImPatient or Group or $EuPractitioner or $EuRelatedPerson  )
{{R4}}* subject.extension contains ImAdverseEventSubjectReseachSubject named subjectReseachSubject 0..1

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

Extension: ImAdverseEventSubjectReseachSubject
Description: "Extension to capture the relationship of the subject to the ReseachSubject."
Title: "Imaging Adverse Event Subject Research Subject"
* ^context[+].type = #element
* ^context[=].expression = "AdverseEvent.subject"
* insert SetFmmAndStatusRule( 1, draft )
* valueReference only Reference(ResearchSubject)