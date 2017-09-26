$(document).ready(function(){
    $( "#show" ).click(function() {
        $( "#kobe_show" ).show("fast");
        $( "#show").hide("fast");
        $( "#hide").show("fast");
    });


    $("#hide").click(function() {
        $( "#kobe_show").hide("fast");
        $( "#hide").hide("fast");
        $( "#show").show("fast");

    });


    $( "#toggle" ).click(function() {
        $( "#kobe_toggle" ).toggle( "fast");
    });

    $( "#slideDown" ).click(function() {
        $( "#kobe_slide" ).slideDown( "fast");
    });

    $( "#slideUp" ).click(function() {
        $( "#kobe_slide" ).slideUp("fast");
    });

    $( "#getattr" ).click(function() {
        var oldimg = $("#kobe_get").attr('src');
        var newimg = $("#kobe_get").attr('alt');
        $("#kobe_get").attr({alt:oldimg, src:newimg});
    });
});