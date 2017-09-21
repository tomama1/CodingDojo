var HOUR = 8;
var MINUTE = 50;
var PERIOD = "AM";
var hourdes;
var perioddes;
if (minute<30){
    hourdes="just after";
}
else if(minute>30){
    hourdes="almost";
}
else{
    hourdes="";
}
if (period=="AM"){
    perioddes="in the morning";
}
else{
    perioddes="in the evening";
}
console.log("It's "+hourdes+hour+perioddes);
