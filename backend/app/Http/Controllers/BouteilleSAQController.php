<?php

namespace App\Http\Controllers;

use App\Models\BouteilleSAQ;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class BouteilleSAQController extends Controller
{
    /**
     * Affiche les bouteilles de la SAQ 
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $bouteilleSAQ = BouteilleSAQ::leftJoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
            ->select('vino__bouteille.*', 'vino__type.type as type_name')
            ->get();

        return ['data' => $bouteilleSAQ];
    }


    /**
     * Affiche une bouteille de la SAQ
     *
     * @param  \App\Models\BouteilleSAQ  $bouteilleSAQ
     * @return \Illuminate\Http\Response
     */
    public function show(BouteilleSAQ $bouteilleSAQ)
    {
        return ['data' => $bouteilleSAQ];
    }

    /**
     * Affiche les infos d'une bouteille qui a été scannée
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function scannerDetail(Request $request)
    {

        $cup_code = $request->code_cup;

        $res = BouteilleSAQ::select(
            'vino__bouteille.id AS vino__bouteille_id',
            'vino__bouteille.*',
            'type_vino.id AS type_vino_id',
            'type_vino.type AS type_vino_name',
            'vino__bouteille__description.cup_code AS codeCup',
            'vino__bouteille__description.cepages AS cepages',
            'vino__bouteille__description.image_url AS bigImage',
            'vino__bouteille__description.*',

        )
            ->leftJoin('vino__bouteille__description', 'vino__bouteille__description.id', '=', 'vino__bouteille.id')

            ->leftJoin('vino__type as type_vino', 'type_vino.id', '=', 'vino__bouteille.type')


            ->where('vino__bouteille__description.cup_code', $cup_code)
            ->first();

        return ['data' => $res];
    }
}
