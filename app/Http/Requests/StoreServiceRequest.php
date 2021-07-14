<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreServiceRequest extends FormRequest
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
            'kode_barang' => 'required|unique:barangs',
            'nama_barang' => 'required',
            'durasi' => 'required'
        ];
    }
    public function messages()
    {
        return [
            'kode_barang.required' => 'The Service Code field is required.',
            'nama_barang.required' => 'The Name field is required.',
            'kode_barang.unique' => 'The Service Code has already been taken.',
            'durasi.required' => 'The Duration field is required.',
        ];
    }
}
