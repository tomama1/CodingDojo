var mongoose = require('mongoose');
// create the schema
var pigSchema = new mongoose.Schema({
    type: {type:String, required:true},
    part: {type: String, required:true},
    mbti: {type: String, required:true}
})
// register the schema as a model
var Pig = mongoose.model('pig', pigSchema);