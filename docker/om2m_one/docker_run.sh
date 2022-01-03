#!/bin/bash

docker run -ti --rm --name=om2m_one_iot_runtime \
           --privileged \
           -v $(pwd)/../../src:/root/src \
           -v $(pwd)/../../src/data/in_database:/root/om2m/in-cse/database \
           -v $(pwd)/../../src/data/mn_database:/root/om2m/mn-cse/database \
           -v $(pwd)/../../src/node-red/config/package.json:/root/.node-red/package.json \
           -p 8080:8080 \
           -p 8282:8282 \
           -p 1880:1880 \
           -v ~/.vim:/root/.vim \
           -v ~/.vimrc:/root/.vimrc \
           om2m_one_iot_platform
