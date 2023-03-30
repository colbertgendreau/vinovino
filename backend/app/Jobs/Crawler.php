<?php

namespace App\Jobs;

use Goutte\Client;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class Crawler implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private $code_saq;
    private $results = [];
    public $tries = 5;
    public $timeout = 300;
    public $time = null;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($code_saq, $time = null)
    {
        $client = new Client();

//        $crawler = $client->request('GET', 'https://www.saq.com/fr/' . $code_saq);
//        $imgSrc = $crawler->filter('.MagicToolboxContainer img')->attr('src');
//        ddd($imgSrc);
        $this->code_saq = $code_saq;
        $this->time = $time;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
            set_time_limit(0);
            $this->scrapper($this->code_saq);
//        $codes = DB::table('vino__bouteille')->pluck('code_saq');
//        $i = 0;
//        foreach ($codes as $code) {
//            $s = $this->scrapper($code);
//            $i++;
//            if($i == 1){
//                dd($s);
//            }
//
//        }
    }

    public function scrapper($code)
    {
        $client = new Client();

        $crawler = $client->request('GET', 'https://www.saq.com/fr/' . $code);

        $imageUrl = $this->exctractImages($crawler);
        $cupCode = $this->extractCupCode($crawler);
        $cepage = $this->extractCepage($crawler);

//        $code_saq = DB::table('vino__bouteille')->where('code_saq', $code)->first();
//        DB::table('vino__bouteille__description')->insert([
//            'id' => $code_saq->id,
//            'cup_code' => $cupCode,
//            'cepages' => json_encode($cepage),
//        ]);

        $code_saq = DB::table('vino__bouteille')->where('code_saq', $code)->first();

        DB::table('vino__bouteille__description')->updateOrInsert(
            ['id' => $code_saq->id],
            [
                'cup_code' => $cupCode,
                'cepages' => json_encode($cepage),
                'image_url' => $imageUrl,
            ]
        );

        DB::table('progres__details')
            ->where('temps_debut', $this->time)
            ->increment('nb_pages_completees');


        return response()->json([
            'cup_code' => $cupCode,
            'cepage' => $cepage,
            'image_url' => $imageUrl,
        ]);
    }

    private function extractCupCode($crawler)
    {
        $li = $crawler->filter('li:contains("Code CUP")');
        $text = $li->filter('strong[data-th="Code CUP"]')->text();

        if (preg_match('/\d{14}/', $text, $matches)) {
            return $matches[0];
        }

        return null;
    }

    private function extractCepage($crawler)
    {
        $searchTerm = 'Cépages';
// Filter for li elements that contain the original search term
        $filtered = $crawler->filter('li:contains("' . $searchTerm . '")');
        // If no elements are found, search for li elements that contain the modified search term
        if ($filtered->count() == 0) {
            $searchTerm = 'Cépage';
            $filtered = $crawler->filter('li:contains("' . $searchTerm . '")');
        }
//        $results = $filtered->each(function ($node) {
//            return $node->text();
//        });
        //$li = $crawler->filter('li:contains("Cépages")');


        if ($filtered->filter('strong[data-th="Cépage"]')->count() > 0) {
            $text = $filtered->filter('strong[data-th="Cépage"]')->text();
        }else{
            $text = "Non disponible ,";
        }


        // Remove any non-breaking spaces and normalize spaces
        $text = str_replace("&nbsp;", " ", $text);
        $text = preg_replace('/\s+/', ' ', $text);
        $text = str_replace('\u00a0', '', $text);

        $grapes = explode(",", $text);
        return $grapes;
    }

    public function exctractImages($crawler)
    {
        sleep(.5);
        return $crawler->filter('.MagicToolboxContainer img')->attr('src');
    }
}
