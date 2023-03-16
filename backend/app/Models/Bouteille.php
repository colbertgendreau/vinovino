<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Bouteille extends Model
{
    use HasFactory;

    protected $table = 'bouteilles';
    // protected $primaryKey = 'id_mes_bouteilles';
    // protected $primaryKey = 'id_bouteille';
    
    
    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'date_achat',
        'millesime',
        'notes',
        'prix',
        'quantite',
        'celliers_id',
        'id_bouteille',
        'id_mes_bouteilles',
        'id',

    ];

    // public function bouteilleHasType(){ 
    //     return $this->hasOne('App\Models\Bouteille', '', '');       /// a voir ici regler la question du type
    // }

    public function bouteilleHasId(){
        return $this->hasOne('App\Models\BouteilleSAQ', 'id', 'bouteilles_id');
    }

    
}
