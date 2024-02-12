#!/bin/bash

echo "------------------------------------------------------------------"
echo "STATUS: Starting..."
currentDate=`date`
echo "Date = " $currentDate
echo "------------------------------------------------------------------"

declare -A root_home=/root
export USER="root"

# add bash_profile
echo "------------------------------------------------------------------"
echo "STATUS:       Setting up .bash_profile..."
echo "------------------------------------------------------------------"
chmod a-wx,u+rw,go+r ${root_home}/startup/_.bash_profile
cp ${root_home}/startup/_.bash_profile /etc/skel/.bash_profile
cp ${root_home}/startup/_.bash_profile ${root_home}/.bash_profile

echo "------------------------------------------------------------------"
echo "STATUS: Done"
echo "------------------------------------------------------------------"
