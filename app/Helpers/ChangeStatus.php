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

        return 1;

        //@TODO in functie de rezultat, daca aduce ceva ne uitam ce status are

    }

    public static function cancelApplication(int $userId): bool {
        DB::table('applications')
            ->where([
                'user_id' => $userId
            ])->latest()->update([
                'status'=>'Rejected'
            ]);

        return 1;
    }
}
