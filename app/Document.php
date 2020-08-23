<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    //
    protected $table = "documents";
    protected $fillable = ['user_id','storage_path','type'];
}
