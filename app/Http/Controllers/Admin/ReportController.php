<?php

namespace App\Http\Controllers\Admin;

use App\{Booking, Cabang, Customer, Komisi, Payment, RincianKomisi, RincianPembayaran, User};
use App\Exports\AppoinmentExport;
use App\Exports\PasienExport;
use App\Exports\PaymentExport;
use Carbon\Carbon;
use Excel;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;

class ReportController extends Controller
{
    public function pasien()
    {
        $cabang = Cabang::all();
        $pasien = [];
        $from = '';
        $to = '';
        $cb = '';

        if (request('cabang') && request('from') && request('to')) {
            $from = Carbon::createFromFormat('d/m/Y', request('from'))->format('Y-m-d H:i:s');
            $to = Carbon::createFromFormat('d/m/Y', request('to'))->format('Y-m-d H:i:s');

            if (request('cabang') != 'all') {
                $cb = Cabang::find(request('cabang'));
                $pasien = Customer::with('user', 'cabang')->where('cabang_id', $cb->id)->whereBetween('created_at', [$from, $to])->get();
            } else {
                $pasien = Customer::with('user', 'cabang')->whereBetween('created_at', [$from, $to])->get();
            }
        }

        return view('admin.report.pasien.index', compact('cabang', 'pasien', 'from', 'to', 'cb'));
    }

    // public function pasienexport($cabang_id)
    // {
    //     if ($cabang_id != 'all') {
    //         $cabang = Cabang::find($cabang_id);
    //         $data = Customer::with('user', 'cabang')->where('cabang_id', $cabang_id)->get();

    //         return Excel::download(new PasienExport($data), 'Laporan Pasien Cabang ' . $cabang->nama . '.xlsx');
    //     } else {
    //         $data = Customer::with('user', 'cabang')->get();

    //         return Excel::download(new PasienExport($data), 'Laporan Pasien Semua Cabang.xlsx');
    //     }
    // }

    public function appoinment()
    {
        $cabang = Cabang::all();
        $appointments = [];
        $from = '';
        $to = '';
        $cb = '';

        if (request('from') && request('to')) {

            $from = Carbon::createFromFormat('d/m/Y', request('from'))->format('Y-m-d H:i:s');
            $to = Carbon::createFromFormat('d/m/Y', request('to'))->format('Y-m-d H:i:s');
            if (request('cabang') != 'all') {
                $cb = Cabang::find(request('cabang'));

                $appointments = Booking::with('cabang', 'pasien', 'rincian', 'tindakan')->where('cabang_id', request('cabang'))->whereBetween('created_at', [$from, $to])->get();
            } else {
                $cb = '';

                $appointments = Booking::with('cabang', 'pasien', 'rincian', 'tindakan')->whereBetween('created_at', [$from, $to])->get();
            }
        }

        return view('admin.report.appoinment.index', compact('cabang', 'appointments', 'from', 'to', 'cb'));
    }

    // public function appoinmentreport($cabang_id)
    // {
    //     if ($cabang_id != 'all') {
    //         $cabang = Cabang::find($cabang_id);
    //         $data = Booking::with('cabang', 'pasien', 'rincian', 'tindakan')->where('cabang_id', $cabang_id)->get();

    //         return Excel::download(new AppoinmentExport($data), 'Laporan Appoinment Cabang ' . $cabang->nama . '.xlsx');
    //     } else {
    //         $data = Booking::with('cabang', 'pasien', 'rincian', 'tindakan')->get();

    //         return Excel::download(new AppoinmentExport($data), 'Laporan Appoinment Semua Cabang.xlsx');
    //     }
    // }

    public function payment()
    {
        $cabang = Cabang::all();
        $payments = [];
        $from = '';
        $to = '';
        $cb = '';

        if (request('from') && request('to')) {
            $from = Carbon::createFromFormat('d/m/Y', request('from'))->format('Y-m-d H:i:s');
            $to = Carbon::createFromFormat('d/m/Y', request('to'))->format('Y-m-d H:i:s');

            if (request('cabang') != 'all') {
                $cb = Cabang::find(request('cabang'));
                $payments = RincianPembayaran::with('payment', 'kasir', 'booking')->whereHas('booking', function ($booking) {
                    return $booking->where('cabang_id', request('cabang'));
                })->whereBetween('tanggal_pembayaran', [$from, $to])->get();
            } else {
                $payments = RincianPembayaran::with('payment', 'kasir', 'booking')->whereBetween('tanggal_pembayaran', [$from, $to])->get();
            }
        }

        return view('admin.report.payment.index', compact('payments', 'cabang', 'cb', 'from', 'to'));
    }

    // public function paymentreport($payment_id)
    // {
    //     $from = Carbon::parse(request('from'))->format('Y-m-d H:i:s');
    //     $to = Carbon::parse(request('to'))->format('Y-m-d H:i:s');

    //     if ($payment_id != 'all') {
    //         $payment = Payment::find($payment_id);
    //         $data = RincianPembayaran::with('payment', 'kasir')->where('payment_id', request('metode'))->whereBetween('tanggal_pembayaran', [$from, $to])->get();

    //         return Excel::download(new PaymentExport($data), 'Laporan Metode Pembayarang Cabang ' . $payment->nama_metode . '.xlsx');
    //     } else {
    //         $data = RincianPembayaran::with('payment', 'kasir')->whereBetween('tanggal_pembayaran', [$from, $to])->get();

    //         return Excel::download(new PaymentExport($data), 'Laporan Metode Pembayaran Semua Cabang.xlsx');
    //     }
    // }

    public function komisi()
    {
        $users = User::whereHas('roles', function ($role) {
            return $role->where('name', '!=', 'super-admin');
        })->get();
        $komisi = null;
        $from = '';
        $to = '';
        $rl = '';

        if (request('pegawai') && request('from') && request('to')) {
            if (request('pegawai') != 'all') {
                $rl = User::find(request('pegawai'))->name;
                $komisi = RincianKomisi::with('booking', 'user')->where('user_id', request('pegawai'))->whereHas('booking', function ($query) {
                    return $query->with('rincian')->whereHas('rincian', function ($rincian) {
                        $from = Carbon::createFromFormat('d/m/Y', request('from'))->format('Y-m-d H:i:s');
                        $to = Carbon::createFromFormat('d/m/Y', request('to'))->format('Y-m-d H:i:s');
                        return $rincian->whereBetween('tanggal_pembayaran', [$from, $to]);
                    });
                })->get();
            } else {
                $komisi = RincianKomisi::with('booking', 'user')->whereHas('booking', function ($query) {
                    return $query->with('rincian')->whereHas('rincian', function ($rincian) {
                        $from = Carbon::createFromFormat('d/m/Y', request('from'))->format('Y-m-d H:i:s');
                        $to = Carbon::createFromFormat('d/m/Y', request('to'))->format('Y-m-d H:i:s');
                        return $rincian->whereBetween('tanggal_pembayaran', [$from, $to]);
                    });
                })->get();
            }
        }

        return view('admin.report.komisi.index', compact('users', 'komisi', 'rl', 'from', 'to'));
    }
    public function perpindahan()
    {
        $cabang = Cabang::get();
        $cb = '';
        $from = '';
        $to = '';
        if (request()->method() == 'POST') {
            $this->validate(request(),[
                'cabang' => 'required',
                'from' => 'required',
                'to' => 'required'
            ]);
            $form = request()->all();
            $from = Carbon::createFromFormat('d/m/Y', $form['from']);
            $to = Carbon::createFromFormat('d/m/Y', $form['to']);
            $from = $from->format('Y-m-d');
            $to = $to->format('Y-m-d');
            $perpindahan = Booking::where('cabang_id', $form['cabang'])->where('dokter_pengganti_id', '!=', null)->where('tanggal_pengganti', '!=', null)->whereBetween('tanggal_pengganti', [$from, $to])->get();
            if ($form['cabang'] == 'all') {
                $perpindahan = Booking::where('dokter_pengganti_id', '!=', null)->where('tanggal_pengganti', '!=', null)->whereBetween('tanggal_pengganti', [$from, $to])->get();
            }
            return view('admin.report.perpindahan.index', compact('perpindahan', 'cabang', 'cb', 'from', 'to'));
        }
        $perpindahan = Booking::where('dokter_pengganti_id', '!=', null)->get();
        return view('admin.report.perpindahan.index', compact('perpindahan', 'cabang', 'cb', 'from', 'to'));
    }
}
