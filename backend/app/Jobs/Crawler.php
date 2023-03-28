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

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    private $results = [];

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        set_time_limit(0);
        $codes = DB::table('vino__bouteille')->pluck('code_saq');
        $i = 0;
        foreach ($codes as $code) {
            $s = $this->scrapper($code);
            $i++;
            if($i == 100){
                dd($s);
            }

        }
    }

    public function scrapper($code)
    {
        $client = new Client();

        $crawler = $client->request('GET', 'https://www.saq.com/fr/' . $code);

        $cupCode = $this->extractCupCode($crawler);
        $cepage = $this->extractCepage($crawler);

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
}
