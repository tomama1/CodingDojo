$(document).ready(function(){

    $('.Kobeimg').click(function(){
        $(this).hide();
    });
    $( "#restore" ).click(function() {
        $( ".Kobeimg" ).show();
    });
});