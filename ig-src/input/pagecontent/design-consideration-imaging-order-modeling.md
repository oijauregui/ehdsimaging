### Imaging order modeling

Imaging orders follow a placer/fulfiller split. The requester (placer) orders an imaging examination, typically from the EHR. The imaging department (fulfiller), typically the RIS, accepts the order and creates its own internal order. That internal order gets the Accession Number and drives the departmental workflow: scheduling, modality worklist, acquisition and reporting.

This guide models the two orders as separate `ServiceRequest` profiles: the **placer order** and the **filler order**, named after the Placer and Fulfiller actors of COW and the placer/filler orders of IHE Scheduled Workflow. It reuses the concepts of the following specifications:

* [Clinical Order Workflows (COW) IG](https://hl7.org/fhir/uv/cow/2025May/index.html):
  * [Actors](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#actors): Placer and Fulfiller.
  * [Requests, Tasks and Outputs](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#requests-tasks-and-outputs-events): only the initiating party owns and modifies a Request; outputs are linked back to the Request through `basedOn`.
  * [Order grouping](https://hl7.org/fhir/uv/cow/2025May/order-grouping.html): orders made of multiple items.
  * [Sharing outputs](https://hl7.org/fhir/uv/cow/2025May/sharing-outputs.html): how outputs reach the requester.
* [HL7 FHIR Imaging ServiceRequest IG](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/index.html):
  * [Relationship to IHE Scheduled Workflow](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/background.html#ihe-scheduled-workflow): placer and filler order management (RAD-2, RAD-3).
  * [DICOM MWL information model](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/architecture.html#dicom-modality-worklist-mwl-information-model): Imaging Service Request, Requested Procedure and Scheduled Procedure Step.
  * [MWL resource reference chain](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/architecture.html#mwl-resource-reference-chain): Accession Number, placer and filler order numbers.
  * [Imaging Service Request profile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-service-request.html).

<figure>
  {% include imaging-order-modeling.svg %}
  <figcaption>Figure: Imaging order modeling</figcaption>
</figure>
<br clear="all"/>

| Concept | This guide | Clinical Order Workflows IG | HL7 FHIR Imaging ServiceRequest IG | DICOM / HL7 v2 |
| --- | --- | --- | --- | --- |
| Order placed by the requester | [ServiceRequestPlacerOrderEuImaging](StructureDefinition-ServiceRequestPlacerOrderEuImaging.html) | Request owned by the [Placer](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#actors) | RAD-2 Placer Order, referenced through [`basedOn[placerOrderRef]`](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/architecture.html#mwl-resource-reference-chain) | Placer Order Number (0040,2016) / ORC-2 |
| Internal order of the imaging department | [ServiceRequestFillerOrderEuImaging](StructureDefinition-ServiceRequestFillerOrderEuImaging.html) | Request created by the [Fulfiller](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#actors) when fulfilling the placer Request | [ImagingServiceRequestProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-service-request.html) | Accession Number (0008,0050), Filler Order Number (0040,2017) / ORC-3 |
| Requested procedure | `ServiceRequestFillerOrderEuImaging.code` | - | [ImagingRequestedProcedureProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-requested-procedure.html) | Requested Procedure Code Sequence (0032,1064) |
| Scheduled work | Not profiled | [Task](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#requests-tasks-and-outputs-events) | [ImagingProcedureStepProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-procedure-step.html) | Scheduled Procedure Step |
| Performed procedure | [ProcedureEuImaging](StructureDefinition-ProcedureEuImaging.html) | Output | [ImagingProcedureProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-procedure.html) | Performed Procedure Step |

The relation between placer orders and filler orders is many-to-many. A filler order refers through `basedOn` to all placer orders it fulfils, and a placer order MAY be fulfilled by several filler orders. The Accession Number is carried by the filler order. Resources produced in the imaging workflow, such as [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html) and [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html), refer to the filler order through the Accession Number.

The Requested Procedure and the Scheduled Procedure Step of the DICOM modality worklist are not profiled in this guide. In this guide, the requested procedure is carried in `ServiceRequestFillerOrderEuImaging.code`. Implementations that need the full modality worklist model can follow the HL7 FHIR Imaging ServiceRequest IG.

See [Imaging Report - Order](imaging-report.html#order) for guidance on populating the Order section of the report.
