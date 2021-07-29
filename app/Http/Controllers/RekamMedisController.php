<?php

namespace App\Http\Controllers;

use App\Customer;
use App\GigiPasien;
use App\RekamMedis;
use App\SimbolOdontogram;
use Illuminate\Http\Request;

class RekamMedisController extends Controller
{
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pasien = Customer::find(request('pasien'));
        $gigi = request('gigi');
        $kondisi = SimbolOdontogram::get();
        $history = RekamMedis::with('simbol', 'user')->where('customer_id', request('pasien'))->where('no_gigi', $gigi)->get();

        return view('rekam-medis.create', compact('pasien', 'gigi', 'kondisi', 'history'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $customer = Customer::find($request->input('customer_id'));
        $no_gigi = strtolower('p' . $request->input('no_gigi'));
        $simbol = SimbolOdontogram::find($request->input('kondisi'));

        RekamMedis::create([
            'customer_id' => $customer->id,
            'user_id' => auth()->user()->id,
            'tanggal' => date('Y-m-d'),
            'no_gigi' => $request->input('no_gigi'),
            'simbol_id' => $request->input('kondisi'),
            'keterangan' => $request->input('anamnesa'),
            'tindakan' => $request->input('tindakan'),
        ]);

        $gigi[$no_gigi] = $simbol->singkatan;
        $customer->gigi()->update($gigi);

        $odon[$no_gigi] = $simbol->warna;
        $customer->odontogram()->update($odon);

        return redirect()->route('admin.patients.odontogram', $customer->id)->with('success', 'Odontogram has been added');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\RekamMedis  $rekamMedis
     * @return \Illuminate\Http\Response
     */
    public function show(RekamMedis $rekamMedis)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\RekamMedis  $rekamMedis
     * @return \Illuminate\Http\Response
     */
    public function edit(RekamMedis $rekamMedis)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\RekamMedis  $rekamMedis
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RekamMedis $rekamMedis)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\RekamMedis  $rekamMedis
     * @return \Illuminate\Http\Response
     */
    public function destroy(RekamMedis $rekamMedis)
    {
        //
    }
}
