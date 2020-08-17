<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Interview extends Model
{
    //
    protected $table = 'interviews';
    protected $fillable = ['job_id','user_id','date'];

    public function user(){
        return $this->hasOne('App\User','id','user_id');
    }

    public function job(){
        return $this->hasOne('App\Jobs','id','job_id');
    }
}
