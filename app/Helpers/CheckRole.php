<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Auth;

class CheckRole {
    public function __construct()
    {
        $this->middleware('auth');
    }

    //returneaza 1 daca este Manager si 0 daca este student
    public static function checkManager($user) {
        if ($user->roles !== 'Student') {
            return 1;
        }else {
            return 0;
        }
    }

}
