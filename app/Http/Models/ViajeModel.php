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
      $viajes = $this->db->prepare("SELECT * FROM viajesolidario ");
      $viajes->execute();
      return $viajes->fetchAll(PDO::FETCH_ASSOC);

    }
    public function getViaje($id) {
      $viajes = $this->db->prepare("SELECT * FROM viajesolidario WHERE id_viaje=?");
      $viajes->execute([$id]);
      return $viajes->fetch(PDO::FETCH_ASSOC);

    }
    public function addViaje($origen,$destino,$fecha,$id_ong,$frecuencia,$ancho,$alto,$peso) {
      $consulta = $this->db->prepare('INSERT INTO viajesolidario(origen,destino,fecha_creac,id_ong,habilitado,frecuencia,ancho,alto,peso) VALUES(?,?,?,?,?,?,?,?,?)');
      $consulta->execute(array($origen,$destino,$fecha,$id_ong,1,$frecuencia,$ancho,$alto,$peso));
      $id=$this->db->lastInsertId();
      return $this->getViaje($id);
    }

    public function getViajesRealizados($orden,$estado){
      //hacer con if si viene estado por defecto cargar como esta
      //si no agregar a la misma sentencia agregar where por el estado que viene
      if ($estado != 0){
        $realizados = $this->db->prepare("SELECT * FROM viaje_realizado VR join viajesolidario VS on VR.id_viaje=VS.id_viaje where VR.estado=? ORDER BY $orden");
        $realizados->execute([$estado]);
        return $realizados->fetchAll(PDO::FETCH_ASSOC);
      }else{
      $realizados = $this->db->prepare("SELECT * FROM viaje_realizado VR join viajesolidario VS on VR.id_viaje=VS.id_viaje ORDER BY $orden");
      $realizados->execute();
      return $realizados->fetchAll(PDO::FETCH_ASSOC);}
    }

}
