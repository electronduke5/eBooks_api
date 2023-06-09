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
        Schema::create('books_users', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')
                ->unsigned()->nullable()
                ->constrained('users')
                ->cascadeOnUpdate()->nullOnDelete();
            $table->foreignId('book_id')
                ->unsigned()->nullable()
                ->constrained('books')
                ->cascadeOnUpdate()->nullOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books_users');
    }
};
