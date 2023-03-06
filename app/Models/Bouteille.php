<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bouteille extends Model
{
    use HasFactory;

    
    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'nom',
        'image',
        'url_saq',
        'code_saq',
        'pays',
        'description',
        'prix_saq',
        'url_img',
        'format',
        'bouteille_types_id'
    ];
}
