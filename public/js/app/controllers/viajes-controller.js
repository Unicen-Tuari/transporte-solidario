
  "uses strict"

  function ViajesController(){}

  ViajesController.prototype = {
      load : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(data){
          navigationController.loadTemplate('viajes',data,'#main-container',function(){
            navigationController.handleNavigationEvents();
          });
        },"json");
      },
      loadAdd : function (){
        var navigationController = new NavigationController;
        navigationController.loadTemplate('addviaje',[],'#main-container');
      },
      loadR : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(data){
          navigationController.loadTemplate('realizados',data,'#main-container',function(){
            navigationController.handleNavigationEvents();
          });
        },"json");
      }
  }
