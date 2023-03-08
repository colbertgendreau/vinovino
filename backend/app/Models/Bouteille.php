<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bouteille extends Model
{
    use HasFactory;

    protected $table = 'vino__bouteille';
    
    
    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'nom',
        'image',
        'code_saq',
        'url_saq',
        'pays',
        'description',
        'prix_saq',
        'url_img',
        'format',
        'type',

    ];

    // public function bouteilleHasType(){ 
    //     return $this->hasOne('App\Models\Bouteille', '', '');       /// a voir ici regler la question du type
    // }

    
}
