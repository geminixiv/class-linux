# syntax=docker/dockerfile:1
#
# docker file for creating a ubuntu container by gabriel solomon @jeromesolomon
#
FROM ubuntu:latest

# environment variables
ARG USER="root"

# container startup scripts
ARG STARTUP="startup"
ENV STARTUP_DIR=/root/$STARTUP

# copy bash startup script
ADD $STARTUP $STARTUP_DIR

# expose ports for ssh
EXPOSE 22
# expose ports for vncserver
# vncserver runs display 1 on port 5901 and display 2 on port 5902, et cetera
EXPOSE 5901

# create a volume to share data between host and other containers
VOLUME /shared-volume

# prevent installer from runnning in interactive mode, 
# in order to allow automation of the installation
ARG DEBIAN_FRONTEND=noninteractive

# set the time zone
ENV TZ=America/Los_Angeles

# update
RUN apt-get update
RUN apt upgrade -y

# base ubuntu system build w/ ssh and vnc support
RUN apt-get -y install sudo \
    git \
    nano \
    vim

# ubuntu utilities
RUN apt-get -y install busybox

# update linux, then do more installs
RUN apt-get -y update; apt-get -y install locales

# set system language and region to english, USA
# set dll runtime bindings
RUN locale-gen en_US.UTF-8; ldconfig /usr/local/lib

#
# additions NOT given to students
#
RUN apt-get install -y tree jq


# upon creation of the container run the startup script, and do any clean 
# up on the container, set time zone, copy bash_profile,
# then start bash

# change to root home dir
WORKDIR /root

# upon creation of the container run the startup script, and do any clean 
# up on the container, set time zone, then start bash
CMD \
    # set timezone
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone ; \
    # run the startup script
    chmod +x $STARTUP_DIR/ubuntu-start.sh ; \
    $STARTUP_DIR/ubuntu-start.sh ; \
    # start a bash shell
    /bin/bash
