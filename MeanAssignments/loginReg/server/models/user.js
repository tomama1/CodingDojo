var mongoose = require('mongoose');
var bcrypt = require('bcrypt-as-promised');
// create the schema
var userSchema = new mongoose.Schema({
    first_name: {type: String, required: true, minlength: 2},
    last_name: {type: String, required: true, minlength: 2},
    email: {type: String, required: true, unique: true},
    password: {type: String, required: true},
    birthday: {type: Date, required:true,
        validate:[{
            validator: function(date){
                var today = new Date();
                var year = today.getFullYear();
                var month = today.getMonth();
                var day = today.getDate();
                var c = new Date(year-18, month, day);
                return date <= c
            },
            message: "you must be above 18 years old"
        }]
    }
}, {timestamps: true});

userSchema.pre('save', function(next){
	var user = this;
	bcrypt.hash(user.password, 10)
	.then(function(hashed_pw){
		user.password = hashed_pw;
		next();
	})
	.catch(function(error){
		console.log(error);
	})
})

userSchema.pre('check', function(next){
	var user = this;
	bcrypt.compare(formpassword, user.password)
	.then(function(){
        next();
	})
	.catch(function(error){
		console.log(error);
	})
})
// register the schema as a model
var User = mongoose.model('user', userSchema);