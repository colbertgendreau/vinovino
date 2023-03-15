<?php

namespace App\Http\Controllers;

use App\Models\Bouteille;
use App\Models\mesBouteilles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class BouteilleController extends Controller
{
    /**
     * cree un REST API de tout le bouteille de notre basse de donner
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $celliers_id = Auth::id();
        // $bouteilles = Bouteille::where('celliers_id', $celliers_id)->get();

        // return ['data'=>$bouteilles];
    }

    // public function index() // la function ci dessous retourne une pagination a decider ce quon veut
    // {
    //     $bouteilles = Bouteille::latest()->paginate(25);
    //     $res = $bouteilles;
    //     return $res;
    // }

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

            // $res = Bouteille::create([
            //     'celliers_id' => $request->celliers_id,
            //     'id' =>$request->id_mes_bouteilles,
            //     'quantite' =>$request->quantite,

            // ]);
// $bouteille = Bouteille::find($request->id);             a regarder cest quoi roxanne


            if ($request->id == '') {
                $mon_id = mesBouteilles::create([
                    'nom_bouteillePerso' => $request->nom,
                    'type_bouteillePerso' => $request->type,
                    'pays_bouteillePerso' => $request->pays,
//                    'format_bouteillePerso' => $request->format,
                    'prix_bouteillePerso' => $request->prix_saq,
                    'quantite_bouteillePerso' => $request->quantite,
                ]);

                $res = Bouteille::create([
                    'celliers_id' => $request->celliers_id,
                    // 'id_bouteille' => $request->id,
                    'id_mes_bouteilles' => $mon_id->id_bouteillePerso,
                    'quantite' => $request->quantite,
                ]);
            } else {
                // Handle the case where the ID is not empty
                $res = Bouteille::create([
                    'celliers_id' => $request->celliers_id,
                    'id_bouteille' => $request->id,
                    'quantite' => $request->quantite,
                ]);
            }



        return ['data' => $res];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function show(Bouteille $bouteille)
    {



        // $id = $bouteille->id_bouteillePerso;

        // $id = $bouteille->id_bouteillePerso;
        // $res = Bouteille::where('id_mes_bouteilles', $id)
        // ->leftJoin('mes_bouteilles', 'id_bouteillePerso', '=', 'id_mes_bouteilles')
        // ->get();

        // return ['data' => $res];

        // $res = Bouteille::leftJoin('mes_bouteilles', 'id_bouteillePerso', '=', 'id_mes_bouteilles')
        //     ->where('Bouteilles.id_mes_bouteilles', $id)
        //     ->get();

        // $res = Bouteille::leftJoin('mes_bouteilles', 'id_bouteillePerso', '=', 'id_mes_bouteilles')
        // ->where('id_mes_bouteilles', $bouteille->id_bouteillePerso)
        // ->first();

        // return ['data' => $res];



    $id = $bouteille->id_bouteillePerso;


    $res = Bouteille::leftJoin('mes_bouteilles', 'Bouteilles.id_mes_bouteilles', '=', 'mes_bouteilles.id_bouteillePerso')
    ->leftjoin('vino__type', 'vino__type.id', '=', 'mes_bouteilles.type_bouteillePerso')
    ->where('Bouteilles.id_mes_bouteilles', $bouteille->id_mes_bouteilles)
    ->first();


    return ['data' => $res];

    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function edit(Bouteille $bouteille)
    {
        return ['data'=>$bouteille];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, mesBouteilles $bouteille)
    {


        $bouteille->update([
            'quantite_bouteillePerso' => $request->quantite_bouteillePerso,
            'nom_bouteillePerso' => $request->nom_bouteillePerso,
            'type_bouteillePerso' => $request->type_bouteillePerso,
            'pays_bouteillePerso' => $request->pays_bouteillePerso,
            'format_bouteillePerso' => $request->format_bouteillePerso
        ]);




    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function destroy(Bouteille $bouteille)
    {
        //
    }
}
