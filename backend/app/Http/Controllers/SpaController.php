<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SpaController extends Controller
{

    /**
     * Retourne la vue "angular" qui est utilisée pour afficher l'interface utilisateur de l'application.
     * @return Illuminate\View\View : La vue "angular" qui sera renvoyée à l'utilisateur.
     */
    public function index()
    {
        return view('angular');
    }

    /**
     * Retourne la vue "admin" qui est utilisée pour afficher l'interface d'administration de l'application.
     * @return Illuminate\View\View : La vue "admin" qui sera renvoyée à l'utilisateur.
     */
    public function admin()
    {
        return view('admin');
    }

}
