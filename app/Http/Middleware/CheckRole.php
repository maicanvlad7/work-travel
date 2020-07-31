<?php

namespace App\Http\Middleware;

use Illuminate\Cookie\Middleware\CheckRole as Middleware;

class CheckRole extends Middleware{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function check($role)
    {
        
    }

}
