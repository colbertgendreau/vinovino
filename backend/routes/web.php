<?php

use App\Http\Controllers\SpaController;
use Illuminate\Support\Facades\Route;
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

//Route::get('/', function () {
//    return view('welcome');
//});


Route::group(['prefix'=>'profil'],function (){

    Route::get('/{any_path}',[SpaController::class, 'index'])->where('any_path', '(.*)');
//    Route::get('/{any_path}','SpaController@index')->where('any_path', '(.*)');

});

Route::group(['prefix'=>'admin'],function (){
    Route::get('/{any_path}',[SpaController::class, 'admin'])->where('any_path', '(.*)');
//    Route::get('/{any_path}','SpaController@index')->where('any_path', '(.*)');
});

Route::get('admin', function () {
	return view('admin');
});


Route::get('', function () {
    return redirect('connexion');
});
Route::get('connexion', function () {
    return view('angular');
});



