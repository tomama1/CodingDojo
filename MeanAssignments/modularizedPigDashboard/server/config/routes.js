
var controller = require('../controllers/quotes.js');

module.exports = function Route(app){

    app.get('/', function(req, res){
        controller.showAll(req, res);
    })
    
    app.get('/pig/new', function(req, res){
        res.render('new');
    })
    
    app.post('/pig', function(req, res){
        controller.createPig(req, res);
    });
    
    
    app.get('/pig/edit/:id', function(req, res){
        controller.findPig(req, res);
    })
    
    
    app.get('/pig/destroy/:id', function(req, res){
        controller.removePig(req, res);
    })
    
    app.post('/pig/:id', function(req, res){
        controller.updatePig(req, res);
    })
    
    app.get('/pig/:id', function(req, res){
        controller.showPig(req, res);
    })
    



}