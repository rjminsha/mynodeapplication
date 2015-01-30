#!/bin/bash

#********************************************************************************
# Copyright 2014 IBM
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#********************************************************************************

# script to see if my container is linked to a target container
# will continuously run tests against the target.
# can be used as a health check for a container 
 
if [ -z $LINKEDTARGET_PORT_80_TCP_ADDR ]
then 
	IS_LINKED="False"
else
	export TARGET_PORT=$LINKEDTARGET_PORT_80_TCP_PORT
	export TARGET_HOSTNAME=$LINKEDTARGET_PORT_80_TCP_ADDR
	IS_LINKED="True"
fi 
echo "Pausing for network to be established"
sleep 3

echo "#####################"
echo "Setting Configuration" 
echo "#####################"
echo "   target port=$TARGET_PORT"
echo "   target hostname=$TARGET_HOSTNAME"
echo "   is linked=$IS_LINKED" 

echo "################"
echo "Regression Tests" 
echo "################"
cd /app
while true; do
	date
	env WEB_PORT=$TARGET_PORT WEB_HOSTNAME=$TARGET_HOSTNAME mocha --reporter=spec
	sleep 10
done
