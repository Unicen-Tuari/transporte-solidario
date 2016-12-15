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
         UserController.prototype.load();
       });
    },

    load : function (){
      var navigationController = new NavigationController;
      $.get('api/v1/users',function(data){
        navigationController.loadTemplate('users',data,'#main-container',function(){
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
      $.get('api/v1/perfil',function(data){
        navigationController.loadTemplate('perfil',data,'#main-container');
      },"json");
    },

    loadSignIn : function (){
      var _this = this;
      var navigationController = new NavigationController;
      navigationController.loadTemplate('signin',[],'#main-container',function(){
        $('#login-form').submit(function(e){
          e.preventDefault();
          _this.login($(this).serialize(),function(){ // Callback
            navigationController.loadNav();
            _this.loadProfile();
          });
        })
      });
    },

    login : function (data, callback){
      var _this = this;
      $.post('auth/login',
        data
      ).done(function(data){
        if(data.token != undefined){
          _this.setGlobalLogin(data.token);
          callback();
        }
      });
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

    setGlobalLogin : function(token){
      localStorage.setItem('token-transporte', token);
      $.ajaxSetup({
        beforeSend : function( xhr ){
          xhr.setRequestHeader('Authorization', 'Bearer '+ token)
        }
      });
    },

    getRemoteSession : function() {
      return jQuery.ajax({
        url: "api/v1/perfil"
      });
    },

    loadRegister : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('newUser',[],'#main-container',function(){
        $('#newUser').on("submit",function() {
          event.preventDefault();
          alert("llegamo");
          createUser(this);
        });
      });

    }
}
