"uses strict"


function ViajesController(){

}

ViajesController.prototype = {
    viewViajes : function (){
      $.get('api/v1/solicitados',function(data){
        $('#main-container').html(data);
      })
    }

  }
