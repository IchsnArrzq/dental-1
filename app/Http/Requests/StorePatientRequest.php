<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePatientRequest extends FormRequest
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
            'nama' => 'required',
            'email' => 'required',
            'no_telp' => 'required',
            'place' => 'required',
            'date' => 'required',
            'jk' => 'required',
            'suku' => 'required',
            'pekerjaan' => 'required',
            'alamat' => 'required',
            'pict' => 'required|mimes:jpg,jpeg,png'
        ];
    }

    public function messages()
    {
        return [
            'nama.required' => 'The Name field is required.',
            'email.required' => 'The Email field is required.',
            'no_telp.required' => 'The Phone field is required.',
            'place.required' => 'The Date of Birth field is required.',
            'date.required' => 'The Date of Birth field is required.',
            'jk.required' => 'The Gender field is required.',
            'suku.required' => 'The Tribe field is required.',
            'pekerjaan.required' => 'The Profession field is required.',
            'alamat.required' => 'The Address field is required.',
            'pict.required' => 'The Picture field is required.',
            'pict.mimes' => 'The Picture must be a file of type: jpg, jpeg, png.',
        ];
    }
}
