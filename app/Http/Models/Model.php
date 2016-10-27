<?php

namespace App\Http\Models;

use Illuminate\Support\Facades\DB;

class Model
{
  protected $db;
    //
    public function __construct(){
      $this->db = DB::connection()->getPdo();
    }
}
