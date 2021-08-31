<?php

namespace App\Http\Controllers\Dokter;

use App\Booking;
use App\Customer;
use App\Http\Controllers\Controller;
use App\Tindakan;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function pasien()
    {
        $pasien = Customer::where('cabang_id', auth()->user()->cabang_id)->get();
        return view('dokter.pasien.index', [
            'pasien' => $pasien
        ]);
    }
    public function show($id)
    {
        $user = User::findOrFail($id);
        return view('dokter.dokter.show', [
            'dokter' => $user,
            'booking' => Booking::where('dokter_id', $user->id)->get()
        ]);
    }
    public function ajax($id, $value, $id_booking)
    {
        Tindakan::where('id', $id)->update([
            'status' => $value,
            'dokter_id' => auth()->user()->id,
            'waktu_selesai' => Carbon::now()->format('H:i:s')
        ]);
        Booking::where('id', $id_booking)->update([
            'status_kedatangan_id' => 2
        ]);
        $counter = Booking::findOrFail($id_booking)->tindakan->count();
        $number = Booking::findOrFail($id_booking)->tindakan->where('status', 1)->count();
        if ($counter == $number) {
            Booking::where('id', $id_booking)->update([
                'status_kedatangan_id' => 3
            ]);
        }
        $response = [
            'dokter' => auth()->user()->name,
            'status' => Booking::findOrFail($id_booking)->status->status,
            'counter' => $counter,
            'number' => $number,
            'updated_at' => Carbon::parse(Tindakan::find($id)->updated_at)->format('Y-m-d H:i:s')
        ];
        return response()->json($response);
    }
    public function AjaxPasien()
    {
        $pasien = Customer::where('cabang_id', auth()->user()->cabang_id)->get();
        return datatables()
            ->of($pasien)
            ->editColumn('umur', function ($data) {
                return (int)Carbon::now()->format('Y') - (int)Carbon::parse(substr($data->ttl, -10))->format('Y').' Tahun';
            })
            ->make(true);
    }
    public function AjaxPasienPost(Request $request)
    {
        return response()->json($request);
    }
}
