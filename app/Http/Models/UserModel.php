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
      $user->execute([$id]);
      return $user->fetch(PDO::FETCH_ASSOC);
    }

/* Comentamos la función ya que no se usa.
    public function getLogin($name) {
      $user = $this->db->prepare("SELECT email, password FROM users WHERE email = ?");
      $user->execute(array($name));
      return $user->fetchAll(PDO::FETCH_ASSOC);
    }
*/

    public function saveImg($user,$image) {
      //$this->$db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      //try {
        //$this->$db->beginTransaction();
        $insertImg = $this->db->prepare("UPDATE users SET img_path = ? WHERE id = ?");
        $insertImg->execute(array($image, $user));
        /*$this->$db->commit();
      } catch(PDOException $ex) {
        $this->$db->rollBack();
        log($ex->getMessage());
      }*/
    }

    public function setRegister($name,$email,$b64Pass,$facebook,$webpage,$descripcion,$telefono,$tipo_usuario) {
      //$this->$db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      //try {
        $dateTime = date_create('now')->format('Y-m-d');
        $img = "img/user-icon.png";
        $password = base64_decode($b64Pass); // decodfico pass recibida a texto plano
        $hash = password_hash($password, PASSWORD_DEFAULT); // codifico pass para guardar en BD
        $hash = str_replace("$2y$","$2a$",$hash); // saco $2y por $2a por bug crypt_blowfish
        //$this->$db->beginTransaction();
        $insertUser = $this->db->prepare("INSERT INTO users(name,email,password,facebook,webpage,descripcion,telefono,id_role,fecha_alta,img_path) VALUES(?,?,?,?,?,?,?,?,?,?)");

        $insertUser->execute(array($name,$email,$hash,$facebook,$webpage,$descripcion,$telefono,$tipo_usuario,$dateTime,$img)); // coloco imagen por defecto
        $id = $this->db->lastInsertId();
        return $this->getUserById($id);

        /*$this->$db->commit();
      } catch(PDOException $ex) {
        $this->$db->rollBack();
        log($ex->getMessage());
      }*/
    }

    public function getUsers(){
      $getUsers = $this->db->prepare("SELECT * FROM users");
      $getUsers->execute();
      $users=$getUsers->fetchAll(PDO::FETCH_ASSOC);
      $return=[];
      foreach ($users as $key => $user) {
        $ong = ($user['id_role']==3);
        $user['ong'] = $ong;
        $return[] = $user;
      }
      return $return;
    }

    public function setRol($id,$rol){
      $insert = $this->db->prepare("UPDATE users SET id_role = ? WHERE id =?");
      $insert->execute(array($rol,$id));
    }

    public function getRoles(){
      $getRoles = $this->db->prepare("SELECT id, name FROM role");
      $getRoles->execute();
      $roles = $getRoles->fetchAll(PDO::FETCH_ASSOC);
      $return=[];
      foreach ($roles as $key => $rol) {
        if ($rol['id']!=2)
          $return[] = $rol;
      }
      return $return;
    }
}
