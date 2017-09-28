$(document).ready(function(){
    $("form").submit(function(){
        var data = $(this).serializeArray();
        console.log(data);
        $("#contactlist").append("<div class='contact'><h1>"+data[0].value+" "+data[1].value+"</h1><p class='contactd'>Show Description</p><p class='initialhidden'>"+data[2].value+"</p></div>");
        return false;
    })

    $("#contactlist").on("click",".contact",function(){
        $(this).children(".initialhidden").toggle();
        $(this).children(".contactd").toggle();
    });
    
});
