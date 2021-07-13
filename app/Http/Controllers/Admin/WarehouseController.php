<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreWarehouseRequest;
use App\Http\Requests\UpdateWarehouseRequest;
use App\Warehouse;
use Illuminate\Http\Request;

class WarehouseController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('Warehouse Access'), 403);

        $warehouses = Warehouse::get();
        return view('admin.warehouse.index', compact('warehouses'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('Warehouse Create'), 403);

        return view('admin.warehouse.create');
    }

    public function store(StoreWarehouseRequest $request)
    {
        abort_unless(\Gate::allows('Warehouse Create'), 403);

        $request['is_active'] = 1;
        Warehouse::create($request->all());

        return redirect()->route('admin.warehouse.index')->with('success', 'Warehouse has been added');
    }

    public function show($id)
    {
        //
    }

    public function edit(Warehouse $warehouse)
    {
        abort_unless(\Gate::allows('Warehouse Edit'), 403);

        return view('admin.warehouse.edit', compact('warehouse'));
    }

    public function update(UpdateWarehouseRequest $request, Warehouse $warehouse)
    {
        abort_unless(\Gate::allows('Warehouse Edit'), 403);

        $warehouse->update($request->all());

        return redirect()->route('admin.warehouse.index')->with('success', 'Warehouse has been updated');
    }

    public function destroy(Warehouse $warehouse)
    {
        abort_unless(\Gate::allows('Warehouse Delete'), 403);

        $warehouse->delete();

        return redirect()->route('admin.warehouse.index')->with('success', 'Warehouse has been deleted');
    }
}
