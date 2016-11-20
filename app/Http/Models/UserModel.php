<?php

namespace App\Http\Models;

use PDO;

class UserModel extends Model
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

    public function getUsers(){
      $getUsers = $this->db->prepare("SELECT * FROM users");
      $getUsers->execute();
      $users=$getUsers->fetchAll(PDO::FETCH_ASSOC);
      $return=[];
      foreach ($users as $key => $user) {
        $ong = ($user['tipo_usuario']=='ong');
        $user['ong'] = $ong;
        $return[] = $user;
      }
      return $return;

      // $getUsers = $this->db->prepare("SELECT *, IF(`tipo_usuario`='ong', TRUE, FALSE) AS ong FROM users");
      // $getUsers->execute();
      // return $getUsers->fetchAll(PDO::FETCH_ASSOC);
    }

    public function setRol($id,$rol){
      $insert = $this->db->prepare("UPDATE users SET tipo_usuario = ? WHERE id =?");
      $insert->execute(array($rol,$id));
    }

    //
}
