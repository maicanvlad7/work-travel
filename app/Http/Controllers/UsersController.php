<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Application;
use Illuminate\Support\Facades\Auth;
use App\Helpers\CheckRole;
use App\Helpers\GetGeneralStats;
use Illuminate\Support\Facades\DB;

class UsersController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function dashboard(){

        //daca este manager
        if(CheckRole::checkManager(Auth::user())){
            //incarcam pagina de manager
            $data = GetGeneralStats::getGeneralInfo();
            
            return view('manager.dashboard', compact('data'));

        }else {

            //aplicatiile utilizatorului
            //$userApp = Application::where(['user_id' => Auth::id()])->get();
            $data = GetGeneralStats::getUserStats(Auth::user()->id);

            return view('user.dashboard', compact('data'));
        }
        //incarcam dashboard diferit pentru fiecare rol de utilizator

    }

    public function applications(){


        $applications = Application::with('job')->where([
            'user_id' => Auth::id()
        ])->paginate(3);

        $data = GetGeneralStats::getUserStats(Auth::user()->id);
        $data->applications = $applications;

        return view('user.applications', compact('data'));
    }

    public function showPdf(Request $request) {

        $request->validate([
            'name' => 'required|string|min:2',
            'skills' => 'required|string'
        ]);

        //luam date din formular (request post) si le aducem aici, dupa validare
        $data = Auth::user();

        return view('pdf.pdf', compact('data'));
    }

}
