<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Goutte\Client;
use Illuminate\Support\Facades\DB;

class ScrapperDetailsController extends Controller
{
    private $results = [];

    /**
     * Récupère une liste de codes depuis la table "vino__bouteille" de la base de données et passe chaque code à une fonction "scrapper".
     */

    public function index()
    {
        set_time_limit(300);
        $codes = DB::table('vino__bouteille')->pluck('code_saq');
        $i = 0;
        foreach ($codes as $code) {
            $s = $this->scrapper($code);
            $i++;
            if ($i == 10) {
                ddd($s);
            }
        }
    }

    /**
     * Récupère des informations sur une bouteille en scannant la page web correspondante sur le site de la SAQ.
     * @param string $code : Le code SAQ de la bouteille de vin à scanner.
     * @return Illuminate\Http\JsonResponse : Une réponse JSON contenant les informations récupérées.
     */
    public function scrapper($code)
    {

        $client = new Client();

        $crawler = $client->request('GET', 'https://www.saq.com/fr/' . $code);
        $cupCode = $this->extractCupCode($crawler);
        $cepage = $this->extractCepage($crawler);
        $bouteille = DB::raw('SELECT id,code_saq FROM vino__bouteille WHERE code_saq = 13584455');
        $code_saq = DB::table('vino__bouteille')->where('code_saq', $code)->first();

        DB::table('vino__bouteille__description')->insert([
            'id' => $code_saq->id,
            'cup_code' => $cupCode,
            'cepages' => json_encode($cepage),
        ]);

        return response()->json([
            'cup_code' => $cupCode,
            'cepage' => $cepage,
        ]);
    }

    /**
     * Extrait le code CUP de la bouteille à partir du contenu HTML d'une page web.
     * @param Symfony\Component\DomCrawler\Crawler $crawler : Un objet Crawler contenant le contenu HTML de la page web à scanner.
     * @return string|null : Le code CUP de la bouteille de vin, ou null si aucun code n'a été trouvé.
     */
    private function extractCupCode($crawler)
    {
        $li = $crawler->filter('li:contains("Code CUP")');
        $text = $li->filter('strong[data-th="Code CUP"]')->text();
        if (preg_match('/\d{14}/', $text, $matches)) {
            return $matches[0];
        }

        return null;
    }

    /**
     * Extrait la liste des cépages utilisés dans la production d'une bouteille à partir du contenu HTML d'une page web.
     * @param Symfony\Component\DomCrawler\Crawler $crawler : Un objet Crawler contenant le contenu HTML de la page web à scanner.
     * @return array : La liste des cépages utilisés dans la production de la bouteille.
     */
    private function extractCepage($crawler)
    {
        $li = $crawler->filter('li:contains("Cépages")');
        if ($li->count() == 0) {
            $li = $crawler->filter('li:contains("Cépage")');
        }
        $text = $li->filter('strong[data-th="Cépage"]')->text();

        // Remove any non-breaking spaces and normalize spaces
        $text = str_replace("&nbsp;", " ", $text);
        $text = preg_replace('/\s+/', ' ', $text);
        $text = str_replace('\u00a0', '', $text);

        $grapes = explode(",", $text);
        return $grapes;
    }
}
