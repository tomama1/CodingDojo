var daysUntilMyBirthday = 60;
var message = "";
if (daysUntilMyBirthday > 30){
    message = ". Keep Waiting!";
}
else if(daysUntilMyBirthday > 5){
    message = ". Almost There!";
}
else if(daysUntilMyBirthday > 0){
    message = "!!!!!!!!!!!";
}
else{
    console.log("HAPPY BIRTHDAY!!");
    return;
}
console.log(daysUntilMyBirthday," days until my birthday"+message);