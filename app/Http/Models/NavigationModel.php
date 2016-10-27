<?php

namespace App\Http\Models;

use PDO;

class NavigationModel extends Model
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

    public function findAll($rol){
      $rol = isset($rol) ? $rol : '%';
      $sth = $this->db->prepare("SELECT * FROM menu where role LIKE ?");
      $sth->execute(array($rol));
      return $sth->fetchAll(PDO::FETCH_ASSOC);
    }


    //
}
