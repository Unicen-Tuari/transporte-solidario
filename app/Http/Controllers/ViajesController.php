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
          $var->data=array(array(
            'id' => 1,
            'partida' => 'Tandil',
            'destino' => 'Tandil',
            'ONG' => 'Mesa Solidaria'),
            array(
            'id' => 1,
            'partida' => 'Tandil',
            'destino' => 'Tandil',
            'ONG' => 'Mesa Solidaria')
          );
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

    public function getHistory($id){
      $var=new \stdClass;
      $var->data=array(
                      array(
                            'id' => 14125,
                            'fecha_inicio' => '02/05/2016',
                            'fecha_final' => '02/05/2016',
                            'colaborador' => 'Los Sauces S.A.',
                            'destino' => 'Tandil',
                            'partida' => 'Rauch',
                            'tamanio' => '2 Plazas',
                            'peso' => '22 kg',
                            'distancia' => '129 km'
                          ),
                      array(
                            'id' => 102938,
                            'fecha_inicio' => '02/05/2016',
                            'fecha_final' => '02/05/2016',
                            'colaborador' => 'Juan Carlos Perez',
                            'destino' => 'Mar del Plata',
                            'partida' => 'Tandil',
                            'tamanio' => '1 Plaza',
                            'peso' => '7 kg',
                            'distancia' => '277 km'
                          )
                      );
      return json_encode($var);
    }

    //
}
