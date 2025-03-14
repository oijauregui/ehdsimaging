Profile: ImKeyImagesSelectionProvider
Parent: ImKeyImagesSelection
Id: im-keyimages-imaging-selection-provider
Title: "Key images represented as an ImagingSelection (ImProvider)"
Description: "Requirements for the provider of the key images selection."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* extension[title]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* extension[description]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* bodySite 0..1
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* performer[performer]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* performer[device]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )


Profile: ImKeyImagesSelection
Parent: ImImagingSelection
Id: im-keyimages-imaging-selection
Title: "Key images represented as an ImagingSelection"
* insert SetFmmAndStatusRule( 1, draft )

* extension contains 
    $artifact-title-url        named title 0..1 and
    $artifact-description-url  named description 0..1
* extension[title]
  * extension[description]
  
* bodySite 0..1
  
* performer
  * insert SliceElement( #type, actor )
* performer contains performer 0..1 and device 0..1
* performer[performer]
  * actor only Reference( ImPerformer )
* performer[device]
  * actor only Reference( ImImagingDevice )
