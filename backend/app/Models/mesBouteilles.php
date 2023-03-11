<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mesBouteilles extends Model
{
    use HasFactory;

    protected $table = 'mes_bouteilles';

    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'nom',
        'image',
        'pays',
        'description',
        'prix',
        'url_img',
        'format',
        'type',
        'id',

    ];
}
