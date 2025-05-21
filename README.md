# README

This document provides an overview of the tooling used to preprocess IG source files (`.fsh` and `sushi-config.yaml`) from the `IG-base` directory and generate FHIR-version-specific IGs under the `igs` directory. The process utilizes **Liquid tags** to insert version-specific content into the appropriate folders.

## Key Features

- **Dynamic Content Placement**: Supports the use of Liquid tags (e.g., `{{R5}}`, `{% if isR4 %} ... {% endif %}`) for version-specific content.
- **Organized Output**: Files are organized by FHIR version (e.g., `igs/r4`, `igs/r5`).
- **Reference Files**: `context-Rx.json` lists available Liquid tags for use in templates.

## Usage Examples

- Use `{{R5}}` to include content only in R5-specific files.
- Use `{% if isR4 %} ... {% endif %}` to include multi-line content only in R4-specific files.

For a complete list of available Liquid tags, refer to the `context-Rx.json` file.