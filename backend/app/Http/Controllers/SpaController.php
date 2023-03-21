<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SpaController extends Controller
{
    public function index(){
        return view('angular');
    }

    public function nonexisting(){
        throw new Exception('Cette page n\'existe pas ');
    }
}
