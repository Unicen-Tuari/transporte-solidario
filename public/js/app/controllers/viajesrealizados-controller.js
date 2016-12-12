"uses strict"

function ViajesRealizadosController(){
}

ViajesRealizadosController.prototype = {
    load : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('realizados-button',null,'#main-container',function(){
      });
      this.loadstruct('origen',null);
    },
    loadstruct: function(consulta,estado){
      var navigationController = new NavigationController;
      $.get('api/v1/viajes/realizados/'+consulta+"/"+estado,function(data){
        navigationController.loadTemplate('realizados-body',data,'#rbody',function(){
          console.log("carga funcion");
          $("li>a[data_idviaje]").click(function(){
            console.log($(this).attr('data_idviaje'));
            ViajesRealizadosController.prototype.setFinViaje($(this).attr('data_idviaje'),$(this).attr('data-calif'));
          });
          /*$('.dropdown').click(function(){
          	console.log($(this).attr('data_idviaje'));
            //ViajesRealizadosController.prototype.setFinViaje($(this).attr('data_idviaje'),5);
          });*/
        });
      },"json");
    },
    setFinViaje : function(id,val_score){
      var navigationController = new NavigationController;
       $.post('api/v1/viajes/'+id,{ score:val_score }).done(function(){
         ViajesRealizadosController.prototype.load();
       });
    },

}
$(document).ready(function(){
  var estado=0;
  var orden="origen";
  $('.container').on('change','#dropdown-orden',function(){
    var controller = new ViajesRealizadosController;
    //remplazar nul por el valor del boton activo
    orden=$(this).val();
    controller.loadstruct(orden,estado);
  });

  //$("#myid li").click(function() {
  $('.container').on('click','#todos',function(){
    //ojo aca no va value si no el valor
    estado=0;
    var controller = new ViajesRealizadosController;
    controller.loadstruct(orden,estado);
  });

  $('.container').on('click','#asignados',function(){
    var controller = new ViajesRealizadosController;
    estado=1;
    controller.loadstruct(orden,estado);
  });

  $('.container').on('click','#finalizados',function(){
    var controller = new ViajesRealizadosController;
    //var orden=$(this).val();
    estado=2;
    controller.loadstruct(orden,estado);
  });
});
