<?php

namespace App\Http\Controllers;

use App\Models\BouteilleSAQ;
use Illuminate\Http\Request;
use Illuminate\Support\Str; 
use Illuminate\Support\Facades\DB;
class BouteilleSAQController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $bouteilleSAQ = BouteilleSAQ::leftJoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
        // ->select('vino__bouteille.id', 'vino__bouteille.nom', 'vino__type.type as type_name')
        // ->get();

        // return ['data' => $bouteilleSAQ];

        $bouteilleSAQ = BouteilleSAQ::leftJoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
            ->select('vino__bouteille.*', 'vino__type.type as type_name')
            ->get();

        return ['data' => $bouteilleSAQ];
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\BouteilleSAQ  $bouteilleSAQ
     * @return \Illuminate\Http\Response
     */
    public function show(BouteilleSAQ $bouteilleSAQ)
    {

        // $bouteilleSAQ = BouteilleSAQ::leftJoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
        // ->get();


        return ['data'=>$bouteilleSAQ];
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BouteilleSAQ  $bouteilleSAQ
     * @return \Illuminate\Http\Response
     */
    public function edit(BouteilleSAQ $bouteilleSAQ)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BouteilleSAQ  $bouteilleSAQ
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BouteilleSAQ $bouteilleSAQ)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BouteilleSAQ  $bouteilleSAQ
     * @return \Illuminate\Http\Response
     */
    public function destroy(BouteilleSAQ $bouteilleSAQ)
    {
        //
    }



            /**
     * Display the specified resource that have been scanned.
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function scannerDetail(Request $request)
    {
    


    $cup_code = $request->code_cup;
    // var_dump($cup_code);


        // $res = BouteilleSAQ::leftJoin('vino__bouteille__description', 'vino__bouteille__description.id', '=', 'vino__bouteille.id')
        //     ->leftjoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
        //     ->where('vino__bouteille__description.cup_code', $cup_code)
        //     ->first();

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
// $res = BouteilleSAQ::select(
//     'bouteilles.id AS id_supreme',
//     'bouteilles.*',
//     'vino__bouteille.id AS vino__bouteille_id',
//     'vino__bouteille.*',
//     'mes_bouteilles.*',
//     'type_vino.id AS type_vino_id',
//     'type_vino.type AS type_vino_name',
//     'type_mes.id AS type_mes_id',
//     'type_mes.type AS type_mes_name',
//     'celliers.nom AS celliers_nom',
// )
//     ->leftJoin('vino__bouteille', 'vino__bouteille.id', '=', 'bouteilles.id_bouteille')
//     ->leftJoin('mes_bouteilles', 'mes_bouteilles.id_bouteillePerso', '=', 'bouteilles.id_mes_bouteilles')
//     ->leftJoin('vino__type as type_vino', 'type_vino.id', '=', 'vino__bouteille.type')
//     ->leftJoin('vino__type as type_mes', 'type_mes.id', '=', 'mes_bouteilles.type_bouteillePerso')
//     ->join('celliers', 'bouteilles.celliers_id', '=', 'celliers.id')
//     ->where('vino__bouteille__description.cup_code', $cup_code)
//     ->get();

// return ['data' => $bouteilles];