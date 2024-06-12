#!/bin/bash

this="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
if [ ! -f "$this/input-cache/publisher.jar" ]; then
    cd $this && $this/_updatePublisher.sh -y
fi
docker run --rm -it -v $this:/workdir -v ~/.fhir:/root/.fhir \
  docker.kodality.com/fsh-builder /bin/bash -c "cd /workdir && ./_genonce.sh $1"
