"uses strict"

function ViajesController(){

}

ViajesController.prototype = {
    load : function (){
      var navigationController = new NavigationController;
      $.get('api/v1/viajes',function(data){
        navigationController.loadTemplate('viajes',data,'#main-container',function(){
          navigationController.handleNavigationEvents();
        });
      },"json");
    }
}
