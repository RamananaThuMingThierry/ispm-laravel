<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('historiques', function (Blueprint $table) {
            $table->id();
            $table->string('image')->nullable();
            $table->string("numero")->nullable();
            $table->date("entrer")->nullable();
            $table->date("sortir")->nullable();
            $table->string("code_barre");
            $table->string("genre");
            $table->string("type_vehicule");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('historiques');
    }
};
