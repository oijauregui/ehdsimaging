{% include fsh-link-references.md %}

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   This is an early draft of the specification that is still under rapid development. It is intended as a starting point of discussions and does not represent any final decisions. The content of this implementation guide will be discussed and tested in the Feb 2025 HL7 EU WGM. After the WGM, further work on the IG will be discussed in weekly telco's. This initial version is based on FHIR R5. Once the model stabilizes, the FHIR R4 version will be derived from it.
 </blockquote>
</div>

### Scope

This implementation guide specifies imaging study data in the **European** context, as defined in
[eHN Imaging Studies and Reports](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en), as a FHIR model.

### Purpose

The goal of this Implementation Guide is to define an European standard for the Imaging Study Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF).

The development of this implementation guide is promoted by HL7 Europe, but realized in collaboration with several other European and national organizations and projects. The aspiration of this guide is that of being used as basis for European National Guides, the European EHRxF and - consequently - by MyHealth@EU for the EU cross-border services.

### Related specifications

This specification defines the representation of the data sets required by the European eHealth Network's  "[Guideline on the electronic exchange of health data under Cross-Border Directive 2011/24/EU Medical imaging studies and reports, release 1.1](https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en)".

Besides the requirements defined in the eHN specification, it also uses input  from other related activities:

* Related activities in other Standard Development Organizations (SDO):
  * IHE-RAD
  * HL7 FHIR Imaging Integration
* Related specifications:
  * IHE-IDR, draft version as discussed on Jan 19 2025
    * [IHE-RAD](https://profiles.ihe.net/RAD/) is working on a machine readable specification for diagnostic reports of (common) radiology procedures. The draft results of this activity have been taken along in the definition of this IG.
  * [HL7 EU Laboratory Reports](https://build.fhir.org/ig/hl7-eu/laboratory/branches/master/index.html)
    * This specification has adopted many of the design patterns defined in this IG.
  * [HL7 EU Hispotal Discharge Reports](https://build.fhir.org/ig/hl7-eu/hdr/index.html)
    * This specification has adopted many of the design patterns defined in this IG.
  * [Argonaut Imaging](https://github.com/sync-for-science/imaging)
  * [US core v7.0.0](https://hl7.org/fhir/us/core/STU7/)
    * Where possible this specification has been aligned with choices made in US core.

### Dependencies

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### IP statements

{% include ip-statements.xhtml %}

### Authors and Contributors

Please refer to the [Authors and Contributors](contributors.html) page.
