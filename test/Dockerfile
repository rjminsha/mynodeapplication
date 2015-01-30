#  Copyright 2014 IBM
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
#   limitations under the License.

FROM ubuntu:14.04
MAINTAINER Robbie Minshall "rjminsha@us.ibm.com"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    curl \
    supervisor \
    wget &&\
  apt-get clean

# Install Node.js (assumes ubuntu > 13 from the base image) 
RUN apt-get --purge remove node 
RUN apt-get --purge remove nodejs 
RUN apt-get install -y nodejs
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 
RUN apt-get install -y npm 

# Install dependencies 
Add package.json /app/package.json
RUN cd /app && npm install  
RUN npm install -g mocha 

# Add tests cases 
ADD helloworld.js /app/test/helloworld.js 
ENV TARGET_PORT 80
ENV TARGET_HOSTNAME 192.168.59.103

# Add a startup script to inspect environment 
ADD runtests.sh runtests.sh
RUN chmod +x runtests.sh 

# Define command to run the application when the container starts
#CMD ["cd /app && mocha", "--reporter=spec"] 
CMD ["./runtests.sh"]
