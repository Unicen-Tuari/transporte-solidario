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

  public function getUsers(){
    $var = new \stdClass;
    $var->data = $this->model->getUsers();
    return json_encode($var);
  }

}
