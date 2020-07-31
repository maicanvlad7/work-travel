<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Console\Input\Input;
use Illuminate\Support\Facades\Redirect;

class PaymentsController extends Controller
{
    public function index()
    {
        return view('payments.checker');
    }

    public function checker(Request $request)
    {
        if ( DB::table('payments')
            ->where('token','=',$request->input('token'))
            ->where('used','=','0')
            ->count() ) {
            return redirect('register');
        } else {
            return Redirect::back()
                ->withErrors('The token provided doesnt exist or was already used. Please try again!');
        }
    }
}
