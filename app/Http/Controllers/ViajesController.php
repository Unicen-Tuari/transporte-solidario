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
      $var=new \stdClass;
      $origen = $request->input('origen');
      $destino = $request->input('destino');
      $fecha = $request->input('fecha');
      $id_ong = $request->input('id_ong');
      $frecuencia = $request->input('frecuencia');
      $ancho = $request->input('ancho');
      $alto = $request->input('alto');
      $peso = $request->input('peso');
      $var=$this->model->addViaje($origen,$destino,$fecha,$id_ong,$frecuencia,$ancho,$alto,$peso);
      return $var;
    }

}
