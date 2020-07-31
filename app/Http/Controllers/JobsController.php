<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Helpers\CheckRole;

class JobsController extends Controller
{
    public function getInfo($id)
    {

        $jobInfo = DB::table('jobs')->where('id','=',$id)->get()[0];

        if(!empty($jobInfo->facilities)) {

            $facilities = explode(',',$jobInfo->facilities);

            foreach ($facilities as $fac) {
                $facilitiesName[] = DB::table('features')->where('id','=',$fac)->get('name')[0];
            }

            $jobInfo->facilitiesName = $facilitiesName;

        } else {
            $facilitiesName[] = NULL;
        }

        //daca suntem logati verificam rolul
        if (Auth::check()){
            if( CheckRole::checkManager(Auth::user()) ) {
                $jobInfo->canApply = FALSE;
            }
        }

        return view('destination', compact('jobInfo'));
    }

}
