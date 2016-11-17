<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Models\viajeModel;

class ViajesController extends Controller
{

    protected $model;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
      $this->model = new ViajeModel;
        //
    }

    public function getViaje($id){
      return array(
        'id' => $id,
        'partida' => 'Tandil',
        'destino' => 'Tandil',
        'ONG' => 'Mesa Solidaria'
      );
    }
/*
    $order = null;
    $valor = null;
    $campo = null;
    if(isset($_Request['orderby']){
    $order =$_Request['orderby']
    }
    
    if(isset($_Request['destino']){
      $campo='destino';
      $valor =$_Request['destino']
    }
    else{
      if(isset($_Request['ONG']){
        $campo='ong';
        $valor =$_Request['ong']
      }
      else
      if(isset($_Request['frecuencia']){
        $campo='frecuencia';
        $valor =$_Request['frecuencia']
      }
    }
    model->getviajes(orden, campo, valor);

*/



  public function getViajes(){
          $var=new \stdClass;
          $var->data=$this->model->getViajes();
                      /*  array(array(
            'id' => 1,
            'partida' => 'Tandil',
            'destino' => 'Tandil',
            'ONG' => 'Mesa Solidaria'),
            array(
            'id' => 2,
            'partida' => 'Tandil',
            'destino' => 'Tandil',
            'ONG' => 'Mesa Solidaria')
          );*/
          return json_encode($var);


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
