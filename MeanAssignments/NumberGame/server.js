var express = require('express');
var app = express();

var count = 0;
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded());
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.get('/', function(req, res){
    res.render('index', {count: count});
});


var server = app.listen(8000, function(){
    console.log('listening on port 8000');
});
var io = require('socket.io').listen(server);
io.sockets.on('connection', function (socket) {
    console.log("client/socket is connected!");
    console.log("client/socket id is: ", socket.id);

    socket.on("button_pressed", function (data){
        count++;
        io.emit( 'updated_count', {response: count});
    });
    socket.on("reset_pressed", function (data){
        count = 0;
        io.emit( 'updated_count', {response: count});
    });
});