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

       

            if ($request->id == '') {
                $mon_id = mesBouteilles::create([
                    'nom' => $request->nom,
                    'type' => $request->type,
                    'pays' => $request->pays,
                    'format' => $request->format,
                    'quantite' => $request->quantite,
                ]);
            
                $res = Bouteille::create([
                    'celliers_id' => $request->celliers_id,
                    'id_bouteille' => $request->id,
                    'id_mes_bouteilles' => $mon_id->id,
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
        return ['data'=>$bouteille];
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
    public function update(Request $request, Bouteille $bouteille)
    {
       
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
