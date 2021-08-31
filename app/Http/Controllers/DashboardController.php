<?php

namespace App\Http\Controllers;

use App\Booking;
use App\Customer;
use App\Holidays;
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

        if (auth()->user()->hasRole('super-admin')) {
            $pasien = Customer::count();
            $dokter = User::role('dokter')->count();
            $appointments =  Booking::count();
            $tindakan =  Tindakan::with('booking')->where('status', 0)->count();

            return view('dashboard.index', [
                'pasien' => $pasien,
                'dokter' => $dokter,
                'appointments' => $appointments,
                'tindakan' => $tindakan,
            ]);
        }

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

            return view('dashboard.index', compact('jadwal', 'datang', 'periksa', 'pasien', 'appointments', 'tindakan', 'dokter'));
        }

        if (auth()->user()->hasRole('dokter')) {

            $now = Carbon::now()->format('Y-m-d');
            $total_pasien = Customer::where('cabang_id', auth()->user()->cabang_id)->get()->count();

            $finish = Booking::where('dokter_id', auth()->user()->id)->whereDate('tanggal_status', $now)->where('status_kedatangan_id', 3)->orderBy('jam_status', 'asc')->get();
            $pending = Booking::where('dokter_id', auth()->user()->id)->whereDate('tanggal_status', $now)->where('status_kedatangan_id', '!=', 3)->orderBy('jam_status', 'asc')->get();
            $appointment_count = Booking::where('dokter_id', auth()->user()->id)->whereDate('tanggal_status', $now)->get()->count();
            // $appointment_pending = Booking::where('dokter_id', auth()->user()->id)->whereDate('tanggal_status', $now)->where('status_kedatangan_id','!=',3)->get()->count();
            $appointment_pending = Tindakan::whereHas('booking', function ($qr) use ($now) {
                return $qr->where('dokter_id', auth()->user()->id)->whereDate('tanggal_status', $now)->where('status_kedatangan_id', '!=', 3);
            })->where('status', 0)->get()->count();

            return view('dashboard.index', [
                'total_pasien' => $total_pasien,
                'finish' => $finish,
                'pending' => $pending,
                'appointment_count' => $appointment_count,
                'appointment_pending' => $appointment_pending
            ]);
        }

        if (auth()->user()->roles()->first()->name == 'marketing') {
            $dokter = User::whereHas('roles', function ($role) {
                return $role->where('name', 'dokter');
            })
                ->where('cabang_id', auth()->user()->cabang_id)
                ->get();
            $holiday = Holidays::whereMonth('holiday_date', Carbon::now()->format('m'))->whereYear('holiday_date', Carbon::now()->format('Y'))->pluck('holiday_date')->toArray();
            return view('dashboard.index', [
                'dokter' => $dokter,
                'holiday' => $holiday,
                'a' => 0,
                'from' => Carbon::now()->format('d'),
                'to' => Carbon::now()->endOfMonth()->format('d'),
                'booking' => Booking::get(),
            ]);
        }

        return view('dashboard.index');
    }

    public function profile()
    {
        $profile = User::with('roles')->find(auth()->user()->id);
        return view('dashboard.profile', compact('profile'));
    }
}
