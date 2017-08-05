<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Models\UserModel;

class UserController extends Controller
{

  protected $model;
  /**
   * Create a new controller instance.
   *
   * @return void
   */
  public function __construct()
  {
    $this->model = new UserModel;
      //
  }

  public function getUser($id){
    $var = new \stdClass;
    $var->data = $this->model->getUserById($id);
    return json_encode($var);
  }

  // [Auth]
  public function getLoggedInUser(Request $request){
    $user = $request->user();
    return $user;
  }

  // [Auth]
  public function getUsers(Request $request){
    $var = [ "data" => $this->model->getUsers()];
    return $var;
  }

  public function setRegister(Request $request){
    $var=new \stdClass;
    $name = $request->input('nombre');
    $email = $request->input('email');
    $password = $request->input('pwd');
    $facebook = $request->input('face');
    $webpage = $request->input('web');
    $descripcion = $request->input('comment');
    $telefono = $request->input('tel');
    $tipo_usuario = $request->input('tipo');
    $var = $this->model->setRegister($name,$email,$password,$facebook,$webpage,$descripcion,$telefono,$tipo_usuario);
    return $var;
  }

  public function setRol($id,Request $request){
    $this->model->setRol($id,$request->input('rol'));
    return "exito!";
  }

  public function getRoles(Request $request){
    $var = [ "data" => $this->model->getRoles()];
    return $var;
  }

  public function saveImg(Request $request, $id) { //https://lumen.laravel.com/docs/5.2/requests#files
    if ($request->file('archivo')->isValid()) {
      // guardo la imagen con el nombre igual al id del usuario
      $fileName = $id.".".$request->file('archivo')->guessExtension();
      $request->file('archivo')->move(base_path().'/public/img/upload/', $fileName);
      $this->model->saveImg($id, "img/upload/" . $fileName);
      return response()->json(true); // contenido application/json ya que no retornamos nada de la BD.
    } else {
      abort(403, 'Imagen no compatible, por favor utiliza formatos y tamaños de imagen compatibles.');
    }
  }

}
