#!/bin/bash

versions=("4.0.1" "5.0.0")

for version in "${versions[@]}"; do
    if [ "$version" = "4.0.1" ]; then
        context_version="R4"
        build_dir="igs/r4"
    elif [ "$version" = "5.0.0" ]; then
        context_version="R5"
        build_dir="igs/r5"
    fi

    # Create version-specific directory if it doesn't exist
    mkdir -p "$build_dir/input/fsh"

    # Process sushi-config
    echo "Processing sushi-config.liquid.yaml for version $version"
    npx --yes liquidjs -t @"IG-base/sushi-config.liquid.yaml" --context @"context-${context_version}.json" > "sushi-config.yaml"
    cp sushi-config.yaml "$build_dir/sushi-config.yaml"
    rm sushi-config.yaml

    # Process ig.liquid.ini
    echo "Processing ig.liquid.ini for version $version"
    npx --yes liquidjs -t @"IG-base/ig.liquid.ini" --context @"context-${context_version}.json" > "ig.ini"
    cp ig.ini "$build_dir/ig.ini"
    rm ig.ini

    # Process all liquid FSH files
    find IG-base/input/fsh -type f -name "*.liquid.fsh" | while read file; do
        if [ -f "$file" ]; then
            relative_path=${file#IG-base/input/fsh/}
            dir_path=$(dirname "$relative_path")
            base_name=$(basename "$file")

            # Create directory structure if it doesn't exist
            mkdir -p "$build_dir/input/fsh/$dir_path"

            output_file="$build_dir/input/fsh/$dir_path/${base_name%.liquid.fsh}.fsh"

            # Process liquid template and inline version tags
            content=$(npx --yes liquidjs -t @"$file" --context @"context-${context_version}.json")
            echo "$content" > "$output_file"

            # Check if file was created
            if [ -f "$output_file" ]; then
                echo "Successfully created $output_file"
            else
                echo "Failed to create $output_file"
            fi
        fi
    done

    # Remove empty files
    find "$build_dir/input/fsh" -type f -name "*.fsh" -size 0 -delete

    echo "FSH files processed and moved to $build_dir/input/fsh/ for $version"

    # Copy all non-liquid files from IG-base directory
    echo "Copying non-liquid files from IG-base directory to $build_dir..."
    cd IG-base

    find input -type f ! -name "*.liquid.*" | while read file; do
        relative_path=${file#input/}
        mkdir -p "../$build_dir/input/$(dirname "$relative_path")"
        cp "$file" "../$build_dir/input/$relative_path"
    done

    cd ..

    # Copy top-level files from IG-base to build directory, excluding sushi-config.liquid.yaml
    echo "Copying top-level files from IG-base to $build_dir..."
    mkdir -p "$build_dir"
    find IG-base -maxdepth 1 -type f ! -name "sushi-config.liquid.yaml" | while read file; do
        cp "$file" "$build_dir/"
    done

    # Copy all top-level directories (except 'input') from IG-base to build directory
    for dir in IG-base/*/; do
        dir_name=$(basename "$dir")
        if [ "$dir_name" != "input" ]; then
            echo "Copying directory $dir_name to $build_dir..."
            cp -r "IG-base/$dir_name" "$build_dir/"
        fi
    done
done

# Remove old folders (moved from GitHub Actions workflow)
rm -rf ./igs/r4/input/fsh/obligations ./igs/r4/input/fsh/xtehr-model-maps
echo "Removed obligations and xtehr-model-maps folders from r4 input/fsh directory"