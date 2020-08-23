<?php

namespace App\Http\Controllers;

use App\Helpers\CheckRole;
use App\Interview;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Application;
use App\Helpers\GetGeneralStats;
use App\Helpers\ChangeStatus;
use App\Helpers\DecreasePos;

class ManagerController extends Controller
{

    public function displayApplications() {


       $data = GetGeneralStats::getGeneralInfo();
       $data->applications = Application::with(['job','user'])
           ->where('status','=','Pending')
           ->paginate(5);

       return view('manager.applications', compact('data'));
   }

   public static function modifyInterview(bool $status, int $intId, int $userId) {
       //daca status este 1 il acceptam, daca este 0 il refuzam

       $job = DB::table('interviews')->where([
           'id' => $intId
       ])->first();

       if($status) {
           //modificam status interviu in angajat
           DB::table('interviews')->where([
               'id' => $intId,
               'status' => 'Pending'
           ])->update([
               'status'=>'Angajat']
           );

           DecreasePos::decrease($job->job_id);

           return back()->with(['success'=>'Angajare efectuata cu succes']);
       } else {
           //modificam status in respins
           DB::table('interviews')->where([
               'id' => $intId,
               'status' => 'Pending'
           ])->update([
                   'status'=>'Respins']
           );

           ChangeStatus::cancelApplication($userId);

           return back()->with(['success'=>'Anulare efectuata cu succes']);
       }
   }


   public function addInterview(Request $request) {


       //insert interview
       DB::table('interviews')->insert([
           'user_id' => $request->input('user_id'),
           'job_id' => $request->input('job_id'),
           'date' => $request->input('date_time'),
           'status' => 'Pending'
       ]);

       ChangeStatus::change('Accepted',$request->input('user_id'),$request->input('job_id'));


       return 1;

   }

    public function displayInterviews() {

        $data = GetGeneralStats::getGeneralInfo();
        $data->interviews = Interview::with(['job','user'])
            ->where('status','=','Pending')
            ->paginate(5);

        return view('manager.interviews', compact('data'));

    }

    public function displayStudentProfile($userId) {
        //datele despre student
        $student = DB::table('users')
            ->where([
                'id' => $userId
            ])->first();

        //documentele studentului (momentan folosim FIRST pentru ca poate avea un singur document adica CV-ul)
        $document = DB::table('documents')
            ->where([
                'user_id' => $userId
            ])->get();

        $data = GetGeneralStats::getGeneralInfo();
        $data->document = $document;
        $data->student = $student;


        return view('manager.studentInfo', compact('data'));

    }

    public function displayStudents() {

    }



}
