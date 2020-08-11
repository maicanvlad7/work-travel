<?php

namespace App\Helpers;

use App\Application;
use Illuminate\Support\Facades\DB;

class ChangeStatus{

    public static function change(string $status, int $userId, int $jobId) : bool {

        DB::table('applications')
            ->where([
                'job_id' => $jobId,
                'user_id' => $userId,
                'status' => 'Pending'
            ])->update(['status'=>$status]);

        //@TODO in functie de rezultat, daca aduce ceva ne uitam ce status are

    }
}
