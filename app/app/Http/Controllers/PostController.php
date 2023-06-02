<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Http\Resources\PostResource;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{

    public function index(Request $request)
    {
        $query = Post::query();
        if ($user_id = $request->input('user')) {
            $query->where('user_id', '=', $user_id);
        }
        return PostResource::collection($query->get());
    }

    public function store(PostRequest $request)
    {
        $validated_data = $request->validated();
        if($request->hasFile('image') && $request->image != ''){
            $validated_data['image'] = $request->file('image')->store('images/posts', 'public');
        }

        $user = User::all()->find($request->user_id);
        $user->update(array('wallet'=> $user->wallet - 50));

        $created_post = Post::create($validated_data);
        return new PostResource($created_post);
    }

    public function show(Post $post)
    {
        return new PostResource($post);
    }

    public function update(Request $request, string $id)
    {
        //
    }

    public function destroy(Post $post)
    {
        $image_path = '/public/' . $post->image;
        if (Storage::fileExists($image_path)) {
            Storage::delete($image_path);
        }
        $post->delete();
        return response()->noContent();
    }
}
