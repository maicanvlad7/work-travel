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

        $stats->nrInterviuri = DB::table('interviews')
            ->where([
                'user_id' => $userId
            ])
            ->count();


        $stats->nrTeste = DB::table('tests')
            ->where('user_id','=',$userId)
            ->count();

        return $stats;
    }

    public static function getGeneralInfo() : object {

        $count = (object)[];

        $count->aplicatii = DB::table('applications')->where(['status'=>'Pending'])->count();
        $count->interviuri = DB::table('interviews')->count();
        $count->studenti = DB::table('users')->where([
            'roles' => 'Student'
        ])->get()->count();

        return $count;
    }

}
