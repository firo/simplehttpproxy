var http = require('http');

http.createServer(onRequest).listen(9090);

function onRequest(client_req, client_res) {
  console.log('serve: ' + client_req.url);

  var proxy = http.request(client_req.url, function (res) {
    client_res.writeHead(res.statusCode, res.headers)
    res.pipe(client_res, {
      end: true
    });
  });

  client_req.pipe(proxy, {
    end: true
  });
}
