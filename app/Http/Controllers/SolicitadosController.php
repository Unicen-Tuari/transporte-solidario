<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Models\NavigationModel;

class SolicitadosController extends Controller
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

    public function getViajes(){
      return array(
        'id' =>24 ,
        'partida' => 'Tandil',
        'destino' => 'Tandil',
        'ONG' => 'Mesa Solidaria'
      );
    }
    //
}
