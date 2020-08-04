<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    //
    protected $table = 'applications';
    protected $fillable = ['job_id','user_id','status','interview_id'];

    public function job(){
        return $this->hasOne('App\Jobs','id','job_id');
    }
}
