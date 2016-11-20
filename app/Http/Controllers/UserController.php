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
    return array(
      'id' => $id,
      'name' => 'Gabriel',
      'email' => 'loco@gmail.com',
      'facebook' => 'gabi-cg',
      'webpage' => 'www.loco.com.ar',
      'descripcion' => 'Acá va a ir toda la descripción del usuario.',
      'telefono' => '+54 249 478 3214',
      'tipo_usuario' => 'usuario',
      'fecha_alta' => '07/11/2016',
      'img_path' => 'user-icon.png'
    );
  }



    //
}
