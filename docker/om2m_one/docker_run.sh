#!/bin/bash

docker run -ti --rm --name=om2m_one_iot_runtime \
           --privileged \
           -v $(pwd)/../../src:/root/src \
           -p 8080:8080 \
           -p 8282:8282 \
           -p 1880:1880 \
           -v ~/.vim:/root/.vim \
           -v ~/.vimrc:/root/.vimrc \
           om2m_one_iot_platform
