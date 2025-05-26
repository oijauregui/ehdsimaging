{% if isR5 %}
Profile: ImImagingSelection
Parent: ImagingSelection
Title: "Imaging Selection"
Description: "Imaging Selection"
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference( $EuPatient )

* derivedFrom 1..*
  * insert SliceElement( #profile, $this )
* derivedFrom contains study 1..1
* derivedFrom[study] only Reference( ImImagingStudy )

Profile: ImSrInstanceImagingSelection
Parent: ImImagingSelection
Title: "Imaging Selection referring to a DICOM SR instance"
Description: "Imaging Selection referring to a DICOM SR instance"
* insert SetFmmAndStatusRule( 1, draft )
* identifier 1..*
  * insert SliceElement( #value, type )
* identifier contains sopInstanceUid 1..1
* identifier[sopInstanceUid] only ImSopInstanceUidIdentifier

* studyUid 1..1
* seriesUid 1..1
* instance 1..1
  * uid 1..1
  * subset 0..0
  * imageRegion2D 0..0
  * imageRegion3D 0..0

{% endif %}

{% if isR4 %}
Profile: ImImagingSelection
Parent: Basic
Title: "Imaging Selection profile for R4"
Description: "Imaging Selection profile for R4"
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference( $EuPatient )
* extension contains
  $cvImagingSelection named imagingSelection 1..1
  * insert AddDiscriminator ( value, extension.value )
* extension[imagingSelection] contains study 1..1
* extension[imagingSelection][study].extension[derivedFrom].value[x] only Reference(ImImagingStudy)

Profile: ImSrInstanceImagingSelection
Parent: ImImagingSelection
Title: "Imaging Selection referring to a DICOM SR instance for R4"
Description: "Imaging Selection referring to a DICOM SR instance for R4"
* insert SetFmmAndStatusRule( 1, draft )
* identifier 1..*
  * insert SliceElement( #value, type )
* identifier contains sopInstanceUid 1..1
* identifier[sopInstanceUid] only ImSopInstanceUidIdentifier
* extension[imagingSelection].extension[studyUid].value[x] 1..1
* extension[imagingSelection].extension[seriesUid].value[x] 1..1
* extension[imagingSelection].extension[instance] 1..1
* extension[imagingSelection].extension[instance].extension[uid].value[x] 1..1
* extension[imagingSelection].extension[instance].extension[subset].value[x] 0..0
* extension[imagingSelection].extension[instance].extension[imageRegion2D] 0..0
* extension[imagingSelection].extension[instance].extension[imageRegion3D] 0..0

{% endif %}

