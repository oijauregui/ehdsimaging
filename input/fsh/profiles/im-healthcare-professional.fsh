Profile: ImOrderPlacerProvider
Parent: ImOrderPlacer
Id: im-order-placer-provider
Title: "Order Placer (ImProvider)"
Description: "Requirements for the provider of the order placer."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* specialty
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImOrderPlacer
Parent: ImPractitionerRole
Id: im-order-placer
Title: "Order Placer"
Description: """
    The healthcare professional who placed the order for the study. 
"""
* practitioner 1..1
* specialty 0..1
  // TODO define ValueSet for specialty from SNOMED CT or reuse http://hl7.org/fhir/ValueSet/c80-practice-codes


Profile: ImInformationRecipient
Parent: ImPractitionerRole
Id: im-information-recipient
Title: "Information Recipient"
Description: """
    Information recipient (intended recipient or recipients of the report, e.g., GP, another specialist).
"""
* practitioner 1..1

Profile: ImAuthor
Parent: ImPractitionerRole
Id: im-author
Title: "Report Author"
Description: """
     Author (by whom the imaging report or a subset of its results was authored). Multiple authors could be provided.
"""
* practitioner 1..1

Profile: ImLegalAuthenticator
Parent: ImPractitionerRole
Id: im-legal-authenticator
Title: "Legal Authenticator"
Description: """
    Legal authenticator (The person taking responsibility for the medical content of the document). 
"""
// TODO what code to use to represent this role?
* practitioner 1..1

Profile: ImResultValidator
Parent: ImPractitionerRole
Id: im-result-validator
Title: "Result Validator"
Description: """
    Result validator. The healthcare professional who is responsible 
    validating the diagnostic report. 
"""
// TODO how this differs from legal authenticator?
// TODO what code to use to represent this role?
* practitioner 1..1

Profile: ImPerformer
Parent: ImPractitionerRole
Id: im-performer
Title: "Imaging study performer"
Description: """
    The healthcare professional who performed the study/procedure.
"""
* practitioner 1..1

