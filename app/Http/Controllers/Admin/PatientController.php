<?php

namespace App\Http\Controllers\Admin;

use App\Customer;
use App\GigiPasien;
use App\Http\Controllers\Controller;
use App\Http\Requests\StorePatientRequest;
use App\Odontogram;
use App\SimbolOdontogram;
use App\User;
use Illuminate\Http\Request;

class PatientController extends Controller
{
    public function index()
    {
        $patients = Customer::with('user', 'cabang')->get();
        return view('admin.patient.index', compact('patients'));
    }

    public function create()
    {
        return view('admin.patient.create');
    }

    public function store(StorePatientRequest $request)
    {
        $user = User::find(auth()->user()->id);
        $attr = $request->all();

        $pict = $request->file('pict');
        $pictUrl = $pict->storeAs('images/patients', \Str::random(15) . '.' . $pict->extension());

        $attr['user_id'] = $user->id;
        $attr['cabang_id'] = $user->cabang_id;
        $attr['ttl'] = $request->input('place') . ', ' . $request->input('date');
        $attr['pict'] = $pictUrl;

        $customer = Customer::create($attr);
        Odontogram::create([
            'customer_id' => $customer->id
        ]);
        GigiPasien::create([
            'customer_id' => $customer->id
        ]);

        return redirect()->route('admin.patients.index')->with('success', 'Patient has been added');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function show(Customer $customer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function edit(Customer $customer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Customer $customer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Customer $customer)
    {
        //
    }

    public function odontogram(Customer $customer)
    {
        return view('admin.patient.odontogram', compact('customer'));
    }

    public function simbol($warna)
    {
        $simbol =  SimbolOdontogram::where('warna', $warna)->first();

        return response()->json([
            'warna' => $simbol->warna,
            'nama' => $simbol->nama_simbol,
            'singkatan' => $simbol->singkatan,
        ], 200);
    }
}
