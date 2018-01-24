var express = require('express');
var app = express();
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
var players = [];
var messages = [];
var gamestate = 1;
var numplayers;

var jobAssignment = [
    {"number": 2, "mafia": 1, "nurse": 1, "cop": 0},
    {"number": 4, "mafia": 1, "nurse": 1, "cop": 0},
    {"number": 5, "mafia": 1, "nurse": 1, "cop": 1},
    {"number": 6, "mafia": 2, "nurse": 1, "cop": 1},
    {"number": 7, "mafia": 2, "nurse": 1, "cop": 1},
    {"number": 8, "mafia": 3, "nurse": 1, "cop": 1},
    {"number": 9, "mafia": 3, "nurse": 1, "cop": 1},
    {"number": 10, "mafia": 3, "nurse": 1, "cop": 1},
]

app.get('/', function(req, res){
    res.render('index')
})


var server = app.listen(8000, function(){
    console.log('listening on port 8000');
});

var io = require('socket.io').listen(server);

io.sockets.on('connection', function (socket) {
    console.log("client/socket is connected!");
    console.log("client/socket id is: ", socket.id);

    socket.on("new_user", function (data){
        players.push({"name": data.name, "socketid": socket.id, "status": "alive", "job": "filler" });
        numplayers = players.length;
        socket.emit('newuser_added', {response: messages});
    });

    socket.on('disconnect',function(){
        removeplayer(socket.id);
    });

    socket.on("start_game", function(data){
        assignroles(numplayers);
        var allplayerdata = players;
        io.emit("gamestart", {response: allplayerdata, id: socket.id});

    });
     socket.on("new_message", function (data){
         messages.push({"name": data.name, "msg" : data.msg});
         io.emit( 'update_msglog', {response: data});
    });
});


function assignroles(num){
    var tempobj = {};
    var listofjobs = [];
    for (var i = 0; i<=numplayers; i++){
        if(num==jobAssignment[i].number){
            tempobj = jobAssignment[i];
            break;
        }
    }
    for (var i = 0; i<tempobj.mafia; i++){
        listofjobs.push("mafia");
    }
    for (var i = 0; i<tempobj.nurse; i++){
        listofjobs.push("nurse");
    }
    for (var i = 0; i<tempobj.cop; i++){
        listofjobs.push("cop");
    }
    for (var i = listofjobs.length; i<numplayers; i++){
        listofjobs.push("citizen");
    }
    shuffleArray(listofjobs);
    for (var i=0; i<players.length; i++){
        players[i].job = listofjobs[i];
    }
}

function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }

}
function removeplayer(id){
    for (var i=0; i<numplayers;i++){
        if (id === players[i].socketid){
            players.splice(i,1);
            console.log("got to splice here");
            return;
        }
    }
}