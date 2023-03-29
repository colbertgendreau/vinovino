<?php

namespace App\Jobs;

use Anperoconi\Vinovino\Models\SAQ;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Http\Request;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class VinovinoJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private static $nombreProduit = 96; //48 ou 96
    private static $page = 1;
    private static $i = 1;
    private static $nombreDePages = 0;
    private static $request;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {

        self::$request = Request::capture();
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        set_time_limit(0);
        $this->execute(self::$request);
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

    public function execute($request){
        // Ne pas oublier de changer la methode de la route dans le fichier api.php
        // pour que la requete soit de type POST

        $resultat =
            DB::insert
            ( DB::raw
            ("INSERT INTO progres__crawler(temps_debut, nb_pages_completees, nb_pages_totales)
                VALUES (:temps_debut, :nb_pages_completees, :nb_pages_totales)"), array('temps_debut' =>
                self::$request->input('time'),'nb_pages_completees' => 0,
                'nb_pages_totales' => 100
            ));

        $saq = new SAQ();
        $nombreDePages = $saq->getMaxPages();
        ddd($nombreDePages);
        $nombreDePages = intval($nombreDePages);
        self::$nombreDePages = $nombreDePages;
        //self::$nombreDePages = 2;
        DB::table('progres__crawler')
            ->where('temps_debut', self::$request->input('time'))
            ->update(['nb_pages_completees' => self::$nombreDePages]);

        $resultat =
            DB::insert
            ( DB::raw
            ("INSERT INTO progres__crawler(temps_debut, nb_pages_completees, nb_pages_totales)
                VALUES (:temps_debut, :nb_pages_completees, :nb_pages_totales)"), array('temps_debut' =>
                self::$request->input('time'),'nb_pages_completees' => 0,
                'nb_pages_totales' => self::$nombreDePages
            ));



        for ($i = 0; $i < (self::$nombreDePages+1); $i++)	//permet d'importer séquentiellement plusieurs pages.
        {
            $produits = $saq->getProduits(self::$nombreProduit, self::$page + $i, $i, self::$request->input('time'));
        }

        return response()->json([
            'message' => 'Vinovino execution crawler',
            'nb_pages_totales' => self::$nombreDePages,
            'nb_pages_completees' => $i*96,
            'temps_debut' => self::$request->input('time'),
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
