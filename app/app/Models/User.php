<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Http\Resources\BookResource;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'surname',
        'name',
        'patronymic',
        'username',
        'email',
        'remember_token',
        'role_id',
        'wallet',
    ];

    protected $hidden = [
//        'password',
        //'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime'
    ];

    public function reviews()
    {
        return $this->hasMany(Review::class, 'user_id');
    }


    public function follower()
    {
        return $this->belongsToMany(User::class, 'subscribers', 'author_id', 'user_id');
    }

    public function subscriptions()
    {
        return $this->belongsToMany(User::class, 'subscribers', 'user_id', 'author_id');
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    public function bookmarks()
    {
        return $this->belongsToMany(Book::class, 'bookmarks', 'user_id', 'book_id');
    }

    public function purchased_books()
    {
        return $this->belongsToMany(Book::class, 'books_users', 'user_id', 'book_id');
    }

    public function created_books()
    {
        return $this->hasMany(Book::class, 'user_id');
    }

    public function shelves()
    {
        return $this->hasMany(Shelf::class, 'user_id');
    }

    public function quotes()
    {
        return $this->hasMany(Quote::class, 'user_id');
    }
    public function posts()
    {
        return $this->hasMany(Post::class, 'user_id');
    }
}
