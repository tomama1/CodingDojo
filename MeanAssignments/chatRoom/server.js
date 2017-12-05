var express = require('express');
var app = express();
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
var users = [];
var messages = [];

app.get('/', function(req, res){
    res.render('index', {messages: messages});
});

var server = app.listen(8000, function(){
    console.log('listening on port 8000');
});

var io = require('socket.io').listen(server);

io.sockets.on('connection', function (socket) {
    console.log("client/socket is connected!");
    console.log("client/socket id is: ", socket.id);

    socket.on("new_user", function (data){
        users.push(data.name);
        socket.emit('newuser_added', {response: messages});
    });
     socket.on("new_message", function (data){
         messages.push({"name": data.name, "msg" : data.msg});
         io.emit( 'update_msglog', {response: data});
    });

});