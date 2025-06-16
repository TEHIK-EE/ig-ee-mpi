#!/bin/bash

this="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
if [ ! -f "$this/input-cache/publisher.jar" ]; then
    cd $this && $this/_updatePublisher.sh -f -y
fi
docker pull hl7fhir/ig-publisher-base:latest
docker run --rm -it -v $this:/workdir -v ~/.fhir:/home/publisher/.fhir \
  hl7fhir/ig-publisher-base:latest /bin/bash -c "cd /workdir && ./_genonce.sh"
