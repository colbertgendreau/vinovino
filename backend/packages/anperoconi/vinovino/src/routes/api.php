<?php
use Anperoconi\Vinovino\Controllers\VinovinoController;
use http\Client\Request;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'api'
], function ($router) {
    Route::get('pages', [VinovinoController::class, 'getMaxPages']);
    Route::get('progres', [VinovinoController::class, 'pourcentage']);
    Route::get('description', [VinovinoController::class, 'pourcentagedetails']);
    Route::get('test', [VinovinoController::class, 'donnees']);
   // Route::get('execute', [VinovinoController::class, 'execute']);

    Route::get('executetest', function ( ) {
        dispatch(new App\Jobs\Crawler('13584455'));

        return 'Crawler job dispatched tests';
    });

    Route::post('execute', function ( ) {
        dispatch(new App\Jobs\VinovinoJob());
        return 'Crawler job dispatched test';
    });

    Route::post('details', [VinovinoController::class, 'executehard']);
    Route::get('executedetailstest', [VinovinoController::class, 'executehardtest']);

    Route::post('execute', [VinovinoController::class, 'execute']);
    Route::get('/vinovino', VinovinoController::class);
});

