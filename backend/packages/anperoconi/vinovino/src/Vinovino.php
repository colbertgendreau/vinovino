<?php

namespace Anperoconi\Vinovino;

use Illuminate\Support\Facades\Http;
use SAQ;

/**
 * Class Vinovino
 * Classe qui gère les appels au script de la SAQ
 *
 *

 * @version 0.1
 * @doc https://adevait.com/laravel/how-to-create-a-custom-package-for-laravel
 *
 *
 */
class Vinovino {
    public function recuperer() {
        $response = Http::get('https://inspiration.goprogram.ai/');
        return $response['quote'] . ' -' . $response['author'];
    }

    public function creerListeBouteilles() {
        // Le code de qui crée la liste de bouteilles devrait être ici

        $saq = new SAQ();

        $response = Http::get('https://inspiration.goprogram.ai/');
        return $response['quote'] . ' -' . $response['author'];
    }
}
