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

Route::get('/', 'HomeController@home')->name('welcome');

Route::get('jobDetail/{id}','JobsController@getInfo')->name('getJobInfo');

Route::get('/checker','PaymentsController@index')->name('checker');
Route::post('/checker','PaymentsController@checker')->name('checkPayment');

Route::get('/apply/{uid}/{jid}','ApplicationsController@store')->name('user_apply');

Route::get('/my-dashboard','UsersController@dashboard')->middleware(['auth'])->name('user_dashboard');
Route::get('/applications','UsersController@applications')->middleware(['auth'])->name('applications');
Route::get('/cancel-application/{appId}','ApplicationsController@cancelApplication')->middleware(['auth'])->name('cancelApplication');

Route::get('/simPdf','UsersController@showPdf')->name('show-pdf');

Route::get('/manApps','ManagerController@displayApplications')->middleware('auth')->name('manApplications');
Route::post('/addInterview','ManagerController@addInterview')->middleware('auth')->name('addInterview');

Auth::routes();


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
