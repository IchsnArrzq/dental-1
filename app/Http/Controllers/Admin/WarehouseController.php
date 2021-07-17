<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreWarehouseRequest;
use App\Http\Requests\UpdateWarehouseRequest;
use App\{Cabang, Barang, HargaProdukCabang};

class WarehouseController extends Controller
{
    public function index()
    {
        // abort_unless(\Gate::allows('warehouse-access'), 403);

        $warehouses = Cabang::get();
        return view('admin.warehouse.index', compact('warehouses'));
    }

    public function create()
    {
        // abort_unless(\Gate::allows('warehouse-create'), 403);

        return view('admin.warehouse.create');
    }

    public function store(StoreWarehouseRequest $request)
    {
        // abort_unless(\Gate::allows('warehouse-create'), 403);

        $request['is_active'] = 1;
        Cabang::create($request->all());

        return redirect()->route('admin.warehouse.index')->with('success', 'Warehouse has been added');
    }

    public function show(Warehouse $warehouse)
    {
        $products = HargaProdukCabang::with('warehouse', 'product')->where('cabang_id', $warehouse->id)->whereHas('product', function ($query) {
            return $query->where('jenis', 'barang');
        })->get();

        $services = HargaProdukCabang::with('warehouse', 'product')->where('cabang_id', $warehouse->id)->whereHas('product', function ($query) {
            return $query->where('jenis', 'service');
        })->get();

        return view('admin.warehouse.show', compact('warehouse', 'products', 'services'));
    }

    public function edit(Warehouse $warehouse)
    {
        abort_unless(\Gate::allows('warehouse-edit'), 403);

        return view('admin.warehouse.edit', compact('warehouse'));
    }

    public function update(UpdateWarehouseRequest $request, Warehouse $warehouse)
    {
        abort_unless(\Gate::allows('warehouse-edit'), 403);

        $warehouse->update($request->all());

        return redirect()->route('admin.warehouse.index')->with('success', 'Warehouse has been updated');
    }

    public function destroy(Warehouse $warehouse)
    {
        abort_unless(\Gate::allows('warehouse-delete'), 403);

        $warehouse->delete();

        return redirect()->route('admin.warehouse.index')->with('success', 'Warehouse has been deleted');
    }
}
