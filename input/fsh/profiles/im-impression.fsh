Profile: ImImpressionProvider
Parent: ImImpression
Id: im-impression-provider
Title: "Impression (ImProvider)"
Description: "Provider requirements for Impressions."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* code 
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.5.5.2.1]], [[]] )
* clinicalStatus
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[Infrastructure]], [[]] )
* subject
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[Infrastructure]], [[]] )
* stage.summary
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.5.5.2.2]], [[]] )

Profile: ImImpression
Parent: Condition
Id: im-impression
Title: "Impression"
Description: "Impression of the imaging study. A conclusion drawn by the author based on the findings of the study."
* insert SetFmmAndStatusRule( 1, draft )

// TODO do we need to define a category for an impression?
* subject only Reference( ImPatient )


// do we have to add evidence to the impression?
// TODO further refinement of this model.