<?php

namespace App\Http\Models;

use PDO;

class ViajeModel extends Model
{


    /**
     * Create a new Navigation Model instance.
     *
     * @return void
     */
    public function __construct()
    {
      parent::__construct();
    }
    public function getViajes() {
      $consulta_return=[];

      $viajes=[];

      $sel_ong=$this->db->prepare("SELECT name FROM users u, viajesolidario v where not (u.name='admin') AND (v.habilitado) GROUP BY name");
      $sel_ong->execute();
      $ongs=$sel_ong->fetchAll(PDO::FETCH_ASSOC);
      $consulta_return['ongs']=$ongs;

      $sel_fre=$this->db->prepare("SELECT frecuencia FROM viajesolidario where (habilitado) GROUP BY frecuencia");
      $sel_fre->execute();
      $frecuencias=$sel_fre->fetchAll(PDO::FETCH_ASSOC);
      $consulta_return['frecuencias']=$frecuencias;

      $sel_dest=$this->db->prepare("SELECT destino FROM viajesolidario where (habilitado) GROUP BY destino");
      $sel_dest->execute();
      $destinos=$sel_dest->fetchAll(PDO::FETCH_ASSOC);
      $consulta_return['destinos']=$destinos;

      $select = $this->db->prepare("SELECT * FROM viajesolidario where habilitado");
      $select->execute();
      $auxViajes=$select->fetchAll(PDO::FETCH_ASSOC);
      foreach ($auxViajes as $key => $viaje) {
        $select2=$this->db->prepare("SELECT name, telefono, email, img_path FROM users where id LIKE ? ");
        $select2->execute(array($viaje['id_ong']));
        $usONG=$select2->fetchAll(PDO::FETCH_ASSOC);
        $viaje['name']=$usONG[0]['name'];
        $viaje['telefono']=$usONG[0]['telefono'];
        $viaje['email']=$usONG[0]['email'];
        $viaje['img_path']=$usONG[0]['img_path'];
        $resultado = $this->db->prepare('SELECT * FROM viaje_realizado where id_viaje LIKE ? AND id_transportista=3 '); // en lugar de 3 tendria que ir el id del usuario (transportista) que esta logueado en el momento
        $resultado->execute(array($viaje['id_viaje']));
        $viaje['loHice']= $resultado->fetchColumn()>0;
        $viajes[]=$viaje;
      }
      $consulta_return['viajes']=$viajes;

      return $consulta_return;

    }
    public function ofrecerme($id_tr,$id_viaj)
    {

    }
}
