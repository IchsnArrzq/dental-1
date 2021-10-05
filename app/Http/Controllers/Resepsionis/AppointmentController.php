<?php

namespace App\Http\Controllers\Resepsionis;

use App\Booking;
use App\Komisi;
use App\Payment;
use App\RincianKomisi;
use App\RincianPembayaran;
use App\Tindakan;
use App\Voucher;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Images;
use App\User;
use Illuminate\Http\Request;

class AppointmentController extends Controller
{
    public function index()
    {
        $appointments = Booking::with('pasien', 'dokter', 'cabang', 'kedatangan')->where('cabang_id', auth()->user()->cabang_id)->get();
        return view('resepsionis.appointments.index', compact('appointments'));
    }

    public function show(Booking $appointment)
    {
        $appointment = Booking::with('pasien', 'dokter', 'cabang', 'perawat', 'resepsionis', 'rincian', 'tindakan')->where('id', $appointment->id)->first();
        $payments = Payment::where('cabang_id', auth()->user()->cabang_id)->get();
        $perawat = User::role('perawat')->get();
        $office = User::role('office-boy')->get();
        $rincians = RincianPembayaran::where('booking_id', $appointment->id)->where('is_active', 1)->get();

        return view('resepsionis.appointments.show', compact('appointment', 'payments', 'perawat', 'office', 'rincians'));
    }


    public function voucher()
    {
        $voucher = Voucher::where('kode_voucher', request('kode_voucher'))->first();
        $date = Carbon::now()->format('Y-m-d H:i:s');

        if ($voucher->is_active == 1) {
            if ($date > Carbon::parse($voucher->tgl_mulai)->format('Y-m-d H:i:s') && $date < Carbon::parse($voucher->tgl_akhir)->format('Y-m-d' . '23:59:59')) {
                if ($voucher->min_transaksi != 0) {
                    if (request('dibayar') >= $voucher->min_transaksi) {
                        if ($voucher->nominal != 0) {
                            $sisa = request('nominal') - $voucher->nominal;

                            return response()->json([
                                'success' => true,
                                'status' => 200,
                                'sisa' => number_format($sisa, 0, ',', '.'),
                                'diskon' => $voucher->nominal,
                                'voucher_id' => $voucher->id,
                                'message' => "Kode Voucher berhasil digunakan"
                            ]);
                        } else {
                            $total = (request('dibayar') * $voucher->persentase) / 100;
                            $sisa = request('nominal') - $total;

                            return response()->json([
                                'success' => true,
                                'status' => 200,
                                'sisa' => number_format($sisa, 0, ',', '.'),
                                'diskon' => $total,
                                'voucher_id' => $voucher->id,
                                'message' => "Kode Voucher berhasil digunakan"
                            ]);
                        }
                    } else {
                        return response()->json([
                            'status' => 400,
                            'message' => "Minimal Transaksi Rp. " . number_format($voucher->min_transaksi, 0, ',', '.')
                        ]);
                    }
                } else {
                    if ($voucher->nominal != 0) {
                        $sisa = request('nominal') - $voucher->nominal;

                        return response()->json([
                            'success' => true,
                            'status' => 200,
                            'sisa' => number_format($sisa, 0, ',', '.'),
                            'diskon' => $voucher->nominal,
                            'voucher_id' => $voucher->id,
                            'message' => "Kode Voucher berhasil digunakan"
                        ]);
                    } else {
                        $total = (request('dibayar') * $voucher->persentase) / 100;
                        $sisa = request('nominal') - $total;

                        return response()->json([
                            'success' => true,
                            'status' => 200,
                            'sisa' => number_format($sisa, 0, ',', '.'),
                            'diskon' => $total,
                            'voucher_id' => $voucher->id,
                            'message' => "Kode Voucher berhasil digunakan"
                        ]);
                    }
                }
            } else {
                return response()->json([
                    'status' => 400,
                    'message' => "Kode Voucher sudah tidak berlaku"
                ]);
            }
        } else {
            return response()->json([
                'status' => 400,
                'message' => "Kode Voucher tidak dapat digunakan"
            ]);
        }
    }

    public function bayar(Request $request)
    {
        $request->validate(
            [
                'payment' => 'required'
            ],
            [
                'payment.required' => 'Pilih Metode Pembayaran'
            ]
        );

        $payment = Payment::find($request->input('payment'));
        $biaya =  ($request->input('bayar') * $payment->potongan) / 100;
        $booking = Booking::with('kedatangan', 'tindakan', 'cabang')->find($request->input('booking_id'));

        $rincian = RincianPembayaran::where('booking_id', $booking->id)->get();
        if (request('voucher_id') != 0) {
            $voucher = Voucher::find(request('voucher_id'));
            $voucher->update(['is_active' => 0]);
        }

        RincianPembayaran::create([
            'booking_id' => $request->input('booking_id'),
            'kasir_id' => auth()->user()->id,
            'payment_id' => $request->input('payment'),
            'tanggal_pembayaran' => $request->input('tanggal_pembayaran'),
            'nominal' => $request->input('bayar'),
            'dibayar' => $request->input('bayar'),
            'kembali' => $request->input('kembali'),
            'voucher_id' => $request->input('voucher_id'),
            'disc_vouc' => $request->input('diskon'),
            'biaya_kartu' => $biaya,
            'is_active' => 1
        ]);

        $rincian = RincianPembayaran::where('booking_id', $booking->id)->where('is_active', 1)->get();

        $pajak = $booking->tindakan->sum('nominal') * $booking->cabang->ppn / 100;
        $tagihan = $booking->tindakan->sum('nominal') + $pajak;
        $totalRincian = $rincian->sum('nominal') + $rincian->sum('disc_vouc');

        if ($totalRincian == $tagihan) {
            $booking->update(['status_pembayaran' => 1]);
        }



        if ($booking->kedatangan->id == 4) {

            $this->dokter($rincian, $booking);
            $this->resepsionis($rincian, $booking);
            $this->marketing($rincian, $booking);
            $this->ob($rincian, $booking);
            $this->perawat($rincian, $booking);
        } else {
            $this->dokter($rincian, $booking);
        }


        return back();
    }

    public function dokter($dokter, $booking)
    {
        $komisi = Komisi::where('role_id', 2)->first();

        RincianKomisi::create([
            'booking_id' => $booking->id,
            'user_id' => $booking->dokter_id,
            'nominal_komisi' => ($dokter->sum('dibayar') * $komisi->persentase) / 100,
            'is_active' => 1
        ]);
    }

    public function resepsionis($resepsionis, $booking)
    {
        return $resepsionis;
        $komisi = Komisi::where('role_id', 3)->first();

        if ($resepsionis->sum('dibayar') >= $komisi->min_transaksi) {
            RincianKomisi::create([
                'booking_id' => $booking->id,
                'user_id' => $booking->resepsionis_id,
                'nominal_komisi' => ($resepsionis->sum('dibayar') * $komisi->persentase) / 100,
                'is_active' => 1
            ]);
        }
    }

    public function marketing($marketing, $booking)
    {
        $komisi = Komisi::where('role_id', 4)->first();
        if ($marketing->sum('dibayar') >= $komisi->min_transaksi) {
            RincianKomisi::create([
                'booking_id' => $booking->id,
                'user_id' => $booking->marketing_id,
                'nominal_komisi' => ($marketing->sum('dibayar') * $komisi->persentase) / 100,
                'is_active' => 1
            ]);
        }
    }

    public function ob($ob, $booking)
    {
        $komisi = Komisi::where('role_id', 5)->first();
        if ($ob->sum('dibayar') >= $komisi->min_transaksi) {
            RincianKomisi::create([
                'booking_id' => $booking->id,
                'user_id' => $booking->ob_id,
                'nominal_komisi' => ($ob->sum('dibayar') * $komisi->persentase) / 100,
                'is_active' => 1
            ]);
        }
    }

    public function perawat($perawat, $booking)
    {
        $komisi = Komisi::where('role_id', 6)->first();
        if ($perawat->sum('dibayar') >= $komisi->min_transaksi) {
            RincianKomisi::create([
                'booking_id' => $booking->id,
                'user_id' => $booking->perawat_id,
                'nominal_komisi' => ($perawat->sum('dibayar') * $komisi->persentase) / 100,
                'is_active' => 1
            ]);
        }
    }

    public function status()
    {
        $booking = Booking::findOrFail(request('id'));
        $booking->update([
            'resepsionis_id' => auth()->user()->id,
            'status_kedatangan_id' => request('status'),
        ]);

        return back()->with('success', 'Status kedatangan pasien berhasil diubah');
    }

    public function updateperawat()
    {
        $booking = Booking::findOrFail(request('id'));
        $booking->update([
            'perawat_id' => request('perawat_id')
        ]);

        return back()->with('success', 'Perawat berhasil diubah');
    }

    public function updateob()
    {
        $booking = Booking::findOrFail(request('id'));
        $booking->update([
            'ob_id' => request('ob_id')
        ]);

        return back()->with('success', 'Office Boy berhasil diubah');
    }

    public function print($id)
    {
        $appointment = Booking::with('pasien', 'dokter', 'cabang', 'perawat', 'resepsionis', 'rincian', 'tindakan')->where('id', $id)->first();

        return view('resepsionis.appointments.print', compact('appointment'));
    }

    public function report()
    {
        $now = Carbon::now()->format('Y-m-d');
        $payments = RincianPembayaran::with('payment', 'kasir', 'booking')->where('tanggal_pembayaran', 'LIKE', '%' . $now . '%')->whereHas('booking', function ($booking) {
            return $booking->where('cabang_id', auth()->user()->cabang_id);
        })->where('kasir_id', auth()->user()->id)->get();

        return view('resepsionis.appointments.report', compact('payments', 'now'));
    }

    public function upload()
    {
        $booking = Booking::findOrFail(request('id'));
        $images = request()->file('images');
        $req = request()->validate(
            [
                'images' => 'required'
            ],
            [
                'images.required' => 'Choose image.',
            ]
        );

        if (request()->file('images')) {
            foreach ($images as $image) {
                $name = date('dmYHis')  . '-' . $image->getClientOriginalName();

                $imageUrl =  $image->storeAs('pasien/images', $name);

                Images::create([
                    'booking_id' => request('id'),
                    'image' => $imageUrl
                ]);
            }

            $booking->update([
                'resepsionis_id' => auth()->user()->id,
                'status_kedatangan_id' => request('status'),
                'is_image' => 1,
            ]);
        }


        return back()->with('success', 'Status kedatangan pasien berhasil diubah');
    }
}
