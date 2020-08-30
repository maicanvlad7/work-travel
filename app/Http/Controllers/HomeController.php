<?php

namespace App\Http\Controllers;

use App\Helpers\FavCheck;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function home()
    {
        $jobsData = DB::table('jobs')->where('available_positions','>','0')->get();

        $data = (object)[];
        $data->jobsData = $jobsData;
        $data->favList = FavCheck::getFavList(Auth::id());


        return view('welcome', compact('data'));
    }
}
