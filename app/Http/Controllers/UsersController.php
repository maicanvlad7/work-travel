<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Application;
use Illuminate\Support\Facades\Auth;
use App\Helpers\CheckRole;
use App\Helpers\GetGeneralStats;
use Illuminate\Support\Facades\DB;
use App\Interview;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Validation\Rules\In;
use Illuminate\Support\Facades\Storage;
use App\Document;
use App\Helpers\FavCheck;

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

    public function applications() {


        $applications = Application::with('job')->where([
            'user_id' => Auth::id()
        ])->paginate(3);

        $data = GetGeneralStats::getUserStats(Auth::user()->id);
        $data->applications = $applications;

        return view('user.applications', compact('data'));
    }

    public function viewDocuments() {

        $document = DB::table('documents')
            ->where(['user_id'=>Auth::user()->id])
            ->get();

        $data =  $data = GetGeneralStats::getUserStats(Auth::user()->id);
        $data->document = $document;

        return view('user.documents', compact('data'));
    }

    public function viewDocument($name) {
        $path = Storage::disk('public')->url($name);
        return response()
            ->download($path, "Work&Travel Document",
                [
                    'Content-Type' => 'application/octet-stream'
                ]);
    }

    public function deleteDocument($id) {
        $document = Document::where(['id'=>$id])->first();

        //stergem din storage documentul si daca e ok stergem si din baza de date
        if (Storage::disk('public')->delete($document->storage_path) ) {
            Document::where(['id'=>$id])->delete();
        }

        return back()->with('success','Document sters cu succes.');
    }

    public function submitDocument(Request $request) {

        request()->validate([
            'fileName' => 'required',
            'fileName.*' => 'mimes:doc,docx,pdf,txt,jpeg,png,jpg,gif,svg'
        ]);

        if ($files = $request->file('fileName')) {
            $userDocument = new Document();

            $fileName = Auth::id().'CV.'.$files->extension();
            Storage::disk('public')->put($fileName,file_get_contents($files));

            $userDocument->user_id = Auth::id();
            $userDocument->storage_path = $fileName;
            $userDocument->type = 'CV';
            $userDocument->save();

            return back()->with('success','Document adaugat cu succes.');
        }

    }

    public function viewInterviews() {

        $interviews = Interview::with('job')->where([
                'user_id' => Auth::id(),
            ]
        )->paginate(3);

        $data = GetGeneralStats::getUserStats(Auth::user()->id);
        $data->interviews = $interviews;

        return view('user.interviews',compact('data'));
    }


    public function generateCv(Request $request) {

        $request->validate([
            'firstName' => 'required|string',
            'lastName' => 'required|string',
            'email' => 'required|string',
            'phone' => 'required|string'
        ]);

        $data = (object)[];
        $data->firstName = $request->input('firstName');
        $data->lastName = $request->input('lastName');
        $data->email = $request->input('email');
        $data->phone = $request->input('phone');
        $data->experience = $request->input('experience');

        return view('pdf.template', compact('data'));

    }

    public function viewTests() {
        $tests = DB::table('tests')
            ->where([
                'user_id' => Auth::id()
            ])->paginate(5);

        $data = GetGeneralStats::getUserStats(Auth::user()->id);
        $data->tests = $tests;

        return view('user.tests', compact('data'));
    }


    public function addFav($jobId) {

        $isAdded = FavCheck::checkJob($jobId);

        if(!$isAdded) {
            return back()->with('success','Acest job este deja in lista de favorite');
        }

        //daca nu este adaugat il adaugam
        $insertion = DB::table('favourites')->insert([
            'user_id' => Auth::id(),
            'job_id' => $jobId
        ]);

        if($insertion) {
            return back()->with('success','Job adaugat in lista de favorite cu succes');
        } else {
            return back()->with('success','Adaugarea jobului in lista de favorite a esuat');
        }

    }

    public function removeFav($jobId) {
        $delete = DB::table('favourites')->where([
            'user_id' => Auth::id(),
            'job_id' => $jobId
        ])->delete();

        if($delete) {
            return back()->with('success','Job inlaturat cu succes din lista de favorite');
        } else {
            return back()->with('success','Te rugam incearca mai tarziu');
        }
    }

    public function viewFavList() {
        $favLocations = FavCheck::getFavList(Auth::id());

        $data = GetGeneralStats::getUserStats(Auth::user()->id);
        $data->jobInfo = [];
        $data->favList = FavCheck::getFavList(Auth::id());

        foreach($favLocations as $fav) {
            array_push($data->jobInfo,DB::table('jobs')->where([
                'id' => $fav,
            ])->get());
        }





        return view('user.favs',compact('data'));

    }

}
