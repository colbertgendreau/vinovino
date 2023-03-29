<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ScrapperDetailsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


use App\Http\Controllers\BouteilleSAQController;
Route::resource('bouteillesSAQ', BouteilleSAQController::class);

use App\Http\Controllers\CellierController;
Route::resource('celliers', CellierController::class);

use App\Http\Controllers\BouteilleController;
Route::resource('bouteilles', BouteilleController::class);

use App\Http\Controllers\UserController;
Route::resource('utilisateurs', UserController::class);

Route::get('/show/{celliers}', [CellierController::class, 'showCellier']);

Route::get('/showDetail/{bouteille}', [BouteilleController::class, 'showDetail']);

Route::put('/ajoutNote/{bouteille}', [BouteilleController::class, 'ajoutNote']);

Route::get('/crawler', function () {
    dispatch(new App\Jobs\Crawler("13966470"));
    return 'Crawler job dispatched';
});

Route::get('/scrapper', [ScrapperDetailsController::class, 'index'])->name('scrapper');


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {

    Route::post('/login', [AuthController::class, 'login']);
    // Route::post('/loginAdmin', [AuthController::class, 'loginAdmin']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
});
