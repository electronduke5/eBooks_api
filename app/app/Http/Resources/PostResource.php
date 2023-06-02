<?php

namespace App\Http\Resources;

use App\Http\Resources\forReview\UserReviewResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class PostResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'description' => $this->description,
            'image' => $this->image != null ? asset(Storage::url($this->image)) : null,
            'user' => new UserReviewResource(User::all()->firstWhere('id', $this->user_id)),
            'dateCreated' => $this->created_at,
        ];
    }
}
