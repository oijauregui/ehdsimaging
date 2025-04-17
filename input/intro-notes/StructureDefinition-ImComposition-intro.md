{% include variable-definitions.md %}

{% include worknote.html text='Future versions of this document will likely include detailed requirements on what information has to be present in which section.' %}

The structure of the Imaging Report is based on {{iheIDR}}, as such the text in this section is heavily influenced (copied from) this specification.

An important feature of imaging reports is the organization of the content into sections intended to more efficiently and effectively communicate the information. The semantics of the sections are important. The same observation has different implications when present in the order, in the patient history, in the family history, or in the findings or impressions section of the report. “Flatlisting” into an undifferentiated collection of items can make the information more difficult to work with.

The content and ordering of the sections reflect organization of the content, not the dictation process. Some imaging clinicians may dictate content in different orders, or replace dictation of some content with the use of tools to populate parts of the report.

The American College of Radiology provides specific guidance in the ACR Practice Parameter for Communication of Diagnostic Imaging Findings on recommended report sections and content. While the titles may vary and the section groupings may differ slightly from practice to practice and from country to country, the approach of medical imaging clinicians to organizing report content is broadly consistent.

> Note 1: Words are bolded to call attention to key details.
> Note 2: Report sections and format are not formally standardized at some sites.
> Note 3: When there is no content for a section in a given report, the section is sometimes omitted.

Patient information such as name, age, gender, birthdate, and medical record number is typically provided first.

The Patient and Order information are often presented at the top of the report in a pre-defined “header” section with formatted fields for a number of the key details. Typically, this information is populated automatically, not dictated by the imaging clinician.

The Imaging Report holds the following sections:

### Header

General information on the report. Most of the information elements in this part of the report overlap with other clinical reports. The document header includes information on the patient, source organization, author, attester and custodian of the report. 

### Imaging Study

Information on the studies that this report is reporting on. It includes such as the study identifiers, date and time the exam was done, the modalities used in the exam and the different series.

### Order

The order section contains information on the orders that resulted in the studies and this report. It includes information such as the  `AccessionNumber`, the identity of the referring physician or organization, the indication for examination, and, ideally, additional patient context and specific clinical questions provided by the referring physician. Clinical questions are sometimes of the form “Follow-up X”, where X is an existing known finding (perhaps from a previous exam), or “Rule out X”, where X is a condition for which imaging input is requested on whether or not it is present. Indications are also, hopefully, provided to provide important clinical context to the imaging clinician, and to support assessment of the appropriateness of the order and/or billing. If indications are not present, they are sometimes sought out by imaging staff.

> Note: “Rule out X”, while somewhat helpful for the imaging clinician, can be problematic for billing since the symptoms that suggest the possible presence of the condition and establish the medical necessity of the imaging exam are implied, but not captured. Site practices increasingly deprecate such wording.

### History

This section includes patient history and other prior clinical details deemed relevant to the imaging study by the imaging clinician. Some information may be provided by the referring physician in the order, and more is extracted from the medical record by imaging staff, automated tools, or by the radiologist themselves. This information provides background for the imaging clinician, context for the contents of the report, and is sometimes relevant to billing and clinical guidelines. Potential sources include impressions or summaries of the clinical notes from the encounter where the imaging order was placed.

### Procedure

This section contains information such as the procedure type, the anatomy imaged, the date and time of the imaging examination, and the facility that performed it.

Also called Imaging technique, this section may describe the parameters that were used, details of any contrast media and/or radiopharmaceuticals administered, including concentration, volume, and route of administration, and any medications, and catheters or devices used.

The section can also describe preparation of the data produced by the procedure: Views, image sets, recons, reformats and post processing.

Radiation dose may also be described here; the text content and metrics may be constrained/formatted to meet local regulations.

The information in this section is typically more detailed than what is listed as the Order, and in fact may differ from the ordered exam based on the needs of the patient and the judgment of the imaging clinician.

Any deficiencies of the study may also be described here, such as whether the imaging was incomplete or if there were quality issues that prevented interpretation of some part of the study or otherwise compromise the sensitivity and specificity of the examination. In the event that a patient was unable to undergo imaging, for example due to claustrophobia or a seizure, a report might still be produced and this section would note that the exam was not performed and provide a reason.

While the actual instructions given to the patient are not typically listed in the report, some mention the fact that instructions were given, and perhaps that risks were discussed, and consent was obtained. Procedure notes from the technologist are typically captured elsewhere, but significant details such as adverse patient reactions, or things that may affect the quality of the study, may be included here.

Procedure details that may be required for billing are sometimes included here as well.

### Comparison

This section is a list of other studies that were considered relevant by the imaging clinician. They are typically identified by type (modality, anatomy, exam type) and date. Findings from these studies and comparisons with the current study are typically woven into the next section (e.g. indicating no change, differentiating descriptions and/or measurements), although some of these studies may not be specifically mentioned in the findings. It is typically presumed that both the images and the report for each comparison study were available to the imaging clinician, however in some cases, such as for external priors, only the report or only the images were available, in which case that may be noted here.

### Findings

This section provides a detailed description of the findings on the imaging examination. The findings should be described in a clear and concise manner, using standardized anatomic, pathologic, and radiologic terminology whenever possible.

When there are significant numbers of findings, the imaging clinician will typically organize them into groups, typically by anatomy. Reporting templates for particular procedure types (such as those at radreport.org) will also often organize the findings.

An important distinction between Findings and Impressions is that Findings capture what the imaging clinician saw in the image, while Impressions capture what they inferred/concluded. The findings might record a radiolucency, while the impression records a fracture. There are some cases where the two overlap, but generally imaging clinicians try to capture in the Findings what the significant image features are and strive in the Impressions to communicate to the referring physician what they think those represent in clinical terms.

### Impression

Sometimes also called Conclusion or Diagnosis, provides the radiologist’s overall interpretation of the findings, a specific diagnosis and/or differential diagnosis (when possible), responses to any clinical questions posed by the referring physician, and any recommendations for further management and/or confirmation, as appropriate.

Recommendations most often cover subsequent diagnostic imaging or other diagnostic procedures such as biopsies or lab tests. They may also include suggestions to correlate the imaging result with other clinical information to improve the confidence of the diagnosis, referrals to specialists, or less commonly, therapeutic procedures. The recommendations may cite specific guidelines applied, particularly when the referring physician might be less familiar with the current guidelines for certain findings than the imaging clinician. The imaging clinician may take into account the expertise of the referring physician when composing recommendations; for an unusual cancer, a family physician might find follow-up recommendations more helpful than an oncology specialist would.

Since referring physicians may specifically focus their attention on this section, the imaging clinician may choose particularly important details such as key findings or any adverse events, to re-iterate and summarize here.

The order of items in the impression is often significant, in that imaging clinicians frequently put the most critical, most actionable, most significant items first in the impression section to minimize the chance of them being overlooked. In the case of differential diagnosis, the multiple possible diagnoses are typically presented in order from the most likely to the least likely. Impression items may also be numbered to facilitate verbal referencing or linking to communications.

Some items in the impression may be clinically significant but were not associated with the indications or reason for exam; for example, a lung nodule deemed to be suspicious on a chest exam for trauma. These are often referred to as “incidental findings”.

Some items in the impression may be critical, in that they represent the potential for severe negative clinical impact to the patient if appropriate action is not taken promptly. The presence of such items almost always results in a communication with care staff and/or the patient.

### Recommendation

Some items in the impression may be considered actionable, in that some follow-up action or communication is advisable. The recommendations may or may not include a specific corresponding follow-up action. A corresponding communication to relevant persons may or may not have taken place during the reporting process and be noted in the report.

### Communication

There is strong interest in tooling to facilitate communicating critical results clearly and rapidly with the appropriate people, confirming that follow-up of actionable findings takes place, and making sure that incidental findings do not “fall through the cracks”.

Communications are records in the report about attempted and/or successful communications of some content of the report to the referring physician, the patient, or other appropriate person. These communications are initiated during the generation of the DiagnosticReport by members of the organization fulfilling that order. E.g. direct communication of time critical results by the radiologist to the referring physician.

Communication is not listed as a separate section in the ACR guidance, but codes for a communication section do exist. It is common practice to present communication records at the bottom of the report, just below the impressions, since they are often driven by specific items in the impression and occur at the end of the report creation process. Such communication records support medico-legal usage and the review and improvement of conformance to best practices for patient safety and quality of care.

The communication entry typically records the date, time, and method of communication, the person/organization contacted, and may summarize the content communicated.
