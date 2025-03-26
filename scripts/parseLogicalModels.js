const fs = require('fs');
const path = require('path');


// Function to read all structure definitions
function readStructureDefinitions(directory) {
    try {
        const files = fs.readdirSync(directory);
        const structures = [];

        files.forEach(file => {
            const filePath = path.join(directory, file);
            const stat = fs.statSync(filePath);

            if (stat.isDirectory()) {
                // Recursively read subdirectories
                structures.push(...readStructureDefinitions(filePath));
            } else if (file.endsWith('.json')) {
                // Read and parse JSON files
                const content = fs.readFileSync(filePath, 'utf8');
                try {
                    const json = JSON.parse(content);
                    structures.push({ file: filePath, definition: json });
                } catch (err) {
                    console.error(`Error parsing JSON in file: ${filePath}`, err);
                }
            }
        });

        return structures;
    } catch (err) {
        console.error(`Error reading directory: ${directory}`, err);
        return [];
    }
}

// Main execution
function main( ) {
    // Directory containing XtEHR-models   
    const modelsDir = path.join(__dirname, process.argv[2]?process.argv[2]:'XtEHR-models');
    const tgtFile = path.join(__dirname, process.argv[3]?process.argv[3]:'xtehr-model.csv');

    console.log( `Reading XtEHR-models from ${modelsDir} and writing to ${tgtFile}` );
    
    if (!fs.existsSync(modelsDir)) {
        console.error(`Directory not found: ${modelsDir}`);
        return;
    }

    let writable = fs.createWriteStream('xtehr-model.csv');
    const structures = readStructureDefinitions(modelsDir);
    console.log(`Writing ${structures.length} structure definitions to ${tgtFile}`);
    structures.forEach((structure, index) => {
        let extResource = structure.definition.name;
        console.log( extResource)
        let elements = structure.definition.snapshot && structure.definition.snapshot.element
            ? structure.definition.snapshot.element : [];
        elements.forEach(element => {
            let extField = element.id.substr(structure.definition.name.length+1);
            let types = element.type? element.type : [];
            if ( types.length === 0 ) { types.push({code: ''}) }
            let binding = element.binding
                ? `${element.binding.description} (${element.binding.strength})`
                : '';
            types.forEach(type => {
                // console.log(`${extResource}; ${extField}; ${element.min}..${element.max}; ${element.definition.replace(";",",")}; ${type.code.replace('https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/','')}; ${element.short.replace(";",",")} `);
                const definition = `${element.definition.replace(new RegExp(";","g"),',').replace(new RegExp('\t','g'),' ')}`;
                writable.write(`${extResource}; ${extField}; ${element.min}..${element.max}; ${definition}; ${type.code.replace('https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/','')}; ${binding}  ; ${element.short.replace(";",",")} `);
                writable.write('\n');
            });
        });
    });
    writable.write('\n');
    writable.end();
    console.log( 'DONE' )
}

main();