<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\{StorePermissionRequest, UpdatePermissionRequest};
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{
    public function index()
    {
        $permissions = Permission::get();
        return view('admin.permission.index', compact('permissions'));
    }

    public function create()
    {
        return view('admin.permission.create');
    }

    public function store(StorePermissionRequest $request)
    {
        Permission::create($request->all());

        return redirect()->route('admin.permissions.index')->with('success', 'Permission has been added');
    }


    public function edit(Permission $permission)
    {
        return view('admin.permission.edit', compact('permission'));
    }

    public function update(UpdatePermissionRequest $request, Permission $permission)
    {
        $permission->update($request->all());

        return redirect()->route('admin.permissions.index')->with('success', 'Permission has been updated');
    }

    public function destroy(Permission $permission)
    {
        $permission->delete();

        return redirect()->route('admin.permissions.index')->with('success', 'Permission has been deleted');
    }
}
