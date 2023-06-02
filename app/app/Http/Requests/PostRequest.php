<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'user_id' => 'required|integer|exists:users,id',
            'description' => 'required',
            'image' => 'sometimes|nullable|image|mimes:jpg,png,jpeg,gif',
        ];
    }
}
