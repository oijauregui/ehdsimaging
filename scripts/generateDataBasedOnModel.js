const fs = require('fs');
const path = require('path');

const obligationsDir = '../input/fsh/obligations';	
const conceptMapDir = '../input/fsh/xtehr-model-maps';	
const xtehrDir = '../input/resources';	
const conceptMapIntroDir = '../input/intro-notes';	

// Indices for relevant columns
const indices = {
    srcResource: 1,
    srcField: 2,
    srcType: 5,
    tgtResource: 8,
    tgtElement: 9,
    tgtEquivalence: 10,
    tgtRationale: 11,
    tgtRefType: 12,
    actors: 15,
};

const XtEHRBaseUrl = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/";

function extractAndCopyResources(parsedData, srcResources ) {
    // Extract unique source resources
    

    // Copy XtEHR resources
    const srcModel = new Set(
    parsedData
        .filter(row => row[indices.srcResource]?.startsWith('EHDS'))
        .filter(row => row[indices.tgtResource]?.length > 0)
        .map(row => row[indices.srcResource])
    );
    srcModel.forEach(srcResource => {
    console.log(`XtEHR-models/StructureDefinition-${srcResource}.json -> ${xtehrDir}/StructureDefinition-${srcResource}.json`);
    fs.copyFile(
        `XtEHR-models/StructureDefinition-${srcResource}.json`,
        `${xtehrDir}/StructureDefinition-${srcResource}.json`,
        (err) => {}
    );
    });
}

function generateConceptMapFiles(parsedData, srcResources) {
    srcResources.forEach(srcResource => {
        const tgtResources = new Set(
            parsedData.filter(row => row[indices.srcResource] === srcResource)
                      .filter(row => row[indices.tgtResource].length > 0)
                      .map(row => row[indices.tgtResource])
        );
        if (tgtResources.size > 0) {
            const conceptMapPath = `${conceptMapDir}/ConceptMap_${srcResource}.fsh`;
            console.log(conceptMapPath);
            const writable = fs.createWriteStream(conceptMapPath);

            writable.write(`////////////////////////////////////////////////////\n`);
            writable.write(`// Generated file. Do not edit.\n`);
            writable.write(`////////////////////////////////////////////////////\n`);
            writable.write(`\n`);
            writable.write(`Instance: ${srcResource}Map\n`);
            writable.write(`InstanceOf: ConceptMap\n`);
            writable.write(`Usage: #definition\n`);
            writable.write(`Title: "Map for ${srcResource}"\n`);
            writable.write(`Description: "Map for ${srcResource}"\n`);
            writable.write(`* status = #draft\n`);
            writable.write(`* experimental = true\n`);
            writable.write(`* title = "${srcResource} Mapping"\n`);
            writable.write(`* name = "${srcResource}Map"\n`);
            writable.write(`* sourceScopeUri = "${XtEHRBaseUrl}${srcResource}"\n`);

            tgtResources.forEach(tgtResource => {
                
                writable.write(`* group[+]\n`);
                writable.write(`  * source = "${XtEHRBaseUrl}${srcResource}"\n`);
                writable.write(`  * target = $${tgtResource}Url\n`);

                const elementCodes = new Set(
                    parsedData
                        .filter(row => row[indices.srcResource] === srcResource && row[indices.tgtResource] === tgtResource)
                        .map(row => row[indices.srcField].trim())
                        .filter(code => code.length > 0)
                );

                if ( elementCodes.size == 0 ) {
                    writable.write(`  * element[+]\n`);
                    writable.write(`    * noMap = true\n`);
                }

                elementCodes.forEach(code => {
                    writable.write(`  * element[+]\n`);
                    writable.write(`    * code = #${code}\n`);

                    const targets = new Map();
                    parsedData
                        .filter(row => row[indices.srcResource] === srcResource && row[indices.tgtResource] === tgtResource)
                        .filter(row => row[indices.srcField].trim() === code.trim())
                        .filter(row => row[indices.srcField].trim().length > 0 )
                        .filter(row => row[indices.tgtElement].trim().length > 0 )
                        .forEach(row => {
                            const comment = row[indices.tgtRationale];
                            const tgtField = row[indices.tgtElement];
                            if (code) {
                                targets.set(
                                    `${tgtField}-${comment}-${getEquivalence(row[indices.tgtEquivalence])}`,
                                    row
                                );
                            }
                        });

                    if ( targets.size == 0 ) {
                        writable.write(`    * noMap = true\n`);
                    }
        
                                
                    targets.forEach((value, key) => {
                        const comment = value[indices.tgtRationale];
                        const tgtField = value[indices.tgtElement];
                        writable.write(`    * target[+]\n`);
                        writable.write(`      * code = #${tgtField}\n`);
                        if (comment.length > 0) {
                            writable.write(`      * comment = "${comment}"\n`);
                        }
                        writable.write(`      * relationship = ${getEquivalence(value[indices.tgtEquivalence])}\n`);
                    });
                });
            });
            writable.write(`\n`);
            writable.write(`////////////////////////////////////////////////////\n`);
            writable.end();
        }
    });
}

// Generate intro files mermaid
function generateIntroFiles(parsedData, srcResources) {
    srcResources.forEach(srcResource => {
        const tgtResources = new Set();
        const srcFields = new Set();

        parsedData.forEach(row => {
            if (row[indices.srcResource] === srcResource) {
                if (row[indices.tgtResource] && row[indices.tgtResource].length > 0){   
                    tgtResources
                        .add(
                            row[indices.tgtResource]
                        );
                }
                if (row[indices.srcField]){
                    srcFields.add(row[indices.srcField]);
                }
            }
        });
        if (tgtResources.size > 0) {
            const conceptMapIntroPath = `${conceptMapIntroDir}/ConceptMap-${srcResource}Map-intro.md`;
            console.log(conceptMapIntroPath);
            const writable = fs.createWriteStream(conceptMapIntroPath);
            writable.write(`{% include variable-definitions.md %}\n\n`);
            writable.write(`The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.\n`);
            writable.write(`\n`);
            // mermaid
            writable.write('```mermaid\n');
            writable.write('classDiagram\n');
            writable.write('direction LR\n');
            writable.write(`class ${srcResource} {\n`);
            writable.write(`  <<XtEHR dataset>>\n`);
            srcFields.forEach(field => writable.write(`  ${field}\n`));
            writable.write(`}\n`);
            writable.write(`link ${srcResource} "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-${srcResource}.html"\n`);

            const linkedClasses = new Set();
            const linkRows = new Set();
            tgtResources.forEach(tgtResource => {
                const tgtFields = new Set(
                    parsedData
                        .filter(row => row[indices.srcResource] === srcResource && row[indices.tgtResource] === tgtResource)
                        .map(row => row[indices.tgtElement].trim())
                        .filter( field => field.length > 0 )
                );
                let tgtResourceClassName = tgtResource.substring(tgtResource.lastIndexOf('/') + 1);	

                writable.write(`class ${tgtResourceClassName}`);
                if (tgtFields.size > 0) {
                    writable.write(`{\n`);
                    writable.write(`  <<FHIR>>\n`);
                    tgtFields.forEach(field => {
                        let targetField = field.replace(new RegExp('\:','g'),'\\:')        
                        
                        writable.write(`  ${targetField}\n`)
                    } )
                    writable.write(`}\n`);
                }
                writable.write(`\n`);
                // writable.write(`link ${tgtResourceClassName} "./StructureDefinition-${tgtResourceClassName.html}"\n`);
                linkRows.add(`${srcResource} --> ${tgtResourceClassName}\n`);

                parsedData.forEach(row => {
                    if (row[indices.srcResource] === srcResource && row[indices.tgtResource] === tgtResource && row[indices.tgtRefType]) {
                    const refResources = row[indices.tgtRefType].split(',');
                    const referenceName = row[indices.tgtElement];
                    refResources.forEach(refResource => {
                        const refResourceClassName = refResource.substring(refResource.lastIndexOf('/') + 1);
                        linkedClasses.add(refResourceClassName);
                        linkRows.add(`${tgtResourceClassName} --> ${refResourceClassName} : ${referenceName}\n`);
                    });
                    }
                });
            });
            linkedClasses.forEach(linkedClass => {
                writable.write(`class ${linkedClass} {\n`);
                writable.write(`  <<FHIR>>\n`);
                writable.write(`}\n`);
            });
            linkRows.forEach(link => writable.write(link));
            writable.write("```\n");
            writable.write(`\n`);
            writable.end();
        }
    });
}

function generateObligationFiles(parsedData) {
  // Generate Obligations
  const reportObligationResources = new Map();
  const manifestObligationResources = new Map();
  parsedData
    .filter((row, index) => index > 0)
    .filter(row => row[indices.actors]) // only rows with actors
    .filter(row => row[indices.tgtResource]) // tgrResource must be defined
    .filter(row => row[indices.tgtResource].length > 0)
    .forEach(row => {
        if ( row[indices.actors] && row[indices.actors].includes('R') ) {
            reportObligationResources.set( row[indices.tgtResource], row[indices.tgtResource] );
        } 
        if ( row[indices.actors] && row[indices.actors].includes('M') ) {
            manifestObligationResources.set( row[indices.tgtResource], row[indices.tgtResource] );
        }
    });
  
  writeActorObligationFiles( parsedData, manifestObligationResources, 'Manifest');  
  writeActorObligationFiles( parsedData, reportObligationResources, 'Report');  
  
}

function writeActorObligationFiles( parsedData, obligationResources, actor) {
    obligationResources.forEach( (resourceName, resourceUrl, index) => {
        const shallPopulateObligations = new Set();
  
        parsedData
            .filter(row => row[indices.tgtResource] === resourceUrl )
            .filter(row => row[indices.tgtElement])
            .filter(row => row[indices.tgtElement].length > 0)
            .filter(row => row[indices.srcResource].length > 0)
            .forEach(row => { 
                shallPopulateObligations.add(row[indices.tgtElement])
                // if it has a type that exists in parseData and is not a reference, include sibling elements
                if (row[indices.srcType] && row[indices.srcType].length > 0 && row[indices.tgtRefType].length==0 ) {
                    const srcType = row[indices.srcType].trim();
                    let res = parsedData
                        .filter(r => r[indices.srcResource] === srcType)
                    res
                        .filter(r => r[indices.tgtElement])
                        .filter(r => r[indices.tgtElement].length > 0)
                        .forEach(r => {
                            shallPopulateObligations.add(row[indices.tgtElement] + '.' + r[indices.tgtElement]);
                        })
                }
        });
  
        const shallHandleCorrectlyObligations = new Set(parsedData
            .filter(row => row[indices.tgtResource] === resourceUrl)
            .filter(row => row[indices.tgtElement])
            .filter(row => row[indices.tgtElement].length > 0)
            .filter(row => row[indices.srcResource].length == 0)
            .map(row => row[indices.tgtElement])
        );
        const allObligations = new Set([...shallPopulateObligations, ...shallHandleCorrectlyObligations]);  
  
        if (allObligations.size > 0) {  
            const obligationPath = `${obligationsDir}/Obligation_${actor}_${resourceName}.fsh`;
            console.log(obligationPath);
            const writable = fs.createWriteStream(obligationPath);
  
            writable.write(`////////////////////////////////////////////////////\n`);
            writable.write(`// Generated file. Do not edit.\n`);
            writable.write(`////////////////////////////////////////////////////\n`);
  
            writable.write(`Profile: ${actor}ProducerObligation${resourceName}\n`);
            writable.write(`Parent: ${resourceUrl.startsWith("Im")?resourceUrl:'$'+resourceUrl}\n`);
            writable.write(`Title: "${actor}Producer obligation for ${resourceName}"\n`);
            writable.write(`Description: "${actor}Producer obligations for ${resourceName}"\n`);
  
            allObligations.forEach(obligation => {
                writable.write(`* ${obligation}\n`);
                if (shallHandleCorrectlyObligations.has(obligation)) {
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:handle-correctly\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)\n`);
                } else if (shallPopulateObligations.has(obligation)) {
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)\n`);
                }
            });
  
            // if (shallHandleCorrectlyObligations.size > 0) {  
            // writable.write(`\n`);
            // writable.write(`Profile: ConsumerObligation${resourceName}\n`);
            // writable.write(`Parent: ${resourceUrl}\n`);
            // writable.write(`Title: "Consumer obligation for ${resourceName}"\n`);
            // writable.write(`Description: "Consumer obligations for ${resourceName}"\n`);
  
            // shallHandleCorrectlyObligations.forEach(obligation => {
            //     writable.write(`* ${obligation}\n`);
            //     writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:handle-correctly\n`);
            //     writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)\n`);
            // });
            // }
            // writable.write(`\n`);
            // writable.write(`////////////////////////////////////////////////////\n`);
            // writable.end();
        }
    });
}

function main() {
    const filePath = path.join(__dirname, 'xtehr-model-mapping.tsv');

    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading the file:', err);
            return;
        }

        const srcParsedData = data.split('\n').map(row => row.split('\t'));
        const parsedData = [];
        srcParsedData.forEach(
            row => {
                const newRow = [];
                row.forEach(
                    cell => {
                        newRow.push(cell.trim().replace( new RegExp('"','g'), ''));
                    }
                );
                parsedData.push(newRow);
            }
        );

        const srcResources = new Set(
            parsedData.filter(row => row[indices.srcResource]?.startsWith('EHDS')).map(row => row[1])
            );
        
        extractAndCopyResources(parsedData, srcResources);
        
        generateConceptMapFiles(parsedData, srcResources);
        
        
        generateIntroFiles(parsedData, srcResources);
        
        
        generateObligationFiles(parsedData);        
    });
}

// Helper function to map equivalence codes
function getEquivalence(code) {
    switch (code) {
        case "EQ": return "#equivalent";
        case "SB": return "#source-is-broader-than-target";
        case "TB": return "#source-is-narrower-than-target";
        default: return "#related-to";
    }
}


// Execute the main function
if (require.main === module) {
    main();
}