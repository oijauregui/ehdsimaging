{% include fsh-link-references.md %}
{% include variable-definitions.md %}

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>This is the 0.1.0-ballot version of the specification. 
   </p>
   <p>The source of this IG is stored on github (<a href="https://github.com/hl7-eu/imaging">https://github.com/hl7-eu/imaging</a>).
   </p>
   <p> The content of this implementation guide is discussed HL7 EU calls (<a href="https://confluence.hl7.org/spaces/HEU/pages/321160129/Imaging+meetings">HL7-eu imaging on Confluence</a>).
   </p>
   <p> This version is based on FHIR R5. A FHIR R4 version will be derived from this ballot version and is expected to be published in the near future.  
   </p>
 </blockquote>
</div>


### Scope

This implementation guide specifies imaging study data in the **European** context, as defined in {{ehnImaging}} and refined by {{XtEhrImaging}}, as a FHIR model. It defines:
* The structure and contents of a FHIR imaging studies and reports.
* Different options for publishing and searching for such studies and reports.
* Discovery of available mechanisms to access the imaging data.

The specification is to be used in a variety of deployment models, which includes the EHDS use cases: exchange data within healthcare organizations, across nations/regions and cross border information exchange. In all of these use cases it is important that it is compatible with the existing ecosystem.

Current approaches within Europe use different approaches to information exchange:
* **Document based exchange**, the document is represented as a FHIR Document Bundle.
* **REST API based access to documents**, a {{Composition}} and {{DiagnosticReport}} for each document including instances of the referred resources
* **REST API based access to resources**, as the previous but the (important) resources are *harmonized*, meaning that all documents point to the same {{Patient}}, {{Organization}} and other resources.

The specification is being designed in such a way that it can be used in all of these deployment scenarios.

<div xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <blockquote class="stu-note">  
   <p>Timeline:</p>
   <ul>
   <li>Feb 2025, kick-off during HL7-EU WGM.</li>
   <li>May 2025, first planned ballot to be tested during May 2025 HL7 WGM in Madrid.</li>
   <li>June 2025, testing in IHE-EU plug-a-thon in Vienna/</li>
   <li>August 2025, first version</li>
   </ul>
 </blockquote>
</div>

### Purpose

The goal of this Implementation Guide is to define an European standard for the Imaging Study Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF).

The development of this implementation guide is promoted by HL7 Europe, but realized in collaboration with several other European and national organizations and projects. The aspiration of this guide is to be used as basis for European National Guides, the European EHRxF ,and - consequently - by MyHealth@EU for the EU cross-border services.

### References

This specification defines the representation of the data sets required by {{ehnImagingFull}}".

Besides the requirements defined in the {{ehnImagingGuidelines}}, it also uses input from other related activities:

* Related activities in other Standard Development Organizations (SDO):

  * {{iheRad}}
  * HL7 FHIR Imaging Integration
* Related specifications:
  * {{iheIDR}}, draft version as discussed on Jan 19 2025
    * {{iheRad}} is working on a machine readable specification for diagnostic reports of (common) radiology procedures. The draft results of this activity have been taken along in the definition of this IG.
  * {{hl7EuBase}}
    * Base and code profiles for European specifications.
  * {{hl7EuExtensions}}  
    * This specification defines a set of extensions by HL7 Europe for the EU realm.
  * {{hl7EuLabs}}
    * This specification defines an European standard for the Laboratory Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF).
  * {{hl7EuHdr}}
    * This specification defines an European standard for the Hospital Discharge Report to facilitate the harmonization among the national initiatives and prepare the ground for the European EHR eXchange Format (E-EHRxF)."
  * {{ArgImg}}

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
