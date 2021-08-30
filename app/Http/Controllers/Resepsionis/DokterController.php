<?php

namespace App\Http\Controllers\Resepsionis;

use App\Http\Controllers\Controller;
use App\Http\Requests\DokterRequest;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class DokterController extends Controller
{
    public function index()
    {
        $dokter = User::with('cabang')->where('cabang_id', auth()->user()->cabang_id)->role('dokter')->get();

        return view('resepsionis.dokter.index', compact('dokter'));
    }

    public function create()
    {
        return view('resepsionis.dokter.create');
    }

    public function store(DokterRequest $request)
    {
        $request->validate(
            [
                'password' => 'required',
                'image' => 'required|mimes:jpg,png,jpeg',
            ],
            [
                'password.required' =>  'The password field is required',
                'image.required' => 'The image field is required',
                'image.mimes' => 'The image must be jpg,png,jpeg',
            ]
        );

        $attr = $request->all();

        $image = $request->file('image');
        $imageUrl = $image->storeAs('images/users', \Str::random(15) . '.' . $image->extension());

        $attr['cabang_id'] = auth()->user()->cabang_id;
        $attr['is_active'] = 1;
        $attr['password'] = Hash::make($request->passsword);
        $attr['image'] = $imageUrl;

        $dokter = User::create($attr);
        $dokter->assignRole('dokter');

        return redirect()->route('resepsionis.dokter.index')->with('success', 'Dokter has been added');
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
        $dokter = User::find($id);

        return  view('resepsionis.dokter.edit', compact('dokter'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(DokterRequest $request, $id)
    {
        $dokter = User::find($id);

        $request->validate([
            'email' => Rule::unique('users')->ignore($id),
        ]);

        $attr = $request->all();

        if ($request->file('image')) {
            Storage::delete($dokter->image);
            $image = $request->file('image');
            $imageUrl = $image->storeAs('images/users', \Str::random(15) . '.' . $image->extension());
        } else {
            $imageUrl = $dokter->image;
        }

        if ($request->password) {
            $attr['password'] = Hash::make($request->passsword);
        } else {
            $attr['password'] = $dokter->password;
        }

        $attr['cabang_id'] = auth()->user()->cabang_id;
        $attr['is_active'] = 1;
        $attr['image'] = $imageUrl;

        $dokter->update($attr);

        return redirect()->route('resepsionis.dokter.index')->with('success', 'Dokter has been updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dokter = User::find($id);
        Storage::delete($dokter->image);
        $dokter->delete();

        return redirect()->route('resepsionis.dokter.index')->with('success', 'Dokter has been deleted');
    }
}
