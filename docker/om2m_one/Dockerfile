FROM ubuntu:20.04

MAINTAINER Joe Yang

# configure time zone
RUN apt-get update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata


# prepare utils
RUN apt-get update -y
RUN apt-get install -y vim htop git curl net-tools iputils-ping && \
    apt-get install -y zip unzip wget maven

# install python env
RUN apt-get install -y python3 python3-dev python3-pip

# upgrade pip3
RUN pip3 install --upgrade pip

# remove openjdk-11
RUN apt-get purge -y openjdk-11*

# install openjdk-8
RUN apt-get install -y openjdk-8-jdk
# install maven
RUN apt-get install -y maven

WORKDIR /root

# install OM2M 1.0.0
RUN git clone https://git.eclipse.org/r/om2m/org.eclipse.om2m
RUN cd ./org.eclipse.om2m && git checkout 1.0.0
# build OM2M
RUN cd ./org.eclipse.om2m && mvn clean install -DskipTests=true

WORKDIR /root


# create om2m
RUN mkdir om2m
RUN cp -r org.eclipse.om2m/org.eclipse.om2m.site.in-cse/target/products/in-cse/linux/gtk/x86_64/ om2m/in-cse
RUN cp -r org.eclipse.om2m/org.eclipse.om2m.site.mn-cse/target/products/mn-cse/linux/gtk/x86_64/ om2m/mn-cse
RUN chmod +x ./om2m/in-cse/start.sh && chmod +x ./om2m/mn-cse/start.sh

# install npm
RUN apt-get install -y nodejs npm tree tmux

# install Node-RED
RUN npm install -g --unsafe-perm node-red

# install OM2M One Node-RED plugin
RUN mkdir -p ~/.node-red && cd ~/.node-red && \
    git clone https://github.com/IamSkyBlue/contrib-oM2M_backup.git && \
    npm install
RUN mkdir -p ~/.node-red/node_modules/ && \
    mv ~/.node-red/contrib-oM2M_backup ~/.node-red/node_modules/.


RUN rm -rf /var/lib/apt/lists/*

CMD /bin/bash
