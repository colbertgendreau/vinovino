<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Bouteille extends Model
{
    use HasFactory;

    protected $table = 'bouteilles';

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
        'commentaires',
        'id_cellier',
    ];

    /**
     * Fonction qui retourne l'id de la bouteille
     */
    public function bouteilleHasId(){
        return $this->hasOne('App\Models\BouteilleSAQ', 'id', 'bouteilles_id');
    }
}
