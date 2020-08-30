<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PaymentsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//rute publice
Route::get('/', 'HomeController@home')->name('welcome');
Route::get('jobDetail/{id}','JobsController@getInfo')->name('getJobInfo');
Route::post('/searchJob','JobsController@searchJob')->name('searchJob');

//rute plata
Route::group(['prefix'=>'payments','middleware'=>'auth'], function() {
    Route::get('/checker','PaymentsController@index')->name('checker');
    Route::post('/checker','PaymentsController@checker')->name('checkPayment');
});

//rute student
Route::group(['prefix'=>'user','middleware'=>'auth'], function() {
    Route::get('/interviews','UsersController@viewInterviews')->name('user_interviews');
    Route::get('/documents','UsersController@viewDocuments')->name('user_documents');
    Route::get('/cancel-application/{appId}','ApplicationsController@cancelApplication')->name('cancelApplication');
    Route::get('/my-dashboard','UsersController@dashboard')->name('user_dashboard');
    Route::get('/applications','UsersController@applications')->name('applications');
    Route::get('/apply/{uid}/{jid}','ApplicationsController@store')->name('user_apply');
    Route::post('/generateCv','UsersController@generateCV')->name('generate_cv');
    Route::get('/tests','UsersController@viewTests')->name('user_tests');
    //favourites
    Route::get('/addFav/{jobId}','UsersController@addFav')->name('add_user_fav');
    Route::get('/removeFav{jobId}', 'UsersController@removeFav')->name('remove_user_fav');
    Route::get('/fav-list','UsersController@viewFavList')->name('fav_list');
});

//rute document
Route::group(['prefix'=>'document','middleware'=>'auth'], function(){
    Route::post('/submitDocument','UsersController@submitDocument')->name('document_submit');
    Route::get('/viewDocument/{storage_path}','UsersController@viewDocument')->name('view_document');
    Route::get('/deleteDocument/{id}','UsersController@deleteDocument')->name('delete_document');
});

//rute manager
Route::group(['prefix'=>'manager','middleware'=>'auth'], function() {
    Route::get('/manApps','ManagerController@displayApplications')->name('manApplications');
    Route::post('/addInterview','ManagerController@addInterview')->name('addInterview');
    Route::get('/manInterviews','ManagerController@displayInterviews')->name('manInterviews');
    Route::get('/modifyInterview/{status}/{intId}/{userId}','ManagerController@modifyInterview')->name('modifyInt');
    Route::get('/userProfile/{userId}','ManagerController@displayStudentProfile')->name('student_info');
    Route::post('/addTest','ManagerController@addTest')->name('addTest');
    Route::get('/viewAddTest','ManagerController@viewAddTest')->name('viewAddTest');
});

Auth::routes();


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
