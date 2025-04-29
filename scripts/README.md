
# XtEHR scripts

## Scope

This directory contains a set of scripts used to manage the mapping to XtEHR and the derivative assets such as:
* ConceptMaps
* ConceptMap intro's
* Obligations
* Narrative requirements in Composition.

## Update XtEHR mapping

The XtEHR source files are stored in XtEHR-models. This section explains the process to generate the input spreadsheet for mapping

### Download and extract logical model

Updating these files is done using following process:

Enter source directory:
> cd XtEHR-models

Download model files:
> wget  http://build.fhir.org/ig/Xt-EHR/xt-ehr-common/definitions.json.zip

Unzip file
> unzip definitions.json.zip

### Create xtehr-model.csv file

In the `scripts` directory run:
> node parseLogicalModels.js XtEHR-models xtehr-model.csv

This will store the data of the source model in xtehr-model.csv.

### Edit mapping

The content of `xtehr-mode.csv` is copied into `xtehr-model-mapping.ods`. If this an update, copy it into a new tab and align the existing content with the new model, remove the old tab.
This is the master file for the mapping and is read when generating the result files.

## Update the mapping related fields in the IG

Edit the mappings defined in the file `extehr-mode-mapping.ods`.

First open `extehr-mode-mapping.ods` and save it as a tab-separated-file. How this is done depends on the tool used to edit the file. In linux environments the tool `ods2tsv` can be used:

> ods2tsv xtehr-model-mapping.ods > xtehr-model-mapping.tsv

### Run script

Run `xtehr-mapping.sh`, which will read the `xtehr-mode-mapping.tsv` file and generate the files in the input directory.

> ./xtehr-mapping.sh

### Test mapping

Run `sushi` to check the mapping.

> sushi ..
