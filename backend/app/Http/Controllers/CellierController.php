<?php

namespace App\Http\Controllers;

use App\Models\Bouteille;
use App\Models\Cellier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CellierController extends Controller
{
    /**
     * Affiche la liste de celliers
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users_id = Auth::id();
        $celliers = Cellier::where('users_id', $users_id)->get();
        return ['data' => $celliers];
    }

    /**
     * Enregistre un nouveau cellier dans la DB
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
     * Affiche un cellier.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function show(Cellier $cellier)
    {

        $celliers_id = $cellier->id;

        $bouteilles = Bouteille::select(

            'bouteilles.id AS id_supreme',
            'bouteilles.*',
            'vino__bouteille.id AS vino__bouteille_id',
            'vino__bouteille.*',
            'mes_bouteilles.*',
            'type_vino.id AS type_vino_id',
            'type_vino.type AS type_vino_name',
            'type_mes.id AS type_mes_id',
            'type_mes.type AS type_mes_name',
            'celliers.nom AS cellier_nom',

        )

            ->leftJoin('vino__bouteille', 'vino__bouteille.id', '=', 'bouteilles.id_bouteille')
            ->leftJoin('mes_bouteilles', 'mes_bouteilles.id_bouteillePerso', '=', 'bouteilles.id_mes_bouteilles')
            ->leftJoin('celliers', 'celliers.id', '=', 'bouteilles.celliers_id')
            ->leftJoin('vino__type as type_vino', 'type_vino.id', '=', 'vino__bouteille.type')
            ->leftJoin('vino__type as type_mes', 'type_mes.id', '=', 'mes_bouteilles.type_bouteillePerso')
            ->where('bouteilles.celliers_id', $celliers_id)
            ->get();

        return ['data' => $bouteilles];
    }

    /**
     * Modifie le nom du cellier.
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
     * Détruit un cellier
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cellier $cellier)
    {
        $cellier->delete();
    }



    /**
     * Affiche des celliers à l'extérieur de la page liste-cellier
     *
     * @param  \App\Models\Cellier  $celliers
     * @return \Illuminate\Http\Response
     */
    public function showCellier(Cellier $celliers)
    {
        return response()->json([
            'data' => $celliers,
            'user' => auth()->user(),
        ]);
    }
}
