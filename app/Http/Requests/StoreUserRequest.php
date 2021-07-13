<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required',
            'email' => 'required|unique:users',
            'phone_number' => 'required',
            'password' => 'required',
            'role' => 'required',
            'cabang_id' => 'required',
            'address' => 'required',
            'image' => 'required|mimes:jpg,png,jpeg'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'The Name field is required.',
            'email.required' => 'The Email field is required.',
            'phone_number.required' => 'The Phone Number field is required.',
            'password.required' => 'The Password field is required.',
            'role.required' => 'Please select role.',
            'cabang_id.required' => 'Please select warehouse.',
            'address.required' => 'The Address field is required.',
            'image.required' => 'The Image field is required.',
        ];
    }
}
