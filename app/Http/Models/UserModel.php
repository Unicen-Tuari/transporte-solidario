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

    public function getUsers() {
      $users = $this->db->prepare("SELECT * FROM users");
      $users->execute();
      return $users->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getUserById($id) {
      $user = $this->db->prepare("SELECT * FROM users WHERE id = ?");
      $user->execute(array($id));
      return $user->fetchAll(PDO::FETCH_ASSOC);
    }

}
