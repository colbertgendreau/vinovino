<?php

namespace App\Http\Controllers;

use App\Models\BouteilleSAQ;
use Illuminate\Http\Request;

class BouteilleSAQController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bouteilleSAQ = BouteilleSAQ::leftJoin('vino__type', 'vino__type.id', '=', 'vino__bouteille.type')
        ->get();
        
        
        return ['data'=>$bouteilleSAQ];
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
        //
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
}
