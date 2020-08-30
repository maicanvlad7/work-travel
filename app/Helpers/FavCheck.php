<?php

namespace App\Helpers;

use App\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class FavCheck{

    public static function checkJob($jobId) {

        $job = DB::table('favourites')->where([
            'user_id' => Auth::id(),
            'job_id' => $jobId,
        ])->get();

        if (isset($job) && count($job) > 0) {
            return 0;
        } else {
            return 1;
        }
    }

    public static function getFavList($userId) {

        $finalFavList = [];

        $added = DB::table('favourites')->select('job_id')->where([
            'user_id' => $userId
        ])->get();

        foreach($added as $ad) {
            array_push($finalFavList,$ad->job_id);
        }

        return $finalFavList;
    }

}
