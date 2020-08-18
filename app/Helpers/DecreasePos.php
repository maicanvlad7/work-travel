<?php

namespace App\Helpers;

use App\Application;
use Illuminate\Support\Facades\DB;

class DecreasePos{

    public static function decrease($jobId) {
        //cautam job-ul in lista si scadem nr de locuri disp cu 1
        $currentAv = DB::table('jobs')->select('available_positions')->where([
            'id' => $jobId
        ])->get();

        $currentAv = $currentAv[0]->available_positions - 1;

        if ($currentAv == 0)  {
            die('Acest job nu mai primeste angajati');
        } else {
            //update nr locuri disponibile
            DB::table('jobs')->where([
                'id' => $jobId
            ])->update([
                'available_positions' => $currentAv
            ]);
        }

        return 1;
    }
}
