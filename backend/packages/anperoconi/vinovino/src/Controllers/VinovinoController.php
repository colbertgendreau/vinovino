<?php
namespace Anperoconi\Vinovino\Controllers;

use Anperoconi\Vinovino\Models\SAQ;
use Illuminate\Http\Request;
use Anperoconi\Vinovino\Vinovino;
use Illuminate\Support\Facades\DB;
use function GuzzleHttp\Promise\all;

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
        $resultat =
            DB::insert
            ( DB::raw
            ("INSERT INTO progres__crawler(temps_debut, nb_pages_completees, nb_pages_totales)
                VALUES (:temps_debut, :nb_pages_completees, :nb_pages_totales)"), array('temps_debut' =>
                $request->input('time'),'nb_pages_completees' => 0,
                'nb_pages_totales' => 100
            ));

        $saq = new SAQ();
        $nombreDePages = $saq->getMaxPages();
        $nombreDePages = intval($nombreDePages);
        self::$nombreDePages = $nombreDePages;
        //self::$nombreDePages = 2;
        DB::table('progres__crawler')
            ->where('temps_debut', $request->input('time'))
            ->update(['nb_pages_completees' => self::$nombreDePages]);

        $resultat =
            DB::insert
            ( DB::raw
            ("INSERT INTO progres__crawler(temps_debut, nb_pages_completees, nb_pages_totales)
                VALUES (:temps_debut, :nb_pages_completees, :nb_pages_totales)"), array('temps_debut' =>
                $request->input('time'),'nb_pages_completees' => 0,
                'nb_pages_totales' => self::$nombreDePages
            ));



        for ($i = 0; $i < (self::$nombreDePages+1); $i++)	//permet d'importer séquentiellement plusieurs pages.
        {
            $produits = $saq->getProduits(self::$nombreProduit, self::$page + $i, $i, $request->input('time'));
        }

        return response()->json([
            'message' => 'Vinovino execution crawler',
            'nb_pages_totales' => self::$nombreDePages,
            'nb_pages_completees' => $i*96,
            'temps_debut' => $request->input('time'),
            'resultat' => $resultat,
            'completed' => true
        ]);
    }

    public function pourcentage(){
        $resultat = DB::select
        ("SELECT id,temps_debut, nb_pages_completees, nb_pages_totales  FROM progres__crawler ORDER BY id DESC LIMIT 1");
        $count = DB::select('SELECT COUNT(id) as count FROM vino__bouteille');
        return response()->json([
            'message' => 'Vinovino pourcentage crawlert',
            'nb_pages_totales' =>$resultat[0]->nb_pages_totales,
            'nb_pages_completees' =>$resultat[0]->nb_pages_completees,
            'temps_debut' =>$resultat[0]->temps_debut,
            'nb_bouteilles'=>$count[0]->count,
        ]);
    }

}
