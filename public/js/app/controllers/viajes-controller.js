
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

            /*
            $('#ordenarpor li a').click(function(e){
              e.preventDefault();
              var filtro=$(this).attr("filtro");
              var tipoFiltro=$(this).attr("tipoFilt");
              var viajesFiltrados = (response.data.viajes).short(function(viaje,index){
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
            });*/

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
