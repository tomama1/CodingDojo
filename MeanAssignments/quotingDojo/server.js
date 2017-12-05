var express = require('express');
var app = express();

var bodyParser = require('body-parser');

var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/quotingDojo');

mongoose.Promise = global.Promise;

var postSchema = new mongoose.Schema({
    name: String,
    message: String,
    date: String
})

mongoose.model('wallPost', postSchema);
var Post = mongoose.model('wallPost')

app.use(bodyParser.urlencoded({ extended: true}));

var path = require('path');

app.use(express.static(path.join(__dirname, './static')));

app.set('views', path.join(__dirname, './views'));

app.set('view engine', 'ejs');

app.get('/', function(req, res){
    res.render('index');
})

app.get('/display', function(req, res){

    Post.remove({message:undefined}, function(err){
    })

    Post.find({}, function(err, posts){
        res.render('quotes', {"posts": posts});
    })




})

app.post('/quotes', function(req, res){
    var date = getCurrentDate();
    var post = new Post({name: req.body.name, message: req.body.quote, date: date});
    post.save(function(err){

        if(err){
            console.log("something went wrong");
        } else{
            res.redirect('/display');
        }
    })
})

app.listen(8000, function() {
    console.log("listening on port 8000");
})


function getCurrentDate(){
    var date = new Date().toLocaleDateString("en-US");
    return date;
}