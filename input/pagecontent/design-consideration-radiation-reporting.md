#### Radiation dose reporting

The {{XtEhrImaging}} includes data elements that refer to radiation dose. In DICOM radiation dose is included in the study as a DICOM SR dose management report (see [DICOM Patient Radiation Dose SR IOD Templates](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_PatientRadiationDoseSRIODTemplates.html)). These documents contain more information than is requested by the {{XtEhrImaging}}. The {{ehnImagingGuidelines}} also mention that *"Radiation dose management (Only the initial elements are included in this release, and further work is needed)"* (Section 2, Chapter 1, Article 1).

It is recognized that including this information in the report as FHIR resource adds value (easily find the required information), but inclusion of these initial data elements without referring to the context in which they are produced may result in mis-interpretation of the data. The data represented in DICOM is much richer and further study is needed to determine what the appropriate representation of such data in FHIR will look like. So in this specification the radiation related data is supported by referring to the underlying DICOM information.

The radiation dose SR documents are included as series/instances in the {{ImagingStudy}} resource and can be identified by series with modelity of type `SR` and a `SOPclass` identifying the instance as a radiation dose document (i.e. SOPclass `1.2.840.10008.5.1.4.1.1.88.67` refers to X-Ray Radiation Dose report).

The client can then download the radiation dose information using WADO.

**Decision:** Radiation dose information will not be coded in FHIR, the presents of radiation dose information can be detected from the {{ImagingStudy}} using the `modality` and `SOPClass` information.

