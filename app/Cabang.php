<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cabang extends Model
{
    protected $guarded = ['id'];

    public function users()
    {
        return $this->hasMany(User::class, 'users.cabang_id');
    }

    public function harga()
    {
        return $this->hasMany(HargaProdukCabang::class);
    }

    public function customer()
    {
        return $this->hasMany(Customer::class, 'cabang_id');
    }

    public function ruangan()
    {
        return $this->hasMany(Ruangan::class);
    }
}
