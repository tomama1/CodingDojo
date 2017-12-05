var mongoose = require('mongoose');
var Pig = mongoose.model('pig');

module.exports = function Route(app){

    app.get('/', function(req, res){
        Pig.find({},function(err, pigs){
            if (err){
                console.log("Could not find all pigs");
            } else{
                res.render('index', {"pigs":pigs});
            }
        })
    })
    
    
    
    app.get('/pig/new', function(req, res){
        res.render('new');
    })
    
    app.post('/pig', function(req, res){
        var newpig = Pig(req.body);
        newpig.save(function(err){
            if(err){
                console.log("could not add new pig");
                console.log(err);
            }
            else{
                res.redirect('/');
            }
        });
    });
    
    
    app.get('/pig/edit/:id', function(req, res){
        Pig.find({_id:req.params.id}, function(err, pig){
            if(err){
                console.log("count not find the one pig with id");
            }
            else{
                res.render('edit', {"pig": pig});
            }
        })
    })
    
    
    app.get('/pig/destroy/:id', function(req, res){
        Pig.remove({_id:req.params.id}, function(err){
            if(err){
                console.log("count not find the one pig with id");
            }
            res.redirect('/');
        })
    })
    
    app.post('/pig/:id', function(req, res){
        Pig.update({_id:req.params.id}, {type: req.body.type, part: req.body.part, mbti: req.body.mbti},
            function(err){
            if(err){
                console.log("count not find the one pig");
            }
            else{
                res.redirect('/pig/'+req.params.id);
            }
        })
    })
    
    app.get('/pig/:id', function(req, res){
        Pig.find({_id:req.params.id}, function(err, pig){
            if(err){
                console.log("count not find the one pig");
            }
            else{
                res.render('show', {"pig": pig});
            }
        })
    })
    



}