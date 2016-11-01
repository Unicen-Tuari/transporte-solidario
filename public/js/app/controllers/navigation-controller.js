"uses strict"

function NavigationController(){

}

NavigationController.prototype = {
    loadNav : function (rol){
       _this = this;
      $.get('api/v1/navigation/'+rol,function(data){
        _this.loadTemplate('nav',data,'#nav',function(){
          _this.handleNavigationEvents();
        });
      });
    },
    handleNavigationEvents : function (){
       _this = this;
      $(".navbar-brand , .nav a").click(function(event){
        event.preventDefault();
        var action =  $(this).attr('href');
        _this.processAction(action);
      });
    },
    loadTemplate: function (template,data,container,callback = null){
      $.get({
        url : config.app_path+'templates/'+template+'.mst',
        cache : false
      }).then(function(mst){

        var output = Mustache.render(mst,data);
        $(container).html(output);
        if(callback) callback();
      });
    },
    processAction: function(action){
     _this = this;
      location.hash = action;
      switch(action){
        case " ":
        case "#":
          _this.loadTemplate('home',[],'#main-container');
          break;
        case "usuarios":
          var controller = new UserController;
          controller.load();
          break;


      };
    }
  };
