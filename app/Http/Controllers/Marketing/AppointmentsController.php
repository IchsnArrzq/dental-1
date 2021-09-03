<?php

namespace App\Http\Controllers\Marketing;

use App\{Barang, Booking, Customer, Holidays, Jadwal, Tindakan, User};
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Exception;
use Session;

class AppointmentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('marketing.appointments.index', [
            'booking' => Booking::get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $form = $request->except(['_token', '_method', 'table-show_length']);
        DB::beginTransaction();
        try {
            $booking = Booking::create([
                'no_booking' => $form['no_booking'],
                'marketing_id' => auth()->user()->id,
                'dokter_id' => $form['dokter_id'],
                'resepsionis_id' => 0,
                'ob_id' => $form['dokter_id'],
                'perawat_id' => $form['dokter_id'],
                'cabang_id' => auth()->user()->cabang->id,
                'customer_id' => $form['customer_id'],
                'jadwal_id' => $form['jadwal_id'],
                'status_pembayaran' => 0,
                'tanggal_status' => $form['tanggal_status'],
                'jam_status' => $form['waktu_mulai'],
                'jam_selesai' => $form['waktu_selesai'],
                'status_kedatangan_id' => 1,
                'is_active' => 1
            ]);
            for ($i = 1; $i <= count($form['barang_id']); $i++) {
                $barang = Barang::findOrFail($form['barang_id'][$i]['barang_id']);
                Tindakan::create([
                    'booking_id' => $booking->id,
                    'tindakan_id' => $barang->id,
                    'durasi' => $form['time'][$i]['time'],
                    'qty' => $form['quantity'][$i]['quantity'],
                    'dokter_id' => $form['dokter_id'],
                    'nominal' => $form['total'][$i]['total'],
                    'status' => 0
                ]);
            }
            DB::commit();
            return redirect()->route('marketing.dashboard')->with('success', 'Berhasil Booking');
        } catch (Exception $err) {
            DB::rollBack();
            dd($err->getMessage());
            return redirect()->route('marketing.dashboard')->with('error', 'Booking Gagal : ' . $err->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('marketing.appointments.show', [
            'booking' => Booking::findOrFail($id)
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
