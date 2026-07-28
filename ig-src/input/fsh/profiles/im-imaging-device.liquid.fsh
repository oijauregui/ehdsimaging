
Profile: DeviceEuImaging
Parent: Device
Title: "Device: Imaging Device"
Description: """The device the made the image."""	
* insert SetFmmAndStatusRule( 1, draft )
* status 1..1

{{R4}}* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Device.category named imagingCategory 1..1
{{R4}}* extension[imagingCategory].valueCodeableConcept = $sct#314789007 // "Diagnostic imaging equipment"

{{R5}}* category 
{{R5}}  * insert SliceElement( #value, $this )
{{R5}}* category contains imaging 1..1
{{R5}}* category[imaging] = $sct#314789007 // "Diagnostic imaging equipment"

* type from DeviceEuImagingType (extensible)


ValueSet: DeviceEuImagingType
Title: "ValueSet: Imaging Device Type"
Description: "Imaging Device Type."
* insert SetFmmAndStatusRule( 1, draft )
* insert SNOMEDCopyrightForVS
* ^experimental = false
* include codes from system $sct where concept is-a #314789007 // "Diagnostic imaging equipment" (x-ray, CT, MRI, fluoroscopy, angiography, radiography)
* include codes from system $sct where concept is-a #105794008 // "Scope/camera, device" (endoscopy, microscopy, ophthalmoscopy, cameras)
* include codes from system $sct where concept is-a #706332007 // "Ultrasound imaging system"
* include codes from system $sct where concept is-a #706321007 // "Nuclear medicine system"
* include codes from system $sct where concept is-a #462323006 // "PET system"
* include codes from system $sct where concept is-a #717313001 // "SPECT - Single photon emission computed tomography system"
* include codes from system $sct where concept is-a #706318005 // "Mammographic x-ray system"
* include codes from system $sct where concept is-a #706317000 // "Breast imaging system"
* include codes from system $sct where concept is-a #392012008 // "Optical coherence tomography scanner"
* include codes from system $sct where concept is-a #706290000 // "Thermography system"
* exclude codes from system $sct where concept is-a #102322008 // "External prosthesis for sonographic procedure"
* exclude $sct#102324009 // "Saline bag prosthesis for imaging procedure"
* exclude $sct#102325005 // "Gel prosthesis for imaging procedure"
* exclude codes from system $sct where concept is-a #277565005 // "Radiology marker"
* exclude codes from system $sct where concept is-a #706243002 // "Radiology table"
* exclude codes from system $sct where concept is-a #706248006 // "X-ray film processor"
* exclude codes from system $sct where concept is-a #706253001 // "Radiation protection/limiting device"
* exclude codes from system $sct where concept is-a #706264003 // "Radiological quality assurance device"
* exclude codes from system $sct where concept is-a #706295005 // "Radiographic grid"
* exclude codes from system $sct where concept is-a #706342009 // "Phantom"
* exclude $sct#65577000 // "X-ray shield"
* exclude $sct#463220000 // "Radionuclide source, quality assurance"
* exclude $sct#463328005 // "Orthopaedic x-ray ruler"
* exclude $sct#463406009 // "Radiographic film view box magazine"
* exclude $sct#466221008 // "X-ray film magnifying glass"
* exclude $sct#466228002 // "X-ray film ruler"
* exclude $sct#466303007 // "X-ray film changing system receiving magazine"
* exclude $sct#466386002 // "X-ray system compression device, abdominal"
* exclude $sct#466420007 // "X-ray film storage unit"
* exclude $sct#466461007 // "X-ray film minifier"
* exclude $sct#466489005 // "X-ray film changing system loading magazine"
* exclude $sct#466594008 // "X-ray film framer"
* exclude $sct#466601001 // "X-ray film subtraction unit"
* exclude $sct#466626005 // "X-ray film storage envelope"
* exclude $sct#466663001 // "X-ray film duplicator, diagnostic imaging"
* exclude $sct#466693007 // "X-ray film processor quality control monitor"
* exclude $sct#466716009 // "X-ray film dryer"
* exclude $sct#466780005 // "X-ray film pass box cabinet"
* exclude $sct#466857007 // "X-ray film processor loader"
* exclude $sct#467022000 // "X-ray film processor tester"
* exclude $sct#467023005 // "X-ray film processor thermostat"
* exclude $sct#467346003 // "Darkroom film bin, diagnostic imaging"
* exclude $sct#467400002 // "Contrast medium injection system control unit"
* exclude $sct#467751007 // "Cine film processor, automatic"
* exclude $sct#469402002 // "Mammographic x-ray system compression device"

Mapping: DicomToDeviceEuImaging
Source: DeviceEuImaging
Target: "http://nema.org/dicom"
Title: "Mapping from DICOM to Imaging Device"
Description: "Mapping from DICOM to Imaging Device."
* identifier -> "DeviceUID (0018,1002), (0018,1003) Device ID"
* version -> "Software Versions (0018,1020)"
* type -> "ManufacturerDeviceClassUID (0018,1008) | Modality (0008,0060)"
{{R4}}* deviceName -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
{{R5}}* name -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* udiCarrier.deviceIdentifier -> "UniqueDeviceIdentifier (0018,1009)"
* manufacturer -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* serialNumber -> "(0018,1000) Device Serial Number"
