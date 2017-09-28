$(document).ready(function(){
    $("form").submit(function(){
        console.log($(this).serializeArray());
        var fname = $("#fname").val();
        var lname = $("#lname").val();
        var email = $("#email").val();
        var contact = $("#contact").val();
        $("#list").append("<tr><td>"+fname+"</td><td>"+lname+"</td><td>"+email+"</td><td>"+contact+"</td></tr>");
        $("#fname").val("");
        $("#lname").val("");
        $("#email").val("");
        $("#contact").val("");
        return false;
    });
})