<?php

namespace App\Http\Controllers;

use App\Models\Bouteille;
use App\Models\mesBouteilles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;

class BouteilleController extends Controller
{
    /**
     * Crée un REST API de toutes les bouteilles de notre base de donner
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $id = Auth::id();

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
            'celliers.nom AS celliers_nom',
        )
            ->leftJoin('vino__bouteille', 'vino__bouteille.id', '=', 'bouteilles.id_bouteille')
            ->leftJoin('mes_bouteilles', 'mes_bouteilles.id_bouteillePerso', '=', 'bouteilles.id_mes_bouteilles')
            ->leftJoin('vino__type as type_vino', 'type_vino.id', '=', 'vino__bouteille.type')
            ->leftJoin('vino__type as type_mes', 'type_mes.id', '=', 'mes_bouteilles.type_bouteillePerso')
            ->join('celliers', 'bouteilles.celliers_id', '=', 'celliers.id')
            ->where('celliers.users_id', $id)
            ->get();

        return ['data' => $bouteilles];
    }

    /**
     * Enregistre une bouteille dans la base de données
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        if ($request->id == '') {
            $mon_id = mesBouteilles::create([
                'nom_bouteillePerso' => $request->nom,
                'type_bouteillePerso' => $request->type,
                'pays_bouteillePerso' => $request->pays,
                'format_bouteillePerso' => $request->format,
                'prix_bouteillePerso' => $request->prix_saq,
                'quantite_bouteillePerso' => $request->quantite,
            ]);

            $res = Bouteille::create([
                'celliers_id' => $request->celliers_id,
                'id_mes_bouteilles' => $mon_id->id_bouteillePerso,
                'quantite' => $request->quantite,
            ]);
        } else {
            // régie le cas si le ID n'est pas vide
            $res = Bouteille::create([
                'celliers_id' => $request->celliers_id,
                'id_bouteille' => $request->id,
                'quantite' => $request->quantite,
            ]);
        }

        return ['data' => $res];
    }

    /**
     * Affiche une bouteille
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function show(Bouteille $bouteille)
    {

        $id = $bouteille->id_bouteillePerso;


        $res = Bouteille::leftJoin('mes_bouteilles', 'bouteilles.id_mes_bouteilles', '=', 'mes_bouteilles.id_bouteillePerso')
            ->leftjoin('vino__type', 'vino__type.id', '=', 'mes_bouteilles.type_bouteillePerso')
            ->where('bouteilles.id', $bouteille->id)
            ->first();


        return ['data' => $res];
    }


    /**
     * Affiche le formulaire de modification de bouteille
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function edit(Bouteille $bouteille)
    {
        return ['data' => $bouteille];
    }

    /**
     * Modifie les informations d'une bouteille
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, mesBouteilles $maBouteille, bouteille $bouteille)
    {

        if ($request->id_bouteillePerso) {


            $maBouteille = mesBouteilles::find($request->id_bouteillePerso);
            $maBouteille->update([
                'nom_bouteillePerso' => $request->nom_bouteillePerso,
                'type_bouteillePerso' => $request->type_bouteillePerso,
                'pays_bouteillePerso' => $request->pays_bouteillePerso,
                'format_bouteillePerso' => $request->format_bouteillePerso,
                'prix_bouteillePerso' => $request->prix_bouteillePerso,
            ]);
            if ($request->id == '') {
                $bouteille->update([
                    'quantite' => $request->quantite_bouteillePerso,
                    'celliers_id' => $request->celliers_id,
                ]);
            } else {
                $bouteille->update([
                    'quantite' => $request->quantite,
                ]);
            }
        } else {
            $bouteille->update([
                'quantite' => $request->quantite,
            ]);
        }
    }

    /**
     * Détruit une bouteille
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function destroy(Bouteille $bouteille)
    {
        $bouteille->delete();
    }


    /**
     * Affiche les détails d'une bouteille
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function showDetail(Bouteille $bouteille)
    {

        $res = Bouteille::leftJoin('vino__bouteille', 'vino__bouteille.id', '=', 'bouteilles.id_bouteille')
            ->leftJoin('mes_bouteilles', 'bouteilles.id_mes_bouteilles', '=', 'mes_bouteilles.id_bouteillePerso')
            ->leftJoin('vino__bouteille__description', 'vino__bouteille__description.id', '=', 'vino__bouteille.id')
            ->leftJoin('vino__type', function ($join) {
                $join->on('vino__type.id', '=', 'vino__bouteille.type');
                if (Schema::hasColumn('vino__bouteille', 'type')) {
                    $join->on('vino__type.id', '=', 'vino__bouteille.type');
                }
            })
            ->where('bouteilles.id', $bouteille->id)
            ->first();

        return ['data' => $res];
    }

    /**
     * Ajoute et modifie une note apporté une bouteille
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Illuminate\Http\Request  $bouteille
     * @return \Illuminate\Http\Response 
     */
    public function ajoutNote(Request $request, Bouteille $bouteille)
    {
        $notes = $request->input('notes');

        $bouteille->update([
            'notes' => $notes,
        ]);

        return ['data' => $bouteille];
    }




    /**
     * Ajoute et modifie un commentaire apporté à une bouteille
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Illuminate\Http\Request  $bouteille
     * @return \Illuminate\Http\Response 
     */
    public function ajoutCommentaire(Request $request, Bouteille $bouteille)
    {
        $commentaires = $request->input('commentaires');

        $bouteille->update([
            'commentaires' => $commentaires,
        ]);

        return ['data' => $bouteille];
    }
}
