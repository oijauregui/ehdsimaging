{% include profile-references.md %}

### Obligations

Systems are expected to handle specific data elements according to the role (actor) they play in the EHDS Imaging Report ecosystem. In this specification, these expectations are defined as [FHIR Implementation Obligations]({% if isR5 %}https://hl7.org/fhir/R5/obligations.html{% else %}https://hl7.org/fhir/extensions/ValueSet-obligation.html{% endif %}), following [EHDS shared practices](https://www.xt-ehr.eu/fhir/models/1.0.0/en/obligations.html) and are listed in the [Artifacts](artifacts-obligations.html) section.

Following this guidance, for {{ ProducerActor }}s `SHALL/SHOULD/MAY:able-to-populate` obligations are added indicating the required capability of the Producer to populate a field. For {{ ConsumerActor }}s `SHALL/SHOULD/MAY:process` obligations are used to express what fields a {{ ConsumerActor }} is required to process. Note that no display related obligations are used and the variety of {{ ConsumerActor }}s makes it very difficult if not impossible to determine a generic rule for this.
