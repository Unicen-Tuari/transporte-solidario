<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NavController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function menu($rol){
      if($rol == 'ong'){
        return array(
          'Viajes solicitados' => '#viajes-solicitados',
          'Transportes' => '#transportes'
        );
      }
      if($rol == 'transporte'){
        return array(
          'Viajes realizados' => '#viajes-realizados'
        );
      }

    }

    public function addViaje(Request $request){
      $partida = $request->input('partida');
      //REPOSITORIO
      return array(
        'id' => 'nuevo id',
        'partida' => $partida
      );
    }

    //
}
