
  "uses strict"

  function ViajesController(){}

  ViajesController.prototype = {
      load : function (){
        var navigationController = new NavigationController;
        $.get('api/v1/viajes',function(data){
          navigationController.loadTemplate('viajes',data,'#main-container',function(){
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
