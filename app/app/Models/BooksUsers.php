<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BooksUsers extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'book_id',
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
