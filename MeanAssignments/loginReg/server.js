var express = require('express');
var bodyParser = require('body-parser');
var session = require('express-session');
var path = require('path');
var mongoose = require('mongoose');
var app = express();

app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: 'verysecret',
}))

app.use(bodyParser.urlencoded());
app.set('views', path.join(__dirname, './client/views'));
app.set('view engine', 'ejs')

require('./server/config/mongoose.js');

var routes_setter = require('./server/config/routes.js');

routes_setter(app);


app.listen(8000, function() {
    console.log("listening on port 8000");
})
