<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreVoucherRequest extends FormRequest
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
            'kode_voucher' => 'required|unique:vouchers',
            'tgl_mulai' => 'required',
            'tgl_akhir' => 'required',
            'min_transaksi' => 'required',
            'nominal' => 'required',
            'type' => 'required',
            'persentase' => 'required'
        ];
    }
    public function messages()
    {
        return [
            'kode_voucher.required' => 'The Voucher Number field is required.',
            'tgl_mulai.required' => 'The Start field is required.',
            'tgk_akhir.required' => 'The End field is required.',
            'min_transaksi.required' => 'The Min Transaction field is required.',
            'nominal.required' => 'The Nominal field is required.',
            'type.required' => 'Select the type.',
            'persentase.required' => 'The Percentage field is required.',
            'kode_voucher.unique' => 'The Voucher Number has already been taken.'
        ];
    }
}
