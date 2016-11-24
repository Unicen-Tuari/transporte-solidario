
  "uses strict"
  function ViajesController(){}
  var viajes;
  ViajesController.prototype = {
      load : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(response){
          var viajes=response;
            navigationController.loadTemplate('viajes',viajes,'#main-container',function(){
            navigationController.loadTemplate('listViajes',viajes,'#listadoViajes',function(){
              $('.ofrecer').click(function(e){
              e.preventDefault();
               var idViaje= $(this).attr("id_viaje");
               console.log(idViaje);
              $.post('api/v1/viajes/ofrecerme',{id_viaje:idViaje},function() {
                alert('Gracias por su ayuda en breve se comunicaran desde la Ong con usted');
              })
            });}
          );


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
                            navigationController.loadTemplate('listViajes',viajes,'#listadoViajes',function(){
                              $('.ofrecer').click(function(e){
                              e.preventDefault();
                               var idViaje= $(this).attr("id_viaje");
                               console.log(idViaje);
                              $.post('api/v1/viajes/ofrecerme',{id_viaje:idViaje},function() {
                                alert('Gracias por su ayuda en breve se comunicaran desde la Ong con usted');
                              })
                            });}
                          );
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
                            navigationController.loadTemplate('listViajes',viajes,'#listadoViajes',function(){
                              $('.ofrecer').click(function(e){
                              e.preventDefault();
                               var idViaje= $(this).attr("id_viaje");
                               console.log(idViaje);
                              $.post('api/v1/viajes/ofrecerme',{id_viaje:idViaje},function() {
                                alert('Gracias por su ayuda en breve se comunicaran desde la Ong con usted');
                              })
                            });}
                          );
            });
          });
        },"json");
      },

      loadAdd : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/users',function(data){
        navigationController.loadTemplate('addviaje',data,'#main-container',function(){
          fecha();
          handleFormEvents();
        });
      },"json");

     },
      loadR : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(data){
         navigationController.loadTemplate('realizados',data,'#main-container',function(){
          });
        },"json");

      },




  }
   function handleFormEvents(){
       var navigationController = new NavigationController;
       $("#agregarViaje").click(function(event){
         event.preventDefault();
         var str = $("#formViaje").serialize();
         $.ajax({
           url: 'api/v1/viajes',
           type: "POST",
           data: str,
           success: function(data){
             console.log(data);
             navigationController.loadTemplate('addviajesuccess',data,'#main-container',function(){
             });

             },
                 error: function(){
                    alert("No anduvo la llamada AJAX");
                 },
           processData: false,  // tell jQuery not to process the data
           contentType: 'application/x-www-form-urlencoded'  // tell jQuery not to set contentType
         });
       });
 }

function fecha(){
      var d = new Date();
      var y= d.getFullYear().toString();
      var m = d.getMonth().toString();
      var l = d.getDate().toString();
      var day = y+"-"+m+"-"+l;
     $("input[name='fecha']").attr("min",day);

    };
