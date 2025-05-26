Profile: ImImagingDevice
Parent: Device
Title: "Im Imaging Device"
Description: """The device the made the image."""	
* insert SetFmmAndStatusRule( 1, draft )
* status 1..1

{% if isR5 %}
* category 
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $sct#314789007 "Diagnostic imaging equipment"

* type from ImImagingDeviceType (extensible)
{% endif %}

{% if isR4 %}
* extension contains
  $cvDevice-category named category 0..*

* extension
  * insert AddDiscriminator( value, value )
  
* extension[category] contains imaging 1..1
* extension[category][imaging].value[x] = $sct#314789007 "Diagnostic imaging equipment"
{% endif %}


ValueSet: ImImagingDeviceType
Id: im-imaging-device-type
Title: "Imaging Device Type"
Description: "Imaging Device Type."
* insert SNOMEDCopyrightForVS
* ^experimental = false
* include codes from system $sct where concept is-a #314789007 "Diagnostic imaging equipment"

Mapping: DicomToImImagingDevice
Source: ImImagingDevice
Target: "http://nema.org/dicom"
Id: dicom-2-im-imaging-device-mapping
Title: "Mapping from DICOM to Imaging Device"
Description: "Mapping from DICOM to Imaging Device."
* identifier -> "DeviceUID (0018,1002), (0018,1003) Device ID"
* version -> "Software Versions (0018,1020)"
* type -> "ManufacturerDeviceClassUID (0018,1008) | Modality (0008,0060)"
{{R5}}* name -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
{{R4}}* deviceName -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* udiCarrier.deviceIdentifier -> "UniqueDeviceIdentifier (0018,1009)"
* manufacturer -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* serialNumber -> "(0018,1000) Device Serial Number"