#!/bin/sh

docker run \
    --name ig-publisher-imaging \
    --rm -it \
    -v $(pwd):/home/publisher/ig \
    hl7fhir/ig-publisher-base
