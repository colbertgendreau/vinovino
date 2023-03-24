<?php
namespace Anperoconi\Vinovino\Controllers;

use Anperoconi\Vinovino\Models\SAQ;
use Illuminate\Http\Request;
use Anperoconi\Vinovino\Vinovino;
use Illuminate\Support\Facades\DB;

class VinovinoController
{
    private static $nombreProduit = 96; //48 ou 96
    private static $page = 1;
    private static $i = 1;
    private static $nombreDePages = 0;

    public function __invoke(Vinovino $vinovino) {
        return view('vinovino::index');
    }

    public function getMaxPages(){
        $saq = new SAQ();
        $nombreDePages = $saq->getMaxPages();
        $nombreDePages = intval($nombreDePages);
        self::$nombreDePages = $nombreDePages;
        return response()->json([
            'message' => 'Vinovino crawler',
            'data' => $nombreDePages
        ]);
    }

    public function donnees(){
        $saq = new SAQ();
        $nombreDePages = $saq->getMaxPages();
        $nombreDePages = intval($nombreDePages);
        self::$nombreDePages = $nombreDePages;
        for ($i = 0; $i < (self::$nombreDePages+1); $i++)
        {
            $resultat = $saq->getProduits(self::$nombreProduit, self::$page + $i, $i,'2023-03-23 23:13:21
');
        }
    }

    public function execute(Request $request){
        // Ne pas oublier de changer la methode de la route dans le fichier api.php
        // pour que la requete soit de type POST
        $saq = new SAQ();
        $nombreDePages = $saq->getMaxPages();
        $nombreDePages = intval($nombreDePages);
        self::$nombreDePages = $nombreDePages;
        $resultat =
            DB::insert
            ( DB::raw
            ("INSERT INTO progres__crawler(temps_debut, nb_pages_completees, nb_pages_totales)
                VALUES (:temps_debut, :nb_pages_completees, :nb_pages_totales)"), array('temps_debut' =>
                $request->heure,'nb_pages_completees' => 0,
                'nb_pages_totales' => self::$nombreDePages
            ));
        for ($i = 0; $i < (self::$nombreDePages+1); $i++)	//permet d'importer séquentiellement plusieurs pages.
        {
            $produits = $saq->getProduits(self::$nombreProduit, self::$page + $i, $i, $request->heure);
        }
        return response()->json([
            'message' => 'Vinovino crawler',
            'nb_pages' => self::$nombreDePages,
            'temps_debut' => $request->heure,
            'resultat' => $resultat,

        ]);
    }

    public function pourcentage(){
        $resultat = DB::select
        ("SELECT id,temps_debut, nb_pages_completees, nb_pages_totales  FROM progres__crawler ORDER BY id DESC LIMIT 1");
        return response()->json([
            'message' => 'Vinovino crawlert',
            'resultat' =>$resultat[0]->nb_pages_completees
        ]);
    }





}
