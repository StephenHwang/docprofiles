#!/bin/bash
#  Build docker container

set -euo pipefail

echo 'Start building docprofiles docker container'

docker build -t docprofiles .

echo 'End building docker container'
