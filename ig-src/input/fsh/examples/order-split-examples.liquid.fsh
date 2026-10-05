// Two placer orders from different requesters, fulfilled by a single Imaging Service Request (many-to-one).

Instance: ServiceRequestOrderChestCT
InstanceOf: ServiceRequestOrderEuImaging
Title: "ServiceRequest: placer order for a CT of the chest"
Description: "Placer order for a CT of the chest, placed in the EHR and fulfilled by ImagingServiceRequestChestAbdomenCT."
Usage: #example
* identifier[placerOrder]
  * type = $v2-0203#PLAC
  * system = "http://example.org/myhospital/ehr/placerorder"
  * value = "PO-1001"
* status = #active
* intent = #order
* category[imaging] = $sct#363679005 "Imaging"
{{R4}}* code = $sct#169069000 "Computed tomography of chest"
{{R5}}* code.concept = $sct#169069000 "Computed tomography of chest"
* subject = Reference(PatientStructuredReport)
* authoredOn = "2025-09-01T09:15:00Z"
{{R4}}* reasonCode[+].text = "Persistent cough, history of smoking"
{{R5}}* reason[+].concept.text = "Persistent cough, history of smoking"

Instance: ServiceRequestOrderAbdomenCT
InstanceOf: ServiceRequestOrderEuImaging
Title: "ServiceRequest: placer order for a CT of the abdomen"
Description: "Placer order for a CT of the abdomen, placed in the EHR and fulfilled by ImagingServiceRequestChestAbdomenCT."
Usage: #example
* identifier[placerOrder]
  * type = $v2-0203#PLAC
  * system = "http://example.org/myhospital/ehr/placerorder"
  * value = "PO-1002"
* status = #active
* intent = #order
* category[imaging] = $sct#363679005 "Imaging"
{{R4}}* code = $sct#169070004 "Computed tomography of abdomen"
{{R5}}* code.concept = $sct#169070004 "Computed tomography of abdomen"
* subject = Reference(PatientStructuredReport)
* authoredOn = "2025-09-01T11:40:00Z"
{{R4}}* reasonCode[+].text = "Abdominal pain, weight loss"
{{R5}}* reason[+].concept.text = "Abdominal pain, weight loss"

Instance: ImagingServiceRequestChestAbdomenCT
InstanceOf: ImagingServiceRequestEuImaging
Title: "ServiceRequest: Imaging Service Request for a CT of the chest and abdomen"
Description: "Imaging Service Request created by the RIS that fulfils two placer orders with a single protocolled procedure and Accession Number."
Usage: #example
* identifier[accessionNumber]
  * type
    * coding[v2-0203-coding] = $v2-0203#ACSN
  * system = "http://example.org/myhospital/ris/accession"
  * value = "ACC-2025-000123"
* identifier[fillerOrder]
  * type = $v2-0203#FILL
  * system = "http://example.org/myhospital/ris/fillerorder"
  * value = "FO-5001"
* basedOn[+] = Reference(ServiceRequestOrderChestCT)
* basedOn[+] = Reference(ServiceRequestOrderAbdomenCT)
* status = #active
* intent = #filler-order
* category[imaging] = $sct#363679005 "Imaging"
{{R4}}* code = $sct#429864007 "Computed tomography of thorax and abdomen with contrast"
{{R5}}* code.concept = $sct#429864007 "Computed tomography of thorax and abdomen with contrast"
* subject = Reference(PatientStructuredReport)
* authoredOn = "2025-09-01T14:00:00Z"
