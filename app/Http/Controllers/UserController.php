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

  public function setRegister(Request $request){ // no se como se consiguen los datos
    $info = array(
      'name' => $request->input('name'),
      'email' => $request->input('email'),
      'password' => $request->input('password'),
      'facebook' => $request->input('face'),
      'webpage' => $request->input('web'),
      'descripcion' => $request->input('desc'),
      'telefono' => $request->input('tel'),
      'tipo_usuario' => $request->input('tipo')
    );
    $this->model->setRegister($info);
  }

  public function setRol($id,Request $request){
    $this->model->setRol($id,$request->input('rol'));
    return "exito!";
  }

  public function saveImg($id) {
    $image_name = $_FILES['image']['name'][0];
    $image_tmp = $_FILES['image']['tmp_name'][0];
    $image['name'] = $image_name;
    $image['tmp_name'] = $image_tmp;
    $this->model->saveImg($id, $image);
  }
}
