

function cargarNav(rol){
  $.get('api/v1/navigation/'+rol,function(data){
    console.log(data);
    $.get('js/templates/nav.mst',function(template){
      var output = Mustache.render(template,data);
      $("#nav").html(output);
    })
  })
}

$(document).ready(function(){
  cargarNav('ong');
});
