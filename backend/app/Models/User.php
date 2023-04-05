<?php
namespace App\Models;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;
    
    /**
     * Les attributs qui peuvent être attribués en masse.
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'type',
    ];

    /**
     * Les attributs qui doivent être masqués pour les tableaux.
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Les attributs qui doivent être convertis en types natifs.
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Obtenir l'identifiant qui sera stocké dans l'objet du JWT.
     * @return mixed
     */
    public function getJWTIdentifier() {
        return $this->getKey();
    }

    /**
     * Retourne un tableau clé-valeur, contenant toutes les revendications personnalisées à ajouter au JWT.
     * @return array
     */
    public function getJWTCustomClaims() {
        return [];
    }
}
