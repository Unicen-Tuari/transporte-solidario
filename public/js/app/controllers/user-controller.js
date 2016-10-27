"uses strict"

function UserController(){

}

UserController.prototype = {
    load : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('users',[],'#main-container');
    }
}
