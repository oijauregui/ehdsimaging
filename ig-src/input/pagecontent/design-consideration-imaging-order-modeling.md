### Imaging order modeling

Imaging orders follow a placer/fulfiller split. The requester (placer) orders an imaging examination, typically from the EHR. The imaging department (fulfiller), typically the RIS, accepts the order and creates its own internal order. That internal order gets the Accession Number and drives the departmental workflow: scheduling, modality worklist, acquisition and reporting.

This guide models the two orders as separate `ServiceRequest` profiles: the **placer order** and the **Imaging Service Request** (the filler order), named after the Placer and Fulfiller actors of COW and the placer/filler orders of IHE Scheduled Workflow. It reuses the concepts of the following specifications:

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
| Order placed by the requester | [ServiceRequestPlacerOrderEuImaging](StructureDefinition-ServiceRequestPlacerOrderEuImaging.html) | Request owned by the [Placer](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#actors) | RAD-2 Placer Order, referenced through [`basedOn[placerOrderRef]`](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/architecture.html#mwl-resource-reference-chain) | Placer Order Number (0040,2016) / ORC-2; Filler Order Number (0040,2017) / ORC-3, returned by the RIS |
| Internal order of the imaging department | [ImagingServiceRequestEuImaging](StructureDefinition-ImagingServiceRequestEuImaging.html) | Request created by the [Fulfiller](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#actors) when fulfilling the placer Request | [ImagingServiceRequestProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-service-request.html) | Accession Number (0008,0050) |
| Requested procedure | `ImagingServiceRequestEuImaging.code` | - | [ImagingRequestedProcedureProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-requested-procedure.html) | Requested Procedure Code Sequence (0032,1064) |
| Scheduled work | Not profiled | [Task](https://hl7.org/fhir/uv/cow/2025May/core-concepts.html#requests-tasks-and-outputs-events) | [ImagingProcedureStepProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-procedure-step.html) | Scheduled Procedure Step |
| Performed procedure | [ProcedureEuImaging](StructureDefinition-ProcedureEuImaging.html) | Output | [ImagingProcedureProfile](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/StructureDefinition-imaging-procedure.html) | Performed Procedure Step |

The relation between placer orders and Imaging Service Requests is many-to-many. An Imaging Service Request refers through `basedOn` to all placer orders it fulfils, and a placer order MAY be fulfilled by several Imaging Service Requests. The Accession Number is carried by the Imaging Service Request. Resources produced in the imaging workflow, such as [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html) and [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html), refer to the Imaging Service Request through the Accession Number.

The Requested Procedure and the Scheduled Procedure Step of the DICOM modality worklist are not profiled in this guide. In this guide, the requested procedure is carried in `ImagingServiceRequestEuImaging.code`. Implementations that need the full modality worklist model can follow the HL7 FHIR Imaging ServiceRequest IG.

#### Order identifiers

The order carries up to three identifiers, all optional in practice:

* **Placer Order Number** — assigned by the placer (EHR) when the order is created. HL7 v2 ORC-2 / OBR-2, DICOM [Placer Order Number / Imaging Service Request (0040,2016)](https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_6.html). It is carried on the placer order as `identifier[placerOrder]` (type `PLAC`).
* **Filler Order Number** — assigned by the filler (RIS) when it accepts the order and returned to the placer. HL7 v2 ORC-3 / OBR-3, DICOM [Filler Order Number / Imaging Service Request (0040,2017)](https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_6.html). It is carried on the placer order as `identifier[fillerOrder]` (type `FILL`).
* **Accession Number** — the departmental key. DICOM [Accession Number (0008,0050)](https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_6.html). It is carried on the Imaging Service Request as `identifier[accessionNumber]` (type `ACSN`), where it is mandatory.

**When an order number is missing.** The placer and filler order numbers are optional, because a given system may not have them:

* The **filler order number** is absent until the filler has accepted the order (e.g. a placer order that has not yet been processed by the RIS). It is also absent when the filler communicates only the Accession Number. In that case the Imaging Service Request is still fully identified by its Accession Number, and consumers correlate the orders through the `basedOn` chain rather than through the filler order number.
* The **placer order number** is absent when there is no electronic placer (paper or scanned referral, self-referral) or when the placer system did not assign one. In that case the placer order is not separately identified; it is represented inline on the Imaging Service Request (`intent = order`) together with the order information provided by the requester, or omitted entirely when nothing beyond the Accession Number is known.

**Referencing a placer order by identifier only.** When the only information available about a placer order is its placer order number (no requester, reason, date, etc.), it need not be exchanged as a separate `ServiceRequestPlacerOrderEuImaging` resource. The Imaging Service Request references it with a logical reference — `basedOn.identifier` carrying the Placer Order Number (type `PLAC`) and no `basedOn.reference` — following the [`basedOn[placerOrderRef]`](https://build.fhir.org/ig/HL7/imaging-service-request-ig/en/architecture.html#mwl-resource-reference-chain) pattern of the HL7 FHIR Imaging ServiceRequest IG.

See [Imaging Report - Order](imaging-report.html#order) for guidance on populating the Order section of the report.
