<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Application;
use Illuminate\Support\Facades\Auth;
use App\Helpers\CheckRole;

class UsersController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function dashboard(){

        if(CheckRole::checkManager(Auth::user())){
            //incarcam pagina de manager
            $managerInfo = (object)[];
            $managerInfo->name = 'Codruta';
            return view('manager.dashboard', compact('managerInfo'));
        }else {
            //incarcam pagina de student si aplicatiile lui
            $userApp = Application::where(['user_id' => Auth::id()])->get();

            return view('user.dashboard', compact('userApp'));
        }
        //incarcam dashboard diferit pentru fiecare rol de utilizator

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
