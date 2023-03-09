<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cellier extends Model
{
    use HasFactory;

    protected $table = 'celliers';
    
    
    protected $fillable = [ //les champ dans la base de donner quon veux modifier, ne pas mettre les auto ecrement
        'nom',
        'users_id'
    ];


    public function CellierHasUser(){
        return $this->hasOne('App\Models\User', 'id', 'users_id'); /// a voir ici regler la question du user
    }
}
