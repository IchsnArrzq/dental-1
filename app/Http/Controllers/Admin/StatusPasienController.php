<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreStatusRequest;
use App\Http\Requests\UpdateStatusRequest;
use Illuminate\Http\Request;
use App\StatusPasien;


class StatusPasienController extends Controller
{
    public function index()
    {
        $status = StatusPasien::get();

        return view('admin.status.index', compact('status'));
    }

    public function create()
    {
        return view('admin.status.create');
    }

    public function store(StoreStatusRequest $request)
    {
        StatusPasien::create($request->all());

        return redirect()->route('admin.status.index')->with('success', 'Status has been added');
    }

    public function edit(StatusPasien $status)
    {
        return view('admin.status.edit', compact('status'));
    }

    public function update(UpdateStatusRequest $request, StatusPasien $status)
    {
        $status->update($request->all());

        return redirect()->route('admin.status.index')->with('success', 'Status has been updated');
    }

    public function destroy(StatusPasien $status)
    {
        $status->delete();

        return redirect()->route('admin.status.index')->with('success', 'Status has been deleted');
    }
}
