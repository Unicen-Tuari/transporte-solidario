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

  public function getUsers(){
    return array(array(
      'id' => '1',
      'name' => 'Los Pibes',
      'email' => 'pibes@gmail.com',
      'facebook' => 'pibitosONG',
      'webpage' => 'www.lospibes-ong.com.ar',
      'descripcion' => 'Acá va a ir toda la descripción de la ong.',
      'telefono' => '+54 249 478 3214',
      'tipo_usuario' => 'ong',
      'fecha_alta' => '07/11/2016',
      'img_path' => 'user-icon.png'
    ),
    array(
      'id' => '2',
      'name' => 'Gabriel',
      'email' => 'loco@gmail.com',
      'facebook' => 'gabi-cg',
      'webpage' => 'www.loco.com.ar',
      'descripcion' => 'Acá va a ir toda la descripción del usuario.',
      'telefono' => '+54 249 478 3214',
      'tipo_usuario' => 'usuario',
      'fecha_alta' => '07/11/2016',
      'img_path' => 'user-icon.png'
    ));
  }

    //
}
