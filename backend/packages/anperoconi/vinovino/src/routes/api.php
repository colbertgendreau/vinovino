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
    Route::get('test', [VinovinoController::class, 'donnees']);
   // Route::get('execute', [VinovinoController::class, 'execute']);


    Route::post('execute', function ( ) {
        dispatch(new App\Jobs\VinovinoJob());
        return 'Crawler job dispatched test';
    });

    Route::post('execute', [VinovinoController::class, 'execute']);

    dispatch(new App\Jobs\Crawler("13966470"));
    Route::post('execute', [VinovinoController::class, 'execute']);
    Route::get('/vinovino', VinovinoController::class);
});

