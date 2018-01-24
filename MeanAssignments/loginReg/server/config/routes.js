
var login_controller = require('./../controllers/users.js');

module.exports = function(app){

    app.get('/',
    login_controller.index
    );

    app.post('/user',
        login_controller.register);

    app.get('/login_succesful', 
        login_controller.loginSuccessful);

    app.post('/login',
        login_controller.login);



}