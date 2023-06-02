<?php

namespace App\Http\Controllers;

use App\Http\Requests\BooksUsersRequest;
use App\Http\Resources\BookResource;
use App\Models\Book;
use App\Models\BooksUsers;
use App\Models\User;

class BooksUsersController extends Controller
{
    public function store(BooksUsersRequest $request)
    {
        $created_books_users = BooksUsers::create($request->validated());
        $reader = User::all()->find($request->user_id);
        $owner = User::all()->find(Book::all()->find($request->book_id)->creator);
        $reader->update(array('wallet' => $reader->wallet - 50));
        if ($owner != null) {
            $owner->update(array('wallet' => $owner->wallet + 50));
        }

        return new BookResource(Book::all()->find($created_books_users->book_id));
    }
}
