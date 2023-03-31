<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BouteilleSAQ extends Model
{
    use HasFactory;

    protected $table = 'vino__bouteille'; // a modifier
    
    
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
        'cup_code',
        // 'image_url',
        // 'cepages',
        // 'id',
        

    ];
}
