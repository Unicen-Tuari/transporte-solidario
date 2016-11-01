"uses strict"

var config = {
  app_path : 'js/app/'
};


function init(){

    console.log("Initializing app...");

    var navigationController = new NavigationController();

    var role = '';
    navigationController.loadNav(role);
    navigationController.processAction(location.hash.replace('#',''));

    //navigationController.loadTemplate('home',[],'#main-container');


}

$(document).ready(function(){
  init();
});
