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

  public function getUsers(){
    $users=new \stdClass;
    $data=$this->model->getUsers();
    $users->data=$data;
    return json_encode($users);
  }

  public function setRol($id,Request $request){
    $this->model->setRol($id,$request->input('rol'));
    return "exito!";
  }

  public function getUser($id){
    $var = new \stdClass;
    $var->data = $this->model->getUserById($id);
    return json_encode($var);
  }

  public function getUsers(Request $request){
    /*$user = $request->user();
    return [$user];*/

    // lo siguiente es sólo para poder visualizar los usuarios, vale lo de arriba
    $var = new \stdClass;
    $var->data = $this->model->getUsers();
    return json_encode($var);
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
      'tipo_usuario' => $request->input('tipo|'),
      'img_path' => $request->input('image')
    );
    $this->model->setRegister($info);
  }

}
