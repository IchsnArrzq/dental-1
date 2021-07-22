<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreKomisiRequest;
use App\Komisi;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class KomisiController extends Controller
{
    public function index()
    {
        $komisi = Komisi::get();
        return view('admin.komisi.index', compact('komisi'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::all();
        return view('admin.komisi.create', compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreKomisiRequest $request)
    {
        Komisi::create($request->all());

        return redirect()->route('admin.komisi.index')->with('success', 'Komisi has been added');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Komisi  $komisi
     * @return \Illuminate\Http\Response
     */
    public function show(Komisi $komisi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Komisi  $komisi
     * @return \Illuminate\Http\Response
     */
    public function edit(Komisi $komisi)
    {
        $roles = Role::all();

        return view('admin.komisi.edit', compact('roles', 'komisi'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Komisi  $komisi
     * @return \Illuminate\Http\Response
     */
    public function update(StoreKomisiRequest $request, Komisi $komisi)
    {
        $komisi->update($request->all());

        return redirect()->route('admin.komisi.index')->with('success', 'Komisi has been updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Komisi  $komisi
     * @return \Illuminate\Http\Response
     */
    public function destroy(Komisi $komisi)
    {
        $komisi->delete();

        return redirect()->route('admin.komisi.index')->with('success', 'Komisi has been deleted');
    }
}
