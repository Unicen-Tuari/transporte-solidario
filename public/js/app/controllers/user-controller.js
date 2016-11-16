"uses strict"

function UserController(){

}

UserController.prototype = {
    /*load : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('users',[],'#main-container');
    },*/

    load : function (){
      var navigationController = new NavigationController;
      $.get('api/v1/users',function(data){
        navigationController.loadTemplate('users',data,'#main-container');
      },"json");
    },

    loadProfile : function (id){
      var navigationController = new NavigationController;
      $.get('api/v1/users/{id}',function(data){
        navigationController.loadTemplate('perfil',data,'#main-container');
      },"json");
    }
}
