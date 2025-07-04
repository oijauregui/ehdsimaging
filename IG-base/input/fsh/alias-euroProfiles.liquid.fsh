// lists of EU profiles. Some of the EU profiles are defined in this IG as there has not yet been a
// decision on where to host them. Using Aliases for them moves that choice to FHIR shorthand.
{% if isR5 %}
Alias: $EuAddress              = http://hl7.eu/fhir/base-r5/StructureDefinition/Address-eu
Alias: $EuAddressUrl           = http://hl7.eu/fhir/base-r5/StructureDefinition/Address-eu
{% endif %}

{% if isR4 %}
Alias: $EuAddress              = http://hl7.eu/fhir/base/StructureDefinition/Address-eu
Alias: $EuAddressUrl           = http://hl7.eu/fhir/base/StructureDefinition/Address-eu
{% endif %}

Alias: $EuAppointment          = Appointment
Alias: $EuAppointmentUrl       = http://hl7.org/fhir/StructureDefinition/Appointment

Alias: $EuAllergyIntolerance    = AllergyIntoleranceEu
Alias: $EuAllergyIntoleranceUrl = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/AllergyIntoleranceEu

Alias: $EuAttachment           = Attachment
Alias: $EuAttachmentUrl        = http://hl7.org/fhir/StructureDefinition/Attachment

Alias: $EuBodyStructure        = BodyStructureEu
Alias: $EuBodyStructureUrl     = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/BodyStructureEu

Alias: $EuCondition            = ConditionEu
Alias: $EuConditionUrl         = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/ConditionEu

Alias: $EuCoverage             = Coverage
Alias: $EuCoverageUrl          = http://hl7.org/fhir/StructureDefinition/Coverage

Alias: $EuCarePlan             = CarePlanEu
Alias: $EuCarePlanUrl          = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/CarePlanEu

Alias: $EuContactPoint         = ContactPoint
Alias: $EuContactPointUrl      = http://hl7.org/fhir/StructureDefinition/ContactPoint

Alias: $EuDevice               = Device
Alias: $EuDeviceUrl            = http://hl7.org/fhir/StructureDefinition/Device

Alias: $EuDocumentReference    = DocumentReferenceEu
Alias: $EuDocumentReferenceUrl = http://hl7.org/fhir/StructureDefinition/DocumentReference

Alias: $EuEncounter            = EncounterEu
Alias: $EuEncounterUrl         = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/EncounterEu

Alias: $EuEndpoint             = EndpointEu
Alias: $EuEndpointUrl          = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/EndpointEu

Alias: $EuHumanName            = HumanName
Alias: $EuHumanNameUrl         = http://hl7.org/fhir/StructureDefinition/HumanName

Alias: $EuEpisodeOfCare        = EpisodeOfCare
Alias: $EuEpisodeOfCareUrl     = http://hl7.org/fhir/StructureDefinition/EpisodeOfCare

Alias: $EuImagingStudy         = ImagingStudy
Alias: $EuImagingStudyUrl      = http://hl7.org/fhir/StructureDefinition/ImagingStudy

{% if isR5 %}
Alias: $EuLocation             = http://hl7.eu/fhir/base-r5/StructureDefinition/location-eu
Alias: $EuLocationUrl          = http://hl7.eu/fhir/base-r5/StructureDefinition/location-eu
{% endif %}

{% if isR4 %}
Alias: $EuLocation             = http://hl7.eu/fhir/base/StructureDefinition/location-eu
Alias: $EuLocationUrl          = http://hl7.eu/fhir/base/StructureDefinition/location-eu
{% endif %}

Alias: $EuMedication           = MedicationEu
Alias: $EuMedicationUrl        = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/MedicationEu

Alias: $EuObservation          = ObservationEu
Alias: $EuObservationUrl       = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/ObservationEu

Alias: $EuMedicationAdministration = MedicationAdministration
Alias: $EuMedicationAdministrationUrl = http://hl7.org/fhir/StructureDefinition/MedicationAdministration

{% if isR5 %}
Alias: $EuOrganization         = http://hl7.eu/fhir/base-r5/StructureDefinition/organization-eu
Alias: $EuOrganizationUrl      = http://hl7.eu/fhir/base-r5/StructureDefinition/organization-eu

Alias: $EuPatient              = http://hl7.eu/fhir/base-r5/StructureDefinition/patient-eu
Alias: $EuPatientUrl           = http://hl7.eu/fhir/base-r5/StructureDefinition/patient-eu

Alias: $EuPatientCore          = http://hl7.eu/fhir/base-r5/StructureDefinition/patient-core-eu
Alias: $EuPatientCoreUrl       = http://hl7.eu/fhir/base-r5/StructureDefinition/patient-core-eu


Alias: $EuPatientAnimal        = PatientAnimalEu
Alias: $EuPatientAnimalUrl     = http://hl7.eu/fhir/base-r5/StructureDefinition/Patient-animal-eu

Alias: $EuPractitionerRole     = http://hl7.eu/fhir/base-r5/StructureDefinition/practitionerRole-eu
Alias: $EuPractitionerRoleUrl  = http://hl7.eu/fhir/base-r5/StructureDefinition/practitionerRole-eu

Alias: $EuPractitioner         = http://hl7.eu/fhir/base-r5/StructureDefinition/practitioner-eu
Alias: $EuPractitionerUrl      = http://hl7.eu/fhir/base-r5/StructureDefinition/practitioner-eu
{% endif %}

{% if isR4 %}
Alias: $EuOrganization         = http://hl7.eu/fhir/base/StructureDefinition/organization-eu
Alias: $EuOrganizationUrl      = http://hl7.eu/fhir/base/StructureDefinition/organization-eu

Alias: $EuPatient              = http://hl7.eu/fhir/base/StructureDefinition/patient-eu
Alias: $EuPatientUrl           = http://hl7.eu/fhir/base/StructureDefinition/patient-eu

Alias: $EuPatientCore          = http://hl7.eu/fhir/base/StructureDefinition/patient-core-eu
Alias: $EuPatientCoreUrl       = http://hl7.eu/fhir/base/StructureDefinition/patient-core-eu


Alias: $EuPatientAnimal        = PatientAnimalEu
Alias: $EuPatientAnimalUrl     = http://hl7.eu/fhir/base/StructureDefinition/Patient-animal-eu

Alias: $EuPractitionerRole     = http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu
Alias: $EuPractitionerRoleUrl  = http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu

Alias: $EuPractitioner         = http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu
Alias: $EuPractitionerUrl      = http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu
{% endif %}

Alias: $EuProcedure            = ProcedureEu
Alias: $EuProcedureUrl         = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/ProcedureEu

Alias: $EuRange                = RangeEu
Alias: $EuRangeUrl             = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/RangeEu

Alias: $EuRelatedPerson        = RelatedPersonEu
Alias: $EuRelatedPersonUrl     = http://hl7.org/fhir/StructureDefinition/RelatedPerson

Alias: $EuServiceRequest       = ServiceRequest
Alias: $EuServiceRequestUrl    = http://hl7.org/fhir/StructureDefinition/ServiceRequest

Alias: $EuQuantity             = QuantityEu
Alias: $EuQuantityUrl          = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/QuantityEu

Alias: $EuSimpleQuantity       = SimpleQuantityEu
Alias: $EuSimpleQuantityUrl    = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/SimpleQuantityEu

Alias: $EuSpecimen             = SpecimenEu
Alias: $EuSpecimenUrl          = http://hl7.eu/fhir/imaging-{{r-code}}/StructureDefinition/SpecimenEu

Alias: $EuSubstance            = Substance
Alias: $EuSubstanceUrl         = http://hl7.org/fhir/StructureDefinition/Substance
