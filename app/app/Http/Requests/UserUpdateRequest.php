<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserUpdateRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

//    protected function prepareForValidation()
//    {
//        $this->merge([
//            'is_admin' => $this->is_admin,
//        ]);
//    }
    public function rules(): array
    {
        return [
            'surname' => 'nullable|max:50|alpha',
            'name' => 'nullable|max:50|alpha',
            'patronymic' => 'nullable|max:50|alpha',
            'username' => 'nullable|max:20|unique:users',
            'email' => 'nullable|email:rfc,dns|unique:users',
            'role_id' => 'nullable|exists:roles,id',
            'wallet' => 'nullable|double',
        ];
    }
}
