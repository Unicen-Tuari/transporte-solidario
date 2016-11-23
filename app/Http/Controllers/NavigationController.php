<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Models\NavigationModel;


class NavigationController extends Controller
{

    protected $model;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->model = new NavigationModel;
    }
/*
    public function menu($rol){
      if($rol == 'ong'){
        return array(
          array(
          'title' => 'Viajes solicitados',
          'link' => '#viajes-solicitados'
          ),array(
          'title' => 'Transportes',
          'link' => '#transportes'
        ));
      }
      if($rol == 'transporte'){
        return array(
          array(
          'title' => 'Viajes realizados',
          'link' => '#viajes-realizados'
          ));
      }
      // Visitante
      return array(
        array(
            ""
        ));

    }
*/
    public function menu(Request $request){
      $role = RoleController::$ROLE_GUEST;
      $user = $request->user();
      if($user != null && $user->id_role != null){
        $role = $user->id_role;
      }
      return $this->model->findByRole($role);
    }

    //
}
