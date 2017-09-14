var http = require('http'),
    httpProxy = require('http-proxy');

var httpAgent = http.globalAgent
httpAgent.maxSockets = 10000;
httpAgent.keepAlive = true;

//
// Create a proxy server with custom application logic
//
var proxy = httpProxy.createProxyServer({
  agent: httpAgent
});

//
// Create your custom server and just call `proxy.web()` to proxy
// a web request to the target passed in the options
// also you can use `proxy.ws()` to proxy a websockets request
//
var server = http.createServer(function(req, res) {
  // You can define here your custom logic to handle the request
  // and then proxy the request.
  proxy.web(req, res, { target: 'http://127.0.0.1:4445' });
});

server.listen(4444);

console.log('started proxy server')
