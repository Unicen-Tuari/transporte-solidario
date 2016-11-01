"uses strict"

function ViajesController(){

}

ViajesController.prototype = {
    load : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('viajes',[],'#main-container');
    }
}
