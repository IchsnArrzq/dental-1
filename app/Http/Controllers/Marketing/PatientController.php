<?php

namespace App\Http\Controllers\Marketing;

use App\Booking;
use App\Customer;
use App\Fisik;
use App\GigiPasien;
use App\Http\Controllers\Controller;
use App\KetOdontogram;
use App\Odontogram;
use App\Tindakan;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $patients = Customer::with('user', 'cabang')->get();
        return view('marketing.patient.index', compact('patients'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('marketing.patient.create', [
            'patient' => new Customer()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $kode_cabang = auth()->user()->cabang->kode_cabang;
        
        $resource = Customer::withTrashed()->get();
        $wallet = [];
        foreach ($resource as $data) {
            array_push($wallet, str_replace($kode_cabang, '', $data->rekam_medik));
        }
        array_multisort($wallet);
        $response = end($wallet);
        $response += 1;
        $response = str_pad($response, 4, '0', STR_PAD_LEFT);
        $generate = $kode_cabang.$response;

        $user = User::find(auth()->user()->id);
        $attr = $request->all();
        
        if(!strlen($generate) == 6){
            dd('error cenah');   
        }
        $attr['rekam_medik'] = $generate;

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
        Fisik::create([
            'customer_id' => $customer->id
        ]);
        KetOdontogram::create([
            'customer_id' => $customer->id
        ]);

        return redirect()->route('marketing.patient.index')->with('success', 'Patient has been added');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('marketing.patient.edit', [
            'patient' => Customer::findOrFail($id)
        ]);
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
        try {
            if ($request->pict) {
                $pasien = Customer::find($id);
                $attr = $request->except(['_token', '_method']);
                $pict = $request->file('pict');
                Storage::delete(Customer::findOrFail($id)->pict);
                $pictUrl = $pict->storeAs('images/patients', \Str::random(15) . '.' . $pict->extension());
                $attr['pict'] = $pictUrl;
                $pasien->update($attr);
                return redirect()->route('marketing.patient.index');
            } else {
                $pasien = Customer::find($id);

                $attr = $request->except(['_token', '_method']);
                $pasien->update($attr);
                return redirect()->route('marketing.patient.index')->with('success', 'Pasien has been updated');
            }
        } catch (Exception $err) {
            dd($err->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        DB::beginTransaction();
        try {
            $customer = Customer::findOrFail($id);
            foreach ($customer->booking as $data) {
                foreach ($data->tindakan as $row) {
                    $row->delete();
                }
                $data->delete();
            }
            $customer->delete();
            DB::commit();
            return redirect()->route('marketing.patient.index')->with('success', 'Berhasil Menghapus');
        } catch (Exception $err) {
            DB::rollBack();
            return redirect()->route('marketing.patient.index')->with('error', $err->getMessage());
        }
    }
    public function restore()
    {
        Customer::onlyTrashed()->restore();
        return back()->with('success', 'Berhasil Restore Customer');
    }
}
