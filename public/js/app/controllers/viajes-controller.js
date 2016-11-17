
  "uses strict"

  function ViajesController(){}
var viajes;
  ViajesController.prototype = {
      load : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(data){
          viajes=data;
          navigationController.loadTemplate('viajes',viajes,'#main-container',function(){

            $('#ordenarpor li a').click(function(){
              var viajesFiltrados = {
                "data" : $(viajes['data']).filter(function(i,n){
                                                  return n.destino == 'Azul';
                                                  })
                };
                  console.log(viajesFiltrados);
              navigationController.loadTemplate('viajes',viajesFiltrados,'#main-container',function(){
                navigationController.handleNavigationEvents();
              });
            });

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
