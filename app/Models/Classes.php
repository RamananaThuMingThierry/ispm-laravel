<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Classes extends Model
{
    
    use HasFactory;

    protected $table = "classes";

    protected $fillable = ["niveauClasses"];
    
    public function etudiants(): HasMany 
    { 
        return $this->hasMany(Etudiants::class); 
    }
}
