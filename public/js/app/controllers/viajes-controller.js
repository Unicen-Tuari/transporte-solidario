"uses strict"


function ViajesController(){

}

ViajesController.prototype = {
    viewViajes : function (){
      $.get('api/v1/solicitados',function(data){
        $('#main-container').html(data);
      })
    },
    solicitados :function (){
      // hacer el llamado mustache
      capo=this;
      $.get('api/v1/viajes',function(data){
        capo.loadT('solicitados',data,'#viajes',function(){
        });
      })
    },
    loadT: function (template,data,container,callback = null){
      $.get({
        url : config.app_path+'templates/'+template+'.mst',
        cache : false
      }).then(function(mst){
        var output = Mustache.render(mst,data);
        $(container).html(output);
        if(callback) callback();
      });
    }

  }
