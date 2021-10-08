<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreVoucherRequest;
use App\Http\Requests\UpdateVoucherRequest;
use App\RincianPembayaran;
use App\Voucher;
use Carbon\Carbon;

class VoucherController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('voucher-access'), 403);

        $vouchers = Voucher::get();

        return view('admin.voucher.index', compact('vouchers'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('voucher-create'), 403);

        $voucher = new Voucher();
        return view('admin.voucher.create', compact('voucher'));
    }

    public function store(StoreVoucherRequest $request)
    {
        abort_unless(\Gate::allows('voucher-create'), 403);

        for ($i = 0; $i <= request('jml_voc'); $i++) {
            Voucher::create($request->all());
        }


        return redirect()->route('admin.voucher.index')->with('success', 'Voucher has been added');
    }

    public function show($id)
    {
        $voucher = Voucher::where('kode_voucher', $id)->first();
        return response()->json([
            'voucher' => $voucher
        ], 200);
    }


    public function edit(Voucher $voucher)
    {
        abort_unless(\Gate::allows('voucher-edit'), 403);

        return view('admin.voucher.edit', compact('voucher'));
    }

    public function update(UpdateVoucherRequest $request, Voucher $voucher)
    {
        abort_unless(\Gate::allows('voucher-edit'), 403);

        $voucher->update($request->all());

        return redirect()->route('admin.voucher.index')->with('success', 'Voucher has been updated');
    }

    public function destroy(Voucher $voucher)
    {
        abort_unless(\Gate::allows('voucher-delete'), 403);

        $voucher->delete();

        return redirect()->route('admin.voucher.index')->with('success', 'Voucher has been deleted');
    }
}
