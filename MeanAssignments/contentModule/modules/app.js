var http = require('http');
// fs module allows us to read and write content for responses!!
var fs = require('fs');

// creating a server using http module:
const static_contents = require('./static.js');
//
//creating a server
server = http.createServer(function (request, response){
  static_contents(request, response);  //this will serve all static files automatically
});
// tell your server which port to run on
server.listen(8000);
// print to terminal window
console.log("Running in localhost at port 8000");