<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Features;

class Jobs extends Model
{
    public function applications(){
        $this->hasMany('App\Applications','job_id','id');
    }

    public function interviews(){
        $this->hasMany('App\Interview','job_id','id');
    }

}
