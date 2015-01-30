/**
*  Copyright 2014 IBM
*
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*/

var http = require('http');
var assert = require('assert');
var fs = require('fs');
var nconf = require('nconf');
var request = require('request-json');
var today = Date.now();

nconf.argv().env().file({ file: './config.json'});
var port = nconf.get('WEB_PORT');
var hostname = nconf.get('WEB_HOSTNAME');
console.log('port:' + port);
console.log('hostname:' + hostname);
var client = request.newClient("http://" + hostname + ":" + port);

describe('Hello World Application Web Application', function() {
    
    before(function(done) {
        done();
    });
    after(function(done) {
        done();
    });
    it('should return a 200 response code when / is called by an http client', function(done) {
        client.get('/', function(err, res, body) {
                assert.equal(res.statusCode, 200, 'Expected: 200 Actual: ' + res.statusCode);
                done();
        });
    });
    it("should have a body that says 'Hello Docker Pipeline!'", function(done) {
        client.get('/', function(err, res, body) {
                assert.equal(body, "Hello Docker Pipeline! version 0.2", "Expected to get Hello World but actually got:'" + body + "'");
                done();
        });
    });

});