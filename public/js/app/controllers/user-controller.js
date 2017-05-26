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
      var idUser = '';
      var navigationController = new NavigationController;
      $.get('api/v1/perfil',function(data){
        navigationController.loadTemplate('perfil',data,'#main-container',function(){
          $('#fileToUpload').hide(); // escondemos el botón de carga default

          $('#loadImgPerfil').click(function(event){
            event.preventDefault();
            var nro = $('#idNro').text().split("#");
            idUser = nro[1];
            $('#fileToUpload').click(); // llamo al evento click del botón escondido
          });

          $("#fileToUpload").on("change", function(event){
            event.preventDefault();
            //uploadFile(idUser); // función que se encargará de subir la imágen
            var formData = new FormData($("#imgAjax")[0]);
            $.ajax({
              method: "POST",
              url: "api/v1/perfil/img/"+idUser,
              data: formData,
              contentType: false,
              cache: false,
              processData:false,
              success: function() {
                console.log("Imagen grabada");
                $("#imgUser").attr('src', $("#imgUser").attr('src') + '?' + Math.random() );
              },
              error: function(jqxml, status, errorThrown) {
                console.log(errorThrown);
              }
            });
          });

        });
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

    /*
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
    */

    setGlobalLogin : function(token){
      localStorage.setItem('token-transporte', token);
      $.ajaxSetup({
        beforeSend : function( xhr ){
          xhr.setRequestHeader('Authorization', 'Bearer '+ token)
        }
      });
    },

    loadRegister : function (){
      var navigationController = new NavigationController;
      navigationController.loadTemplate('newUser',[],'#main-container',function(){

        //seteo la funcionalidad del botón newUserBtn del formulario nuevoUsuario
        $("#newUserBtn").click(function(event){
          event.preventDefault();
          var str = new FormData($("#nuevoUsuario"));
          $.ajax({
            url: 'api/v1/register',
            type: "POST",
            data: str,
            contentType: false, //'application/x-www-form-urlencoded',
            processData:false,
            success: function(ok){
              console.log('Info: ' + ok);
              alert("SIIIIII AJAX");
              navigationController.loadTemplate('newUsersuccess',ok,'#main-container',function(){
              });
            },
            error: function(jqxml, status, errorThrown) {
              console.log(errorThrown);
              alert("Error - No se cargó el nuevo usuario");
            }
          }); // fin llamada ajax
        }); // fin función botón

      });
    }

} // fin del prototype

function uploadFile(idUser) {
  var navigationController = new NavigationController;
  var formData = new FormData($("#imgAjax")[0]);
  console.log('uploadFile: ' + $('#fileToUpload').val());
  $.ajax({
    url: "api/v1/perfil/img/"+idUser,
    method: "POST",
    data: formData,
    contentType: false,
    cache: false,
    processData:false,
    success: function() {
      console.log("Imagen grabada");
      //navigationController.loadTemplate('perfil',data,'#main-container');
    },
    error: function(jqxml, status, errorThrown) {
      console.log(errorThrown);
    }
  });
}
