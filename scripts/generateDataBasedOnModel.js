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
    srcDescription: 4,
    srcType: 5,
    srcReq:7,
    tgtResource: 8,
    tgtElement: 9,
    tgtEquivalence: 10,
    tgtRationale: 11,
    tgtRefType: 12,
    includeAsWell: 13,
    tgtModeling: 14,
    actors: 16,
    section: 17,
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
// function generateCodeSystem(parsedData, srcResources) {
//     srcResources.forEach(srcResource => {

//         const codesystemfile = `${conceptMapDir}/XtEhrCodeSystem.fsh`;
//         console.log(codesystemfile);
//         const writable = fs.createWriteStream(codesystemfile);
//         writable.write(`////////////////////////////////////////////////////\n`);
//         writable.write(`// Generated file. Do not edit.\n`);
//         writable.write(`////////////////////////////////////////////////////\n`);
//         writable.write(`\n`);
//         writable.write(`Instance: XtEhrCodeSystem\n`);
//         writable.write(`InstanceOf: CodeSystem\n`);
//         writable.write(`Title: "XtEhrCodeSystem"\n`);
//         writable.write(`Description: """CodeSystem with all XtEHR fields"""\n`);
//         writable.write(`* ^experimental = true\n`);
//         writable.write(`* ^status = #draft\n`);
//         writable.write(`* ^caseSensitive = true\n`);
//         writable.write(`* ^hierarchyMeaning = #is-a\n`);

//         parsedData.forEach(row => {
//             const codes = new Set();
//             if ( row[indices.srcResource] && row[indices.srcResource].startsWith('EHDS') && row[indices.srcField].length > 0 ) {
//                 const code = `${row[indices.srcResource]}.${row[indices.srcField].trim()}`;
//                 const display = row[indices.srcDescription].trim();
//                 const description = `${display}`;
//                 codes.add( `* #${code} "${display}"  "${description}"\n`); 
//             }
//             codes.forEach(code => {
//                 writable.write(code);
//             });
//         });

//         writable.write(`\n`);
//         writable.write(`////////////////////////////////////////////////////\n`);
//         writable.end();
//     });
//     srcResources.forEach(srcResource => {
//             const conceptMapPath = `${conceptMapDir}/ValueSet_${srcResource}.fsh`;
//             console.log(conceptMapPath);
//             const writable = fs.createWriteStream(conceptMapPath);

//             writable.write(`////////////////////////////////////////////////////\n`);
//             writable.write(`// Generated file. Do not edit.\n`);
//             writable.write(`////////////////////////////////////////////////////\n`);
//             writable.write(`\n`);
//             writable.write(`ValueSet: ${srcResource}Vs\n`);
//             writable.write(`Title: "VS for ${srcResource}"\n`);
//             writable.write(`Description: "VS for ${srcResource}"\n`);
//             writable.write(`\n`);
//             writable.write(`* ^experimental = true\n`);
//             writable.write(`* ^status = #draft\n`);

//             codes = new Set();
//             parsedData.forEach(row => {
//                 if ( row[indices.srcResource] === srcResource && row[indices.srcField].length > 0 ) {
//                     const code = `${row[indices.srcResource]}.${row[indices.srcField].trim()}`;
//                     const display = row[indices.srcDescription].trim();
//                     const description = `${display}`;
//                     codes.add( `* XtEhrCodeSystem#${code} \n`);
//                 }
//             });
//             codes.forEach(code => {
//                 writable.write(code);
//             });                
//             writable.write(`\n`);
//             writable.write(`////////////////////////////////////////////////////\n`);
//             writable.end();
//     });

// }

function generateConceptMapFiles(parsedData, srcResources) {
    srcResources.forEach(srcResource => {
        const tgtResources = new Set(
            parsedData.filter(row => row[indices.srcResource] === srcResource)
                      .filter(row => row[indices.tgtResource].length > 0)
                      .map(row => row[indices.tgtResource])
        );
        const srcFields = new Set( 
            parsedData.filter(row => row[indices.srcResource] === srcResource)
                      .filter(row => row[indices.srcField].length > 0)
                      .map(row => row[indices.srcField])
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
                elementCodes.forEach(code => srcFields.delete(code));

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
                        writable.write(`    * noMap = true\n`); // TODO not sure this is correct
                    }
        
                                
                    targets.forEach((value, key) => {
                        const comment = value[indices.tgtRationale];
                        const srcReq  = value[indices.srcReq];
                        const tgtField = value[indices.tgtElement];
                        writable.write(`    * target[+]\n`);
                        writable.write(`      * code = #${tgtField}\n`);
                        if (comment.length > 0) {
                            writable.write(`      * comment = "${comment}"\n`);
                        }
                        if (srcReq.length > 0) {
                            writable.write(`      * display = "${srcReq}"\n`);
                        }
                        writable.write(`      * relationship = ${getEquivalence(value[indices.tgtEquivalence])}\n`);
                    });
                });
            });
            // add entries for missed fields
            if ( srcFields.size > 0 ) {
                writable.write(`* group[+]\n`);
                writable.write(`  * source = "${XtEHRBaseUrl}${srcResource}"\n`);
                srcFields.forEach(code => {
                    console.log(`No mapping for ${srcResource}.${code}`);
                    const rows = parsedData
                        .filter( row => row[indices.srcResource] === srcResource && row[indices.srcField] === code );
                    const comment = rows.length > 0 ? rows[0][indices.tgtRationale] : undefined;
                    const display = rows.length > 0 ? rows[0][indices.srcReq] : undefined;
                    const modelling = rows.length > 0 ? rows[0][indices.tgtModeling] : undefined;
                    writable.write(`  * element[+]\n`);
                    writable.write(`    * code = #${code}\n`);
                    writable.write(`    * noMap = true\n`);
                    let str = 
                        `${comment}${comment.length>0?' - '+modelling:modelling} ${display.length>0?"("+display+")":''} `.replace(/\s+/g, ' ').trim();
                    if (str.length > 0 ) {
                        writable.write(`    * display = "${str}"\n`);
                    }
                });
            }
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
            // XtEHR model
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
                    refResources
                        .filter(refResource => refResource !== '-' )
                        .forEach(refResource => {
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
  
  writeActorObligationFiles( parsedData, manifestObligationResources, 'Manifest', 'M');  
  writeActorObligationFiles( parsedData, reportObligationResources, 'Report', 'R');  
  
}

function writeActorObligationFiles( parsedData, obligationResources, actor, actorCode ) {
    function getShallPopulateObligations( parsedData, resourceUrl, actorCode ) {
        const shallPopulateObligations = new Set();
  
        parsedData
            .filter(row => row[indices.tgtResource] === resourceUrl )
            .filter(row => row[indices.tgtElement])
            .filter(row => row[indices.actors] )
            .filter(row => row[indices.actors].includes( actorCode ) )
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
        return shallPopulateObligations;
    }

    function getShallHandleCorrectlyObligations( parsedData, resourceUrl, actorCode ) {
        const shallHandleCorrectlyObligations = new Set(parsedData
            .filter(row => row[indices.tgtResource] === resourceUrl)
            .filter(row => row[indices.tgtElement])
            .filter(row => row[indices.tgtElement].length > 0)
            .filter(row => row[indices.srcResource].length == 0)
            .filter(r => r[indices.actors] )
            .filter(r => r[indices.actors].includes( actorCode ) )
            .map(row => row[indices.tgtElement])
        );
        return shallHandleCorrectlyObligations;
    }

    obligationResources.forEach( (resourceName, resourceUrl, index) => {
        const shallPopulateObligations = getShallPopulateObligations( parsedData, resourceUrl, actorCode );
        
        const shallHandleCorrectlyObligations = getShallHandleCorrectlyObligations( parsedData, resourceUrl,actorCode );

        const onlyMentioned = parsedData
            .filter(row => row[indices.tgtResource] === resourceUrl )
            .filter(row => !row[indices.tgtElement] || row[indices.tgtElement].length == 0)
        ;

        const includeAsWell = new Set( parsedData
            .filter(row => row[indices.tgtResource] === resourceUrl )
            .filter(row => row[indices.includeAsWell] && row[indices.includeAsWell].length > 0)
            .map(row => row[indices.includeAsWell])
        );
        
        includeAsWell.forEach( asWell => {
            const shallHandleCorrectlyObligationsAsWell = getShallHandleCorrectlyObligations( parsedData, asWell, actorCode );
            const shallPopulateObligationsAsWell =    getShallPopulateObligations( parsedData, asWell, actorCode );
            
            shallHandleCorrectlyObligationsAsWell.forEach( obligation => {
                shallHandleCorrectlyObligations.add(obligation);
            });
            shallPopulateObligationsAsWell.forEach( obligation => {
                shallPopulateObligations.add(obligation);
            });     
         });

        const allObligations = new Set([...shallPopulateObligations, ...shallHandleCorrectlyObligations]);  
  
        if ( onlyMentioned.length > 0 || allObligations.size > 0) {  
            const obligationPath = `${obligationsDir}/${actor}_${resourceName}.fsh`;
            console.log(obligationPath);
            const writable = fs.createWriteStream(obligationPath);
  
            writable.write(`////////////////////////////////////////////////////\n`);
            writable.write(`// Generated file. Do not edit.\n`);
            writable.write(`////////////////////////////////////////////////////\n`);
  
            writable.write(`Profile: ${actor}_${resourceName}\n`);
            writable.write(`Parent: ${resourceUrl.startsWith("Im")?resourceUrl:'$'+resourceUrl}\n`);
            writable.write(`Id: ${actor}-${resourceName}\n`);
            writable.write(`Title: "${actor} obligations for ${resourceName}"\n`);
            writable.write(`Description: "${actor} obligations for ${resourceName}"\n`);
  
            allObligations.forEach(obligation => {
                const rows = parsedData
                    .filter(row => row[indices.tgtResource] === resourceUrl )
                    .filter(row => row[indices.tgtElement] === obligation )
                ;
                let documentationSet = new Set( rows
                    .map(row => `${row[indices.srcResource]}.${row[indices.srcField]}`)
                    .filter(row => row.length > 0) )
                let documentation = Array.from(documentationSet)
                    .join(', ')
                ;
                documentation = documentation.length > 0 ? documentation : '-';
                writable.write(`* ${obligation}\n`);
                if (shallHandleCorrectlyObligations.has(obligation)) {
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:handle\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(Im${actor}Provider)\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "${documentation}"\n`);
                } else if (shallPopulateObligations.has(obligation)) {
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(Im${actor}Provider)\n`);
                    writable.write(`  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "${documentation}"\n`);
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

function generateSectionTablesMarkdown(parsedData) {
    // Create a map to organize data by sections
    const sectionMap = new Map();

    // Filter data to only include rows with section information
    const rowsWithSections = parsedData
        .filter(row => row[indices.section]?.trim().length > 0)
        .filter(row => row[indices.section]?.trim() !== "Section") // Exclude the header row
        .filter(row => row[indices.tgtResource]?.trim().length > 0)
        .filter(row => row[indices.tgtElement]?.trim().length > 0)
        .filter(row => row[indices.tgtRefType]?.trim().length > 0);

    console.log(`Found ${rowsWithSections.length} rows with section information`);

    // Process each row, now handling multiple sections per row
    rowsWithSections.forEach(row => {
        // Split the section value by comma and process each section
        const sectionValues = row[indices.section].split(',').map(s => s.trim());
        const tgtResource = row[indices.tgtResource].trim();
        const tgtElement = row[indices.tgtElement].trim();
        const srcResource = row[indices.srcResource] ? row[indices.srcResource].trim() : "";
        const srcField = row[indices.srcField] ? row[indices.srcField].trim() : "";
        const tgtRefType = row[indices.tgtRefType] ? row[indices.tgtRefType].trim() : "";

        console.log(`Processing resource: ${tgtResource}, element: ${tgtElement} for sections: ${sectionValues.join(', ')}`);

        // Add this row to each section it belongs to
        sectionValues
            .forEach(section => {
            if (section && section.length > 0) {
                if (!sectionMap.has(section)) {
                    sectionMap.set(section, []);
                }

                // Check if this resource/element pair already exists in this section
                const entries = sectionMap.get(section);
                const exists = entries.some(entry => 
                    entry.resource === tgtResource && entry.element === tgtElement
                );

                if (!exists) {
                    entries.push({
                        resource: tgtResource,
                        element: tgtElement,
                        srcResource: srcResource,
                        srcField: srcField,
                        tgtRefType: tgtRefType
                    });
                }
            }
        });
    });

    console.log(`Section map has ${sectionMap.size} sections`);

    // Generate the markdown file
    const outputPath = '../input/intro-notes/StructureDefinition-Report-ImComposition-intro.md';
    const writable = fs.createWriteStream(outputPath);

    // Write file header - preserve existing content from the original file
    writable.write('{% include variable-definitions.md %}\n');
    writable.write('For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.\n\n');
    writable.write('The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.\n\n');
    writable.write('NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [ImComposition](StructureDefinition-ImComposition.html), which is the parent type of this Report-ImComposition profile.\n\n');

    // Define custom section order
    const sectionOrder = [
        'Imaging Study',
        'Order',
        'History',
        'Procedure',
        'Comparison',
        'Findings',
        'Impression',
        'Recommendation'
    ];

    // Filter out sections that should be excluded (like "Section")
    const sectionsToExclude = ['Section'];

    // Get all sections and exclude those in the exclude list
    const availableSections = Array.from(sectionMap.keys())
        .filter(section => !sectionsToExclude.includes(section));

    // First add sections in the specified order (if they exist)
    const orderedSections = [];
    sectionOrder.forEach(orderedSection => {
        if (sectionMap.has(orderedSection)) {
            orderedSections.push(orderedSection);
        }
    });

    // Then add any remaining sections that weren't in the specified order
    availableSections.forEach(section => {
        if (!orderedSections.includes(section)) {
            orderedSections.push(section);
        }
    });

    console.log(`Ordered sections: ${orderedSections.join(', ')}`);

    // Generate tables for each section
    if (orderedSections.length > 0) {
        writable.write('## Elements to include in sections narratives\n\n');
        orderedSections.forEach(section => {
            writable.write(`### ${section}\n\n`);
            writable.write(`The following table lists the elements that should be included in the narrative of the ${section} section.\n\n`);
            writable.write(`{:.grid}\n`);
            writable.write(`| First order resource | Element | Referenced resource | Logical model resource.field |\n`);
            writable.write('| -------- | ------- | -------------- | --------------------- |\n');

            const entries = sectionMap.get(section);
            entries.forEach(entry => {
                writable.write(`| ${entry.resource} | ${entry.element} | ${entry.tgtRefType} | ${entry.srcResource}.${entry.srcField} |\n`);
            });

            writable.write('\n');
        });
    } else {
        console.log('Warning: No sections found to create tables');
    }

    writable.end();
    console.log(`Generated section tables in ${outputPath}`);
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
        
        generateSectionTablesMarkdown(parsedData);

        // generateCodeSystem(parsedData, srcResources);
    });
}

// Helper function to map equivalence codes
function getEquivalence(code) {
    switch (code) {
        case "EQ": return "#equivalent";
        case "SB": return "#source-is-broader-than-target";
        case "TB": return "#source-is-narrower-than-target";
        case "RT": return "#related-to";
        default: return "#related-to";
    }
}


// Execute the main function
if (require.main === module) {
    main();
}