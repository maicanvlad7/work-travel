<?php

namespace App\Helpers;

use App\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GetGeneralStats{

    public static function getUserStats($userId) : object {

        $stats = (object)[];

        $stats->nrAplicatii = DB::table('applications')
            ->where([
                'user_id' => $userId,
            ])->count();

        $stats->nrInterviuri = '0';
        $stats->nrTeste = '0';

        return $stats;
    }

    public static function getGeneralInfo() : object {

        $count = (object)[];

        $count->aplicatii = DB::table('applications')->count();
        $count->interviuri = DB::table('interviews')->count();
        $count->studenti = DB::table('users')->where([
            'roles' => 'Student'
        ])->get()->count();

        return $count;
    }

}
