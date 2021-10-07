<?php

namespace App\Http\Controllers\Api;

use App\Booking;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AppointmentsController extends Controller
{
    public function UpdateAppointmentsFromHRD($id_booking, $dokter_pengganti_id)
    {
        if($dokter_pengganti_id == 'null'){
            Booking::findOrFail($id_booking)->update([
                'dokter_pengganti_id' => null
            ]);
        }else{
            Booking::findOrFail($id_booking)->update([
                'dokter_pengganti_id' => $dokter_pengganti_id
            ]);
        }
        return response()->json('success');
    }
}
