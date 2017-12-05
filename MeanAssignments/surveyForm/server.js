var express = require('express');
var app = express();

var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded());

app.set('views', __dirname + '/views');

app.set('view engine', 'ejs');

app.get('/', function(req, res){
    res.render('index');
});


var server = app.listen(8000, function(){
    console.log('listening on port 8000');
});
var io = require('socket.io').listen(server);
io.sockets.on('connection', function (socket) {
    console.log("client/socket is connected!");
    console.log("client/socket id is: ", socket.id);
    var number = Math.floor((Math.random()*1000)+1);
    socket.on("posting_form", function (data){
        socket.emit( 'updated_message', {response: data });
        socket.emit('random_number', {response: number })
        })
    });