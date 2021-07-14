<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HargaProdukCabang extends Model
{
    protected $guarded = ['id'];

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class, 'cabang_id');
    }

    public function product()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
