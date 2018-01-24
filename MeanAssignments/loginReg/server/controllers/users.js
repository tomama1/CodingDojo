var mongoose = require('mongoose');
var User = mongoose.model('user');
var bcrypt = require('bcrypt-as-promised');


module.exports = {
    index: function(req, res){
        res.render('index');
    },

    register: function(req, res){
        // input code for registering
        if (req.body.password == req.body.pwconf){
            var newUser = new User(req.body);
            newUser.save(function(err){
                if(err){
                    res.send(err);
                }
                else{
                    res.redirect('/');
                }

            });
        }
        else{
            res.send("passwords do not match");
        }

    },
    login: function(req, res){
        User.findOne({email: req.body.loginemail}, function(err, user){
            if(err){
                console.log("you got an error");
                res.send(err);
            }
            else if(user == undefined){
                res.redirect('/');
            }
            else{
                bcrypt.compare(req.body.loginpassword, user.password)
                .then(function(){
                    req.session.id = user._id;
                    res.redirect('/login_succesful');
                })
                .catch(function(error){
                    console.log("catch error");
                    res.redirect('/');
                })
            }
        })
    },

    loginSuccessful: function(req, res){
        console.log('loginSuccessful');
        res.render('main', {id: req.session.id});
    }

}