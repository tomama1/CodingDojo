var clockstart = false;

var score = 0;

var pacman = {
    x: 1,
    y: 1
};

var world = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],   
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1], 
    [1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1], 
    [1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1], 
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1], 
    [1, 2, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1], 
    [1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1], 
    [1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1], 
    [0, 0, 0, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 0, 0, 0], 
    [1, 1, 1, 1, 2, 1, 2, 1, 1, 0, 1, 1, 2, 1, 2, 1, 1, 1, 1], 
    [2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2], 
    [1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1], 
    [0, 0, 0, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 0, 0, 0], 
    [1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1], 
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1], 
    [1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1], 
    [1, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 1], 
    [1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 1],
    [1, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 1], 
    [1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1], 
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1], 
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];

function spawnPacman(){
    pacman.y = 16;
    pacman.x = 9;
}
console.log(world[0].length)

function spawnCherry(){
    var continue1 = true;
    while (continue1==true){
        var xpos = Math.floor(Math.random()*(world[0].length-2)+1);
        var ypos =  Math.floor((Math.random())*(world.length-2)+1);
        if (((xpos!=pacman.x)&&(ypos!=pacman.y))&&(world[ypos][xpos]==2)){
            world[ypos][xpos] = 3;
            return;
        }
    
    }
}


function displayWorld(){
    var output = '';
    for (var i=0;i<world.length; i++){
        output += "\n<div class='row'>";
        for (var j=0;j<(world[i].length); j++){
            if(world[i][j]==1){
                output +="<div class='cell'></div>";
            }
            else if(world[i][j]==2){
                output +="<div class='coin'></div>";
            }
            else if(world[i][j]==3){
                output +="<div class='cherry'></div>";
            }
            if (world[i][j]==0){
                output +="<div class='empty'></div>";
            }
        }
        output += "</div>";
    }

   document.getElementById("world").innerHTML = output;
}


function displayPacman(){
    document.getElementById('pacman').style.left =pacman.x*20+"px";
    document.getElementById('pacman').style.top =pacman.y*20+"px";
}

function displayScore(){
    document.getElementById('gamescore').innerHTML = score;
}

var counter = 0;
var timer = setInterval("clockstart()",1000);

function clockstart(){
    counter++;
    while(clockstart==true){
    document.getElementById('clock').innerHTML = counter;
    }
}

function gamestart(){
    if(clockstart==true){
        document.onkeydown = function(e){
            if ((e.keyCode ==37)&&(world[pacman.y][pacman.x-1]!=1)) {
                if ((pacman.y==10)&&(pacman.x==0)){
                    pacman.x = 19;
                }
                pacman.x--;
                document.getElementById('pacman').style.transform = "rotate(180deg)";
                displayPacman();
            }
            else if((e.keyCode==39)&&(world[pacman.y][pacman.x+1]!=1)){
                if ((pacman.y==10)&&(pacman.x==18)){
                    pacman.x = 0;
                }
                else{
                    pacman.x++;   
                }
                document.getElementById('pacman').style.transform = "rotate(0deg)";
                displayPacman();
            }
            else if((e.keyCode==38)&&(world[pacman.y-1][pacman.x]!=1)){
                pacman.y--;
                document.getElementById('pacman').style.transform = "rotate(270deg)";
                displayPacman();
            }
            else if((e.keyCode==40)&&(world[pacman.y+1][pacman.x]!=1)){
                pacman.y++;
                document.getElementById('pacman').style.transform = "rotate(90deg)";
                displayPacman();
            }
            if (world[pacman.y][pacman.x] == 2){
                world[pacman.y][pacman.x] = 0;
                score+=10;
                displayScore();
                displayWorld();
            }
            else if(world[pacman.y][pacman.x]==3){
                world[pacman.y][pacman.x] = 0;
                score+=50;
                displayScore();
                displayWorld();
            }
        }
    }
}

$(document).ready(function(){
    spawnPacman();
    spawnCherry();
    displayPacman();
    displayWorld();
    displayScore();
    $('#start').click(function(){
        clockstart = true;
        gamestart();
        clockstart();
    });

});