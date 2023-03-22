<?php
namespace Anperoconi\Vinovino\Controllers;

use Illuminate\Http\Request;
use Anperoconi\Vinovino\Vinovino;

class VinovinoController
{
    public function __invoke(Vinovino $vinovino) {
        $bouteilles = $vinovino->recuperer();
        $bouteillesSaq = $vinovino->creerListeBouteilles();
        return view('vinovino::index', compact('bouteillesSaq'));
    }


    public function saq(Vinovino $vinovino) {
        $bouteilles = $vinovino->creerListeBouteilles();
        return view('vinovino::index', compact('bouteilles'));
    }


}
