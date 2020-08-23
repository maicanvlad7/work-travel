<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Helpers\CheckRole;

class JobsController extends Controller
{
    //afisare un singur job si detalii despre el
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

    public function searchJob(Request $request) {
        $request->validate([
            'searchQuery' => 'required|string'
        ]);

        $query = "SELECT * FROM jobs WHERE available_positions > 0 AND title LIKE '%".$request->input('searchQuery')."%'";

        //construim query-ul
        //minWage
        if($request->has('minWage') && !empty($request->input('minWage'))) {
           $query = $query . ' AND rate >'. $request->input('minWage');
        }

        //maxHrs
        if($request->has('maxHrs') && !empty($request->input('maxHrs'))) {
            $query = $query . ' AND hours <'. $request->input('maxHrs');
        }

        //region
        if($request->has('region') && !empty($request->input('region'))) {
            $query = $query . ' AND region LIKE \''. $request->input('region').'\'';
        }

        $jobsData = DB::select(DB::raw($query));


        $data = (object)[];
        $data->fromSearch = 1;
        $data->jobsData = $jobsData;

        return view('welcome', compact('data'));
    }

}
