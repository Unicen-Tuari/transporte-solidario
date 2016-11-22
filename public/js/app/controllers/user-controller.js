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
<<<<<<< HEAD
        navigationController.loadTemplate('users',data,'#main-container',function(){
        });
=======
        navigationController.loadTemplate('users',data,'#main-container');
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3
      },"json");
    },

    loadProfile : function (id){
      var navigationController = new NavigationController;
      $.get('api/v1/users/{id}',function(data){
<<<<<<< HEAD
        navigationController.loadTemplate('perfil',data,'#main-container',function(){
        });
=======
        navigationController.loadTemplate('perfil',data,'#main-container');
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3
      },"json");
    },

    createUser : function (form) {
      var navigationController = new NavigationController;
      var formData = new FormData(form);
      $.ajax({
        method: "POST",
        url: 'api/v1/register',
        data: formData,
        contentType: false,
        cache: false,
        processData:false,
        success: function(data){
          navigationController.loadTemplate('home',data,'#main-container');
        },
        error: function(jqxml, status, errorThrown) {
          console.log(errorThrown);
        }
      });
    },

    loadRegister : function (){
      var navigationController = new NavigationController;
      $.get('api/v1/users',function(data){
        navigationController.loadTemplate('newUser',data,'#main-container');
      },"json");
      $('#newUser').on("submit",function() {
        event.preventDefault();
        alert("llegamo");
        createUser(this);
      });
    }
}
