Profile: ImImagingDevice
Parent: Device
Title: "Im Imaging Device"
Description: """The device the made the image."""	
* insert SetFmmAndStatusRule( 1, draft )
* insert PartOfImagingManifest
* status 1..1
* category 
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $SCT#314789007 "Diagnostic imaging equipment"

* type from ImImagingDeviceType (extensible)


ValueSet: ImImagingDeviceType
Id: im-imaging-device-type
Title: "Imaging Device Type"
Description: "Imaging Device Type."
* include codes from system $SCT where concept is-a #314789007 "Diagnostic imaging equipment"

Mapping: DicomToImImagingDevice
Source: ImImagingDevice
Target: "http://nema.org/dicom"
Id: dicom-2-im-imaging-device-mapping
Title: "Mapping from DICOM to Imaging Device"
Description: "Mapping from DICOM to Imaging Device."
* identifier -> "DeviceUID (0018,1002), (0018,1003) Device ID"
* version -> "Software Versions (0018,1020)"
* type -> "ManufacturerDeviceClassUID (0018,1008) | Modality (0008,0060)"
* name -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* udiCarrier.deviceIdentifier -> "UniqueDeviceIdentifier (0018,1009)"
* manufacturer -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* serialNumber -> "(0018,1000) Device Serial Number"
