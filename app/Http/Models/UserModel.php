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

    public function getUserById($id) {
      $user = $this->db->prepare("SELECT * FROM users WHERE id = ?");
      $user->execute(array($id));
      return $user->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getLogin($name) {
      $user = $this->db->prepare("SELECT name, password FROM users WHERE name = ?");
      $user->execute(array($name));
      return $user->fetchAll(PDO::FETCH_ASSOC);
    }

    public function copyImage($image){
      $path = $image["name"];
      copy($image["tmp_name"], $path);
      return $path;
    }

    public function setRegister($user) {
      //$this->$db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      //try {
        $dateTime = date_create('now')->format('Y-m-d');
        //$this->$db->beginTransaction();
        $path_image =  $this->copyImage($user['img_path']);
        $insertDance = $this->db->prepare("INSERT INTO users(name,email,password,facebook,webpage,descripcion,telefono,tipo_usuario,fecha_alta,img_path) VALUES(?,?,?,?,?,?,?,?,?,?)");
        $insertDance->execute(array($user['name'],$user['email'],$user['password'],$user['facebook'],$user['webpage'],$user['descripcion'],$user['telefono'],$user['tipo_usuario'],$dateTime,$path_image));
        $this->$db->commit();
      /*} catch(PDOException $ex) {
        $this->$db->rollBack();
        log($ex->getMessage());
      }*/

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

}
