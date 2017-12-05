var express = require('express');

var bodyParser = require('body-parser');

var session = require('express-session');

var app = express();

var count = 0;

app.use(bodyParser.urlencoded());

app.use(session({secret: 'Secretkey'}));

app.set('views', __dirname + '/views');

app.set('view engine', 'ejs');

app.get("/", function (request, response){
    count ++;
    request.session.count = count;

    response.render('counter', {count: request.session.count});
});

app.get("/count2", function(request, response){
    count++;
    request.session.count = count;
    response.redirect('/');
});

app.get("/reset", function(request, response){
    count = 0;
    request.session.count = count;
    response.redirect('/');
});

app.listen(8000, function() {
    console.log("on port 8000");
})