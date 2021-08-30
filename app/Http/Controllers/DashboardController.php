<?php

namespace App\Http\Controllers;

use App\Booking;
use App\Customer;
use App\Tindakan;
use App\User;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        $macAddr = substr(exec('getmac'), 0, 17);

        if (auth()->user()->mac_address == null) {
            $user = User::find(auth()->user()->id);
            $user->update([
                'mac_address' => $macAddr
            ]);
        }

        $jadwal = [];
        $datang = [];
        $periksa = [];

        $pasien = Customer::count();
        $dokter = User::role('dokter')->count();
        $appointments =  Booking::count();
        $tindakan =  Tindakan::with('booking')->where('status', 0)->count();

        if (auth()->user()->hasRole('resepsionis')) {
            $waktu = Carbon::now()->format('Y-m-d');
            $cabang = auth()->user()->cabang_id;

            $jadwal = Booking::with('pasien', 'dokter')->where('created_at', 'like', '%' . $waktu . '%')->where('status_kedatangan_id', 1)->where('cabang_id', $cabang)->get();
            $datang = Booking::with('pasien', 'dokter')->where('status_kedatangan_id', 2)->where('cabang_id', $cabang)->get();
            $periksa = Booking::with('pasien', 'dokter')->where('status_kedatangan_id', 3)->get();
            $pasien =  Customer::where('cabang_id', $cabang)->count();
            $appointments =  Booking::where('cabang_id', $cabang)->count();
            $tindakan =  Tindakan::with('booking')->whereHas('booking', function ($query) {
                $cabang = auth()->user()->cabang_id;
                return $query->where('cabang_id', $cabang);
            })->where('status', 0)->count();
        }

        return view('dashboard.index', compact('jadwal', 'datang', 'periksa', 'pasien', 'appointments', 'tindakan', 'dokter'));
    }

    public function profile()
    {
        $profile = User::with('roles')->find(auth()->user()->id);
        return view('dashboard.profile', compact('profile'));
    }
}
