<?php

namespace App\Http\Controllers;

use App\Http\Requests\SubscribeRequest;
use App\Http\Resources\UserResource;
use App\Models\Subscriber;
use App\Models\User;


class SubscribeController extends Controller
{
    public function store(SubscribeRequest $request)
    {
        $old_subscribe = Subscriber::where('user_id', $request->user_id)->where('author_id', $request->author_id)->first();
        if ($old_subscribe) {
            $old_subscribe->delete();
            return new UserResource(User::all()->find($request->user_id));
        }
        $created_subscribe = Subscriber::create($request->validated());
        return new UserResource(User::all()->find($created_subscribe->user_id));
    }
}
