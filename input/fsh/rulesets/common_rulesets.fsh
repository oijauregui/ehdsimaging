RuleSet: SetFmmAndStatusRule ( fmm, status )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.html#EU "Europe"


RuleSet: ExtensionContext(path)
// copied by mCode
* ^context[+].type = #element
* ^context[=].expression = "{path}"

RuleSet: ElementMapping( code, display, targetCode, targetDisplay, relationship )
* element[+]
  * code = {code}
  * display = {display}
  * target 
    * code = {targetCode}
    * display = {targetDisplay}
    * relationship = {relationship}

RuleSet: SliceElement( type, path )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.ordered = false

RuleSet: SliceElementWithDescription( type, path, description )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.description = "{description}"
* ^slicing.ordered = false

RuleSet: PartOfImagingManifest
* ^meta.tag = #imaging-manifest

RuleSet: PartOfImagingReport
* ^meta.tag = #imaging-report