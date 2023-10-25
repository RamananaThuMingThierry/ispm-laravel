<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class preSelections extends Model
{
    use HasFactory;
    
    protected $table = "pre_selections";

    protected $fillable = [
        "nom_complet",
        "contact",
        "facebookID",
        "documents",
    ];

    protected $timestamps = false;
}
