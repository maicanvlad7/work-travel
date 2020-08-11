<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Application;
use App\Helpers\GetGeneralStats;
use App\Helpers\ChangeStatus;

class ManagerController extends Controller
{
   public function displayApplications() {


       $data = GetGeneralStats::getGeneralInfo();
       $data->applications = Application::with(['job','user'])
           ->where('status','=','Pending')
           ->paginate(5);

       return view('manager.applications', compact('data'));
   }

   public function addInterview(Request $request) {

       //insert interview
       DB::table('interviews')->insert([
           'user_id' => $request->input('user_id'),
           'job_id' => $request->input('job_id'),
           'date' => $request->input('date_time'),
           'agency' => 'Not defined'
       ]);

       ChangeStatus::change('Accepted',$request->input('user_id'),$request->input('job_id'));

       return 1;

   }

    public function displayInterviews() {

    }

    public function displayStudents() {

    }

}
