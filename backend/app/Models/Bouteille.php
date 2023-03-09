<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bouteille extends Model
{
    use HasFactory;

    protected $table = 'bouteilles';
    
    
    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'nom',
        'date_achat',
        'millesime',
        'notes',
        'prix',
        'quantite',
        'celliers_id',
        'id_bouteille',

    ];

    // public function bouteilleHasType(){ 
    //     return $this->hasOne('App\Models\Bouteille', '', '');       /// a voir ici regler la question du type
    // }

    
}
