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

      $sel_ong=$this->db->prepare("SELECT name FROM users u, viajesolidario v where not (u.name='SysAdmin') AND (v.habilitado) GROUP BY name");
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

    public function ofrecerme($id_tr,$id_viaj)
    {
      $insertDance = $this->db->prepare("INSERT INTO ofrecido(id_viaje,id_transportista,oferta_activa) VALUES(?,?,?)");
      $insertDance->execute(array($id_viaj,$id_tr,1));
    }

    public function getOfrecidosAmisViajes($id)
     {
      $viajes_to_return=[];
      $vj=[];
      $Ofrc=[];
      $sel_ong=$this->db->prepare("SELECT * FROM users where id=?");
      $sel_ong->execute(array($id));
      $ong=$sel_ong->fetchAll(PDO::FETCH_ASSOC);

        if ($ong[0]['id_role']==3){
          $sel_viajes= $this->db->prepare("SELECT * FROM viajesolidario where id_ong=?");
          $sel_viajes->execute(array($id));
          $viajes=$sel_viajes->fetchAll(PDO::FETCH_ASSOC);
        }
        if ($ong[0]['id_role']==2){
          $sel_viajes= $this->db->prepare("SELECT * FROM viajesolidario ");
          $sel_viajes->execute();
          $viajes=$sel_viajes->fetchAll(PDO::FETCH_ASSOC);
            }
        foreach ($viajes as $key => $viaje){
          $sel_ofrecidos=$this->db->prepare("SELECT id_transportista FROM ofrecido where id_viaje=? AND oferta_activa");
          $sel_ofrecidos->execute(array($viaje['id_viaje']));
          $ofrecidos=$sel_ofrecidos->fetchAll(PDO::FETCH_ASSOC);
          foreach ($ofrecidos as $key => $ofrecido){
            $sel_transp=$this->db->prepare("SELECT name,email,telefono FROM users where id=?");
            $sel_transp->execute(array($ofrecido['id_transportista']));
            $transporte=$sel_transp->fetchAll(PDO::FETCH_ASSOC);
            $ofrecido['name']=$transporte[0]['name'];
            $ofrecido['email']=$transporte[0]['email'];
            $ofrecido['telefono']=$transporte[0]['telefono'];
            $Ofrc[]=$ofrecido;
          }
          $viaje['ofrecidos']=$Ofrc;
          $vj[]=$viaje;
        }
        $viajes_to_return[]=$vj;
       return $viajes_to_return;
    }

}
