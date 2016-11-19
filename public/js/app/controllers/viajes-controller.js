
  "uses strict"
  function ViajesController(){}
  var viajes;
  ViajesController.prototype = {
      load : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(response){
          var viajes=response;
          navigationController.loadTemplate('viajes',viajes,'#main-container',function(){
            $('#filtrarpor li a').click(function(e){
              e.preventDefault();
              var filtro=$(this).attr("filtro");
              var tipoFiltro=$(this).attr("tipoFilt");
              var viajesFiltrados = (response.data.viajes).filter(function(viaje,index){
                switch(tipoFiltro){
                  case "destino":return viaje.destino == filtro;
                                 break;
                  case "frecuencia":return viaje.frecuencia == filtro;
                                    break;
                  case "name":return viaje.name == filtro;
                                 break;
                               };

                });
               var viajes= {"data": {
                            "viajes" : $.map(viajesFiltrados,function(value,index){
                                       return value;})
                                    }
                            };
                navigationController.loadTemplate('listViajes',viajes,'#listadoViajes');
            });


            $('#ordenarpor li a').click(function(e){
              e.preventDefault();
              var criterioOrden=$(this).attr("orden");
              var viajesOrdenados = (response.data.viajes).sort(function(a,b){
                switch(criterioOrden){
                  case "peso":return ((a.peso == b.peso) ? 0 : ((a.peso > b.peso) ? 1 : -1 ));
                             break;
                  case "fecha_creacion":return ((a.fecha_creac < b.fecha_creac) ? -1 : ((a.fecha_creac > b.fecha_creac) ? 1 : 0 ));
                             break;
                  case "ong":return ((a.name == b.name) ? 0 : ((a.name > b.name) ? 1 : -1 ));
                             break;
                               };

                });
               var viajes= {"data": {
                            "viajes" : $.map(viajesOrdenados,function(value,index){
                                       return value;})
                                    }
                            };
                navigationController.loadTemplate('listViajes',viajes,'#listadoViajes');
            });

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
