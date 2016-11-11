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



    //
}
