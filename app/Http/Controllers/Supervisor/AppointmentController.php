<?php

namespace App\Http\Controllers\Supervisor;

use App\Http\Controllers\Controller;
use App\Booking;
use App\Payment;
use App\RincianPembayaran;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class AppointmentController extends Controller
{
    public function index()
    {
        return view('supervisor.appointments.index');
    }

    public function ajaxAppointment()
    {
        $appointments = DB::table('bookings')
            ->join('customers', 'bookings.customer_id', '=', 'customers.id')
            ->join('users', 'bookings.dokter_id', '=', 'users.id')
            ->join('cabangs', 'bookings.cabang_id', '=', 'cabangs.id')
            ->join('status_pasiens', 'bookings.status_kedatangan_id', '=', 'status_pasiens.id')
            ->select('bookings.id', 'bookings.no_booking', 'bookings.created_at', 'bookings.jam_status', 'bookings.jam_selesai', 'status_pasiens.status', 'status_pasiens.warna', 'customers.nama as pasien', 'users.name as dokter', 'cabangs.nama as cabang')
            ->get();

        return datatables()
            ->of($appointments)
            ->editColumn('booking', function ($data) {
                return '<a href="' . route("supervisor.appointments.show", $data->id) . '">' . $data->no_booking . '</a>';
            })
            ->editColumn('status', function ($data) {
                return '<span class="custom-badge status-' . $data->warna . '">' . $data->status . '</span>';
            })
            ->editColumn('tgl', function ($data) {
                return Carbon::parse($data->created_at)->format('d/m/Y');
            })
            ->editColumn('waktu', function ($data) {
                return Carbon::parse($data->jam_status)->format('H.i') . ' - ' . Carbon::parse($data->jam_selesai)->format('H.i');
            })
            ->rawColumns(['status', 'booking'])
            ->make(true);
    }

    public function show(Booking $appointment)
    {
        $appointment = Booking::with('pasien', 'dokter', 'cabang', 'perawat', 'resepsionis', 'rincian', 'tindakan')->where('id', $appointment->id)->first();
        $payments = Payment::where('id', '!=', 4)->get();
        $perawat = User::role('perawat')->get();
        $office = User::role('office-boy')->get();

        return view('supervisor.appointments.show', compact('appointment', 'payments', 'perawat', 'office'));
    }

    public function deleterincian()
    {
        $rincian = RincianPembayaran::find(request('id'));
        $rincian->delete();

        return back()->with('success', 'Riwayat Pembayaran berhasil dihapus');
    }
}
