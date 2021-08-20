<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $guarded = [];

    public function cabang()
    {
        return $this->belongsTo(Cabang::class);
    }

    public function dokter()
    {
        return $this->belongsTo(User::class, 'dokter_id');
    }

    public function perawat()
    {
        return $this->belongsTo(User::class, 'perawat_id');
    }

    public function resepsionis()
    {
        return $this->belongsTo(User::class, 'resepsionis_id');
    }

    public function ob()
    {
        return $this->belongsTo(User::class, 'ob_id');
    }

    public function marketing()
    {
        return $this->belongsTo(User::class, 'marketing_id');
    }

    public function pasien()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function rincian()
    {
        return $this->hasMany(RincianPembayaran::class);
    }

    public function tindakan()
    {
        return $this->hasMany(Tindakan::class);
    }

    public function komisi()
    {
        return $this->hasMany(RincianKomisi::class, 'booking_id');
    }

    public function kedatangan()
    {
        return $this->belongsTo(StatusPasien::class, 'status_kedatangan');
    }
}
