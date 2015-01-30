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

#####################################################
# Please update these according to your application #
#####################################################

export APPLICATION_NAME="helloworld"
# name or id or running container, that has a floating IP address which you wish to update when staging the application 
export STAGING_NAME="helloworldstaging"
# name or id or running container, that has a floating IP address which you wish to update when deploying the application to production 
export PRODUCTION_NAME="helloworldproduction"
# API key for the Container Service. This is available from https://console.ng.bluemix.net under Services->Containers 
export API_KEY="07889a87b6429714618fe23153c20e00cf02724573dedc9e" 
# Container Registry.  This is available from https://console.ng.bluemix.net under Services->Containers 
export REGISTRY_URL="registry-ice.ng.bluemix.net/icedevops"


