
function slots(coin){
  var winnum = Math.floor((Math.random()*100)+1);
  // winning number = random number between 1-100
  var chances = coin;
  // counter for quarters left
  for (i=0;i<coin;i++){
    chances--;
  // used one quarter
    var playernum = Math.floor((Math.random()*100)+1);
    if (playernum==winnum){
      return chances+(Math.floor(Math.random()*51)+50);
    }
  }
  return 0;
}
  console.log(slots(50));