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

}
