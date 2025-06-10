Profile: ImKeyImageImagingSelection
Parent: ImImagingSelection
Title: "Key images represented as an ImagingSelection for R4"
Description: "Key images represented as an ImagingSelection for R4"
* insert SetFmmAndStatusRule( 1, draft )

* extension contains 
    $artifact-title-url        named title 0..1 and
    $artifact-description-url  named description 0..1



// 
// * extension
// * insert AddDiscriminator ( value, extension.extension.value )

// * extension[imagingSelection].extension[performer] contains practitioner 0..1 and device 0..1


// * extension[imagingSelection].extension[performer][practitioner].extension[actor].value[x] only Reference( EuPractitionerRole )
// * extension[imagingSelection].extension[performer][practitioner].extension[device].value[x] only Reference( ImImagingDevice )
// 
