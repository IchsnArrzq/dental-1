<?php

namespace App\Http\Controllers\Admin;

use App\{HargaProdukCabang, Warehouse, Barang};
use App\Http\Controllers\Controller;
use App\Http\Requests\StorePriceRequest;
use App\Http\Requests\UpdatePriceRequest;
use Illuminate\Http\Request;

class HargaBarangController extends Controller
{
    public function index()
    {
        //
    }

    public function create(Warehouse $warehouse)
    {
        if (request()->is('admin/price-product*')) {
            $products = Barang::where('jenis', 'barang')->get();
        } else {
            $products = Barang::where('jenis', 'service')->get();
        }
        return view('admin.harga-product.create', compact('warehouse', 'products'));
    }

    public function store(StorePriceRequest $request)
    {
        HargaProdukCabang::create($request->all());

        return redirect()->route('admin.warehouse.show', $request->input('cabang_id'))->with('success', 'Price Product has been added');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        if (request()->is('admin/price-product*')) {
            $products = Barang::where('jenis', 'barang')->get();
        } else {
            $products = Barang::where('jenis', 'service')->get();
        }

        $price = HargaProdukCabang::with('warehouse', 'product')->where('id', $id)->first();

        return view('admin.harga-product.edit', compact('price', 'products'));
    }

    public function update(UpdatePriceRequest $request, HargaProdukCabang $price)
    {
        return $price;
    }

    public function destroy($id)
    {
        //
    }
}
