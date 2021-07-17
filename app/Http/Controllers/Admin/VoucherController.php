<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreVoucherRequest;
use App\Http\Requests\UpdateVoucherRequest;
use App\Voucher;
use Illuminate\Http\Request;
use phpDocumentor\Reflection\Types\Void_;

class VoucherController extends Controller
{
    public function index()
    {
        $vouchers = Voucher::get();

        return view('admin.voucher.index', compact('vouchers'));
    }

    public function create()
    {
        return view('admin.voucher.create');
    }

    public function store(StoreVoucherRequest $request)
    {
        Voucher::create($request->all());

        return redirect()->route('admin.voucher.index')->with('success', 'Voucher has been added');
    }

    public function show(Voucher $voucher)
    {
        //
    }

    public function edit(Voucher $voucher)
    {
        return view('admin.voucher.edit', compact('voucher'));
    }

    public function update(UpdateVoucherRequest $request, Voucher $voucher)
    {
        $voucher->update($request->all());

        return redirect()->route('admin.voucher.index')->with('success', 'Voucher has been updated');
    }

    public function destroy(Voucher $voucher)
    {
        $voucher->delete();

        return redirect()->route('admin.voucher.index')->with('success', 'Voucher has been deleted');
    }
}
