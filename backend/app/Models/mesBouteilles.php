<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mesBouteilles extends Model
{
    use HasFactory;

    protected $table = 'mes_bouteilles';
    protected $primaryKey = 'id_bouteillePerso';

    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'nom_bouteillePerso',
        'image_bouteillePerso',
        'pays_bouteillePerso',
        'description_bouteillePerso',
        'prix_bouteillePerso',
        'url_img_bouteillePerso',
        'format_bouteillePerso',
        'type_bouteillePerso',
        'id_bouteillePerso',
        'celliers_id',
        'id_cellier',
    ];
}
