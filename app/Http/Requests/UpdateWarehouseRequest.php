<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateWarehouseRequest extends FormRequest
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
            'telpon' => 'required',
            'wa' => 'required',
            'alamat' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'nama.required' => 'The Name field is required.',
            'email.required' => 'The Email field is required.',
            'telpon.required' => 'The Phone field is required.',
            'wa.required' => 'The Whatsapp field is required.',
            'alamat.required' => 'The Address field is required.',
        ];
    }
}
