
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
        var viajesFiltrados = {"data": JSON.parse(JSON.stringify($(viajes['data']['viajes']).filter(function(i,n){
                                                  return n.destino == 'Azul';
                                                })
                                              ))};
              //var data=JSON.stringify(dat);
//              var viajesFiltrados= {"data":JSON.parse(JSON.stringify(dat))};
              //JSON.parse(data);

                 //(array)viajesFiltrados['data'];
                 console.log(data);
                 console.log(viajesFiltrados);
                 navigationController.loadTemplate('listViajes',viajesFiltrados,'#listadoViajes',function(){
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
