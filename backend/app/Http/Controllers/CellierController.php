<?php

namespace App\Http\Controllers;

use App\Models\Bouteille;
use App\Models\Cellier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CellierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users_id = Auth::id();
        $celliers = Cellier::where('users_id', $users_id)->get();
        return ['data' => $celliers];


        // $users_id = Auth::id();
        // $celliers = Cellier::where('users_id', $users_id)
        // ->leftjoin('bouteilles', 'bouteilles.celliers_id', '=', 'celliers.id')
        // ->get();
        return ['data' => $celliers];
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $res = Cellier::create([
            'nom' => $request->nom,
            'users_id' => Auth::user()->id
        ]);

        return ['data' => $res];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function show(Cellier $cellier)
    {




        $celliers_id = $cellier->id;
        // var_dump($cellier->id);
        // $bouteilles = bouteille::where('celliers_id', $celliers_id)->get();


        // $bouteilles = bouteille::where('celliers_id', $celliers_id)
        // ->leftjoin('vino__bouteille', 'vino__bouteille.id', '=', 'id_bouteille')
        // ->leftjoin('mes_bouteilles', 'mes_bouteilles.id_bouteillePerso', '=', 'id_mes_bouteilles')
        // ->leftjoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
        // ->leftjoin('vino__type', 'vino__type.id', '=', 'mes_bouteilles.type_bouteillePerso')
        // ->get();

        // $bouteilles = bouteille::where('celliers_id', $celliers_id)
        //     ->leftJoin('vino__bouteille', 'vino__bouteille.id', '=', 'id_bouteille')
        //     ->leftJoin('mes_bouteilles', 'mes_bouteilles.id_bouteillePerso', '=', 'id_mes_bouteilles')
        //     ->leftJoin('vino__type as type_vino', 'type_vino.id', '=', 'vino__bouteille.type')
        //     ->leftJoin('vino__type as type_mes', 'type_mes.id', '=', 'mes_bouteilles.type_bouteillePerso')
        //     ->get();


        // return ['data' => $bouteilles];



        $bouteilles = Bouteille::select(
            'bouteilles.id AS id_supreme',
            'bouteilles.*',
            'vino__bouteille.id AS vino__bouteille_id',
            'vino__bouteille.*',
            'mes_bouteilles.*',
            'type_vino.id AS type_vino_id',
            'type_vino.type AS type_vino_name',
            'type_mes.id AS type_mes_id',
            'type_mes.type AS type_mes_name'
        )
        ->leftJoin('vino__bouteille', 'vino__bouteille.id', '=', 'bouteilles.id_bouteille')
        ->leftJoin('mes_bouteilles', 'mes_bouteilles.id_bouteillePerso', '=', 'bouteilles.id_mes_bouteilles')
        ->leftJoin('vino__type as type_vino', 'type_vino.id', '=', 'vino__bouteille.type')
        ->leftJoin('vino__type as type_mes', 'type_mes.id', '=', 'mes_bouteilles.type_bouteillePerso')
        ->where('bouteilles.celliers_id', $celliers_id)
        ->get();

        return ['data' => $bouteilles];



    }




    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function edit(Cellier $cellier)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cellier $cellier)
    {
        //
        $cellier->update(
            [
                'nom' => $request->nom
            ]
        );

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cellier $cellier)
    {
        $cellier->delete();

    }



    public function showCellier(Cellier $celliers)
    {
        //
        return ['data' => $celliers];
    }
}
