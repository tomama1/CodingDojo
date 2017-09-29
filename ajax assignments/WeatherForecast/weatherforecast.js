$(document).ready(function() {
    $('form').submit(function() {
        $('#results').empty();
        var city = $('#cityname').val();
        var key = "f38c79446c7043d3239a534526632952";
        var url = 'http://api.openweathermap.org/data/2.5/weather?q='+city+'&appid='+key+'&units=imperial';
        $.get(url, function(res) {
            var temp = res.main.temp;
            $('#results').append("<h2>"+res.name+"</h2><br>");
            $('#results').append(temp+" °F");
        }, 'json');
        return false;
    });
});
