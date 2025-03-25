Profile: ImPatientProvider
Parent: ImPatient
Id: im-patient-provider
Title: "Imaging Patient (ImProvider)"
Description: "Provider requirements for Imaging Patients."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language 0..1
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* extension[genderIdentity]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* extension[sex-for-clinical-use]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* name.use 0..1
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* name.family
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* name.given 0..*
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* birthDate
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* identifier
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* gender
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* address
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )
* telecom
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.x.y]], [[]] )

Profile: ImPatientConsumer
Parent: ImPatient
Id: im-patient-consumer
Title: "Imaging Patient (ImConsumer)"
Description: "ImConsumer requirements for Imaging Patients."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A1.8]], [[follow security requirements]] )
* extension[genderIdentity]
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* extension[sex-for-clinical-use]
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* name.use
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* name.family
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* name.given
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* birthDate
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* identifier
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )
* gender
  * insert SetObligation( #SHALL:correctly-handle, ImProvider, [[A.x.y]], [[used for identification]] )


Profile: ImPatient
Parent: http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core
Id: im-patient
Title: "Imaging Patient"
Description: "Human patient representing the subject of a medical imaging study for the scope of the HL7 Europe project."
* . ^short = "Patient Im"
* . ^definition = "Human patient representing the subject of a medical imaging study for the scope of the HL7 Europe project."
* insert SetFmmAndStatusRule( 1, draft )
* extension contains $individual-genderIdentity named genderIdentity 1..1
* name 1..*
  * use 0..1
  * family 0..1
  * given 0..*
* birthDate 1..1
* identifier 0..*
  * ^definition = """ 
    An identifier of the patient that is unique within a defined
    scope. Example: Example: National ID (citizen card / eID),
    health number, passport, etc. Multiple identifiers could be
    provided.
    """
* gender 0..1
* address 0..*
  * ^definition = """ 
    Mailing and home or office addresses. The addresses are always sequences of address parts (e.g., street address line, country, ZIP code, city) even if postal address formats may vary depending on the country. An address may or may not include a specific use code; if this attribute is not present it is assumed to be the default address useful for any purpose.
    """
