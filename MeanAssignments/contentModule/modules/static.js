const http = require('http'),
    fs = require('fs');

module.exports = function (request, response){

    console.log(request);
    if(request.url === '/'){
        fs.readFile('../views/index.html', 'utf8', function (errors, contents) {
          response.write(contents); 
          response.end();
        });
    } else if(request.url === '/dojo.html'){
        fs.readFile('../views/dojo.html', 'utf8', function (errors, contents) {
          response.write(contents);
          response.end();
        });
      } else if(request.url === '/stylesheet/style.css'){
        fs.readFile('../views/stylesheet/style.css', 'utf8', function (errors, contents) {
          response.write(contents);
          response.end();
        });
      } else {
          response.end('File not found!!!');
      }

};