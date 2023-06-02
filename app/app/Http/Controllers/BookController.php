<?php

namespace App\Http\Controllers;

use App\Http\Requests\BookRequest;
use App\Http\Resources\BookResource;
use App\Models\Book;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BookController extends Controller
{
    public function index(Request $request)
    {
        $query = Book::query();
        if ($user_id = $request->input('user')) {
            $query->where('user_id', '=', $user_id);
        }
        //Поиск
        if ($title = $request->input('search')) {
            $query->where('title', 'like', "%$title%");
        }
        //Сортировка
        if ($sort = $request->input('sort')) {
            $query->orderBy($sort);
        }
        //Сортировка по убыванию
        if ($sort = $request->input('sortDesc')) {
            $query->orderByDesc($sort);
        }
        //Фильтрация
        if ($filter = $request->input('filterByAuthor')) {
            $query->where('author_id', $filter);
        }
        return BookResource::collection($query->get());
    }

    public function store(BookRequest $request)
    {
        $validated_data = array_filter($request->validated(), function ($value) {
            return ($value !== null && $value !== '');
        });
        //$validated_data = $data->validated();

        if ($request->hasFile('image') && $request->image != '') {
            $validated_data['image'] = $request->file('image')->store('images/books', 'public');
        }
        if ($request->hasFile('file') && $request->file != '') {
            $validated_data['file'] = $request->file('file')->store('books', 'public');
        }
        $user = User::all()->find($request->user_id);
        //echo $user->role_id;
        if ($user->role_id ?? false) {
          //  echo 'one';
            if ($user->role_id == 2) {
            //    echo 'to';
                $user->update(array('wallet' => $user->wallet - 100));
            }
        }
        $created_book = Book::create($validated_data);
        return new BookResource($created_book);
    }


    public function show(Book $book)
    {
        return new BookResource($book);
    }

    public function update(BookRequest $request, Book $book)
    {
        $data = array_filter($request->validated());
        if ($request->hasFile('image') && $request->image != '') {

            $image_path = '/public/' . $book->image;
            if (Storage::fileExists($image_path)) {
                Storage::delete($image_path);
            }
            $data['image'] = $request->file('image')->store('images/books', 'public');
        }

        if ($request->hasFile('file') && $request->file != '') {

            $file_path = '/public/' . $book->file;
            if (Storage::fileExists($file_path)) {
                Storage::delete($file_path);
            }
            $data['file'] = $request->file('file')->store('books', 'public');
        }
        $book->update($data);
        return new BookResource($book);
    }

    public function destroy(Book $book)
    {
        $book->delete();
        return response()->noContent();
    }
}
