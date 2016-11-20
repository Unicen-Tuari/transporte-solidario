"uses strict"

function UserController(){

}

UserController.prototype = {
    /*load : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('users',[],'#main-container');
    },*/

    setRol : function(id,val_rol){
      var navigationController = new NavigationController;
       $.post('api/v1/users/'+id,{ rol:val_rol }).done(function(){
         console.log("genial, id= "+id+" y val_rol="+val_rol);
         UserController.prototype.load();
       });
    },
    load : function (){
      var navigationController = new NavigationController;
      $.get('api/v1/users',function(data){
        navigationController.loadTemplate('users',data,'#main-container',function(){
          navigationController.handleNavigationEvents();
          $('.btn-promot').click(function(){
            UserController.prototype.setRol($(this).attr('data_id'),'ong');
          });
          $('.btn-degrad').click(function(){
            UserController.prototype.setRol($(this).attr('data_id'),'');
          });
        });
      },"json");
    },
    loadProfile : function (){
      var navigationController = new NavigationController;
      $.get('api/v1/users/{id}',function(data){
        navigationController.loadTemplate('perfil',data,'#main-container',function(){
          navigationController.handleNavigationEvents();
        });
      },"json");
    }
}
