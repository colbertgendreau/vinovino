<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cellier extends Model
{
    use HasFactory;

    protected $table = 'vino__cellier';
    
    
    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'id_bouteille',
        'date_achat',
        'garde_jusqua',
        'notes',
        'prix',
        'quantite',
        'millesime',
    ];


    // public function CellierHasUser(){
    //     return $this->hasOne('App\Models\User', 'id', 'user_id'); /// a voir ici regler la question du user
    // }
}
