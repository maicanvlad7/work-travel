<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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


        return view('destination', compact('jobInfo'));
    }

}
