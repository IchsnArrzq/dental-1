<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    protected $guarded = ['id'];

    public function hargaproduk()
    {
        return $this->belongsTo(HargaProdukCabang::class, 'barang_id');
    }
}
