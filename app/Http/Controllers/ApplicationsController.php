<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Application;
use App\Helpers\CheckApplication;
use App\Interview;

class ApplicationsController extends Controller
{
    //
    public static function store($userId,$jobId)
    {
        $data = [
            'user_id' => $userId,
            'job_id' => $jobId,
            'status' => 'Pending',
            'interview_id' => '0'
        ];

        if ( CheckApplication::check($userId) ){

            Application::create($data);
            return back()->with(['success'=>'da']);

        }else{
            return back()->withErrors(['validare'=>'Ati aplicat deja la un alt loc de munca.']);
        }

    }

    public function cancelApplication($appId){
        if (
            Application::where([
            'id' => $appId
        ])->update([
            'status' => 'Cancelled'
        ])) {
            return back()->with(['success'=>'Aplicatie anulata cu succes']);
        }else {
            return back();
        }
    }
}
