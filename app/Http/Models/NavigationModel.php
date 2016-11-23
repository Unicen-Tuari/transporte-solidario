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

    public function findByRole($id_role){
      if($id_role == 1){
        $sth = $this->db->prepare("SELECT m.*
                                   FROM menu m INNER JOIN role_menu rm
                                   ON(m.id = rm.id_menu)
                                   WHERE rm.id_role = 1");
        $sth->execute();
      }
      else{
        $sth = $this->db->prepare("SELECT m.*
                                 FROM menu m INNER JOIN role_menu rm
                                 ON(m.id = rm.id_menu) INNER JOIN users u
                                 ON(rm.id_role = u.id_role)
                                 WHERE u.id_role = ?");
        $sth->execute(array($id_role));
      }

      return $sth->fetchAll(PDO::FETCH_OBJ);
    }


    //
}
