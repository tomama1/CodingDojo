$(document).ready(function(){
    $( '.img' ).click(function() {
        var oldimg = $(this).attr('src');
        var newimg = $(this).attr('data-img');
        $(this).attr({"data-img":oldimg, src:newimg})
    });
});