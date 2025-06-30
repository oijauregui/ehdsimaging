Profile: ImKeyImageImagingSelection
Parent: ImImagingSelection
Title: "Key images represented as an ImagingSelection for R4"
Description: "Key images represented as an ImagingSelection for R4"
* insert SetFmmAndStatusRule( 1, draft )

* extension contains 
    $artifact-title-url        named title 0..1 and
    $artifact-description-url  named description 0..1

{% if isR5 %}
* performer
  * insert SliceElement( #type, actor )
* performer contains performer 0..1 and device 0..1
* performer[performer]
  * actor only Reference( $EuPractitionerRole )
* performer[device]
  * actor only Reference( ImImagingDevice )
{% endif %}

{% if isR4 %}

* extension[imagingSelection].extension ^slicing.discriminator[1].type = #type
* extension[imagingSelection].extension ^slicing.discriminator[=].path = "extension.value"

* extension[imagingSelection].extension[performer] contains practitioner 0..1 and device 0..1

// TBD
// Sushi cannot handle cv extrensions, topic followed here https://chat.fhir.org/#narrow/channel/179166-implementers/topic/Re-slicing.20complex.20extension/with/524849550
// * extension[imagingSelection].extension[performer][practitioner].extension[actor].value[x] only Reference( EuPractitionerRole )
// * extension[imagingSelection].extension[performer][device].extension[function].value[x] only Reference( ImImagingDevice )
{% endif %}