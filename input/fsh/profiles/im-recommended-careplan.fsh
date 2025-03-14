Profile: ImRecommendedCarePlanProvider
Parent: ImRecommendedCarePlan
Id: im-recommended-careplan-provider
Title: "Recommended CarePlan (ImProvider)"
Description: "Requirements for the provider of the recommended care plan for the patient based on the imaging study."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* status
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* intent
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* title
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* description
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* subject
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* created
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* contributor
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )


Profile: ImRecommendedCarePlan
Parent: CarePlan
Id: im-recommended-careplan
Title: "Recommended CarePlan"
Description: "Recommended care plan for the patient based on the imaging study. 
Contains the narrative containing the plan including proposals, goals, and order requests for monitoring, tracking, or improving the condition of the patient. In the future it is expected that the care plan could be provided in a structured and coded format."
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference(ImPatient)
* contributor only Reference(ImPractitionerRole)

