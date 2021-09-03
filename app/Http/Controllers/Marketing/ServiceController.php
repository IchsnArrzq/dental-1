<?php

namespace App\Http\Controllers\Marketing;

use App\{Barang, Booking, Customer, Holidays, Jadwal, Tindakan, User};
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;


class ServiceController extends Controller
{
    public function AppointmentsFilter(Request $request)
    {

        $this->validate($request, [
            'startdate' => 'required',
            'enddate' => 'required'
        ]);
        $startdate = request('startdate');
        $enddate = request('enddate');

        $from = Carbon::createFromFormat('d/m/Y', $startdate);
        $to = Carbon::createFromFormat('d/m/Y', $enddate);

        $current = Carbon::now()->format('Y-m-d');
        $a = $from->diffInDays($current);

        $now = $from->format('d');
        $dokter = User::whereHas('roles', function ($role) {
            return $role->where('name', 'dokter');
        })
            ->where('cabang_id', auth()->user()->cabang_id)
            ->get();
        $holiday = Holidays::whereMonth('holiday_date', Carbon::now()->format('m'))->whereYear('holiday_date', Carbon::now()->format('Y'))->pluck('holiday_date')->toArray();
        return view('dashboard.index', [
            'booking' => Booking::where('is_active', 1)->get(),
            'dokter' => $dokter,
            'holiday' => $holiday,
            'from' => $from->format('d'),
            'to' => $to->format('d'),
            'now' => $now,
            'a' => $a
        ]);
    }

    public function AppointmentsBook(Request $request)
    {
        $this->validate($request, [
            'pasien_id' => 'required'
        ]);
        $dokter = User::findOrFail($request->dokter_id);
        $customer = Customer::findOrFail($request->pasien_id);
        $ttl = substr($customer->ttl, -10);
        $umur = (int)Carbon::now()->format('Y') - (int)Carbon::parse($ttl)->format('Y');
        $jadwal = Jadwal::findOrFail($request->jadwal_id);
        $no_booking = $customer->cabang->nama . $customer->cabang->id . '_' . Carbon::now()->format('Ymd') . '_' . rand();
        $date_booking = Carbon::now()->format('Y-m-d h:i:s');
        return view('marketing.appointments.detail', [
            'no_booking' => $no_booking,
            'date_booking' => $date_booking,
            'customer' => $customer,
            'jadwal' => $jadwal,
            'umur' => $umur,
            'dokter' => $dokter,
            'waktu_mulai' => $request->waktu_mulai
        ]);
    }
}
