<?php

namespace App\Helpers;

use App\Application;

class CheckApplication{

    public static function check(int $userId) : bool {

        $app = Application::where([
            'user_id' => $userId,
        ])->get();

        foreach ($app as $au){
            if ($au->status !== 'Respins'){
                return 0;
            }
        }

        return 1;










        //@TODO in functie de rezultat, daca aduce ceva ne uitam ce status are

    }
}
