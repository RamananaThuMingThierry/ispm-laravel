<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\ClassesController;
use App\Http\Controllers\API\DepartementController;
use App\Http\Controllers\API\EtudiantsController;
use App\Http\Controllers\API\FilieresController;
use App\Http\Controllers\API\HistoriqueController;
use App\Http\Controllers\API\PreSelectionsController;
use App\Models\preSelections;

Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);

Route::middleware(['auth:sanctum', 'isAPIAdmin'])->group(function(){

    Route::get('/checkingAuthenticated', function(){
        return response()->json([
             'message' => 'Vous êtes connecter',
            'status' => 200], 200);
    });

    // Classes
    Route::get('classes', [ClassesController::class, 'index']); // Afficher toutes les classes    
    Route::post('store-classes', [ClassesController::class, 'store']);   // Créer une Classe
    Route::get('edit-classes/{id}', [ClassesController::class, 'edit']); // Modifier la Clalsses
    Route::post('update-classes/{id}', [ClassesController::class, 'update']); // Modifier la Classes
    Route::post('delete-classes/{id}', [ClassesController::class, 'destroy']); // Supprimer une Classe
    
    // Départements
    Route::get('departement', [DepartementController::class, 'index']); // Afficher toutes les département    
    Route::post('store-departement', [DepartementController::class, 'store']);   // Créer une département
    Route::get('edit-departement/{id}', [DepartementController::class, 'edit']); // Modifier une département
    Route::post('update-departement/{id}', [DepartementController::class, 'update']); // Modifier une département
    Route::post('delete-departement/{id}', [DepartementController::class, 'destroy']); // Supprimer une département

    // Filières
    Route::get('filieres', [FilieresController::class, 'index']); // Afficher toutes les filières    
    Route::post('store-filieres', [FilieresController::class, 'store']);   // Créer une filière
    Route::get('edit-filieres/{id}', [FilieresController::class, 'edit']); // Modifier une filière
    Route::post('update-filieres/{id}', [FilieresController::class, 'update']); // Modifier une filière
    Route::post('delete-filieres/{id}', [FilieresController::class, 'destroy']); // Supprimer une filière

    // Historiques
    Route::get('pre_selection', [HistoriqueController::class, 'index']); // Afficher toutes les hpré-séléction    
    Route::post('store_pre_selection', [HistoriqueController::class, 'store']);   // Créer une pré-séléction
    Route::get('edit_pre_selection/{id}', [HistoriqueController::class, 'edit']); // Modifier une pré-séléction
    Route::post('update_pre_selection/{id}', [HistoriqueController::class, 'update']); // Modifier une pré-séléction
    Route::post('delete_pre_selection/{id}', [HistoriqueController::class, 'destroy']); // Supprimer une pré-séléction
   
    // Pré-séléctionner
    Route::get('historiques', [PreSelectionsController::class, 'index']); // Afficher toutes les historiques    
    Route::post('store-historiques', [PreSelectionsController::class, 'store']);   // Créer une historique
    Route::get('edit-historiques/{id}', [PreSelectionsController::class, 'edit']); // Modifier une historique
    Route::post('update-historiques/{id}', [PreSelectionsController::class, 'update']); // Modifier une historique
    Route::post('delete-historiques/{id}', [PreSelectionsController::class, 'destroy']); // Supprimer une historique

    // Etudiants
    Route::get('etudiants', [EtudiantsController::class, 'index']); // Afficher toutes les étudiants    
    Route::post('store-etudiants', [EtudiantsController::class, 'store']);   // Créer un étudiant
    Route::get('edit-etudiants/{id}', [EtudiantsController::class, 'edit']); // Modifier un étudiant
    Route::put('update-etudiants/{id}', [EtudiantsController::class, 'update']); // Modifier un étudiant
    Route::delete('delete-etudiants/{id}', [EtudiantsController::class, 'destroy']); // Supprimer un étudiant
    
    // users
    Route::get('users', [UsersController::class, 'index']);   // Liste des utilisateurs
});

Route::middleware(['auth:sanctum'])->group(function(){
    Route::post('logout', [AuthController::class, 'logout']);
});

