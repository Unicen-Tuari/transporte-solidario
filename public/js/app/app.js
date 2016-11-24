"uses strict"

var config = {
  app_path : 'js/app/'
};


function init(){

    console.log("Initializing app...");
    var token = localStorage.getItem('token-transporte');
    if(token != undefined){
      var $userController = new UserController();
      $userController.setGlobalLogin(token);
    }

    var navigationController = new NavigationController();

    navigationController.loadNav();
    navigationController.processAction(location.hash.replace('#',''));

    navigationController.loadTemplate('home',[],'#main-container');

}

$(document).ready(function(){
  init();
});
