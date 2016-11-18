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
