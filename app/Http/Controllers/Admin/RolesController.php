<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\{StoreRoleRequest, UpdateRoleRequest};
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolesController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('Roles Access'), 403);

        $roles = Role::get();
        return view('admin.roles.index', compact('roles'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('Roles Create'), 403);

        $permissions = Permission::all();

        return view('admin.roles.create', compact('permissions'));
    }

    public function store(StoreRoleRequest $request)
    {
        abort_unless(\Gate::allows('Roles Create'), 403);

        $role = Role::create(['name' => $request->input('name')]);
        $role->syncPermissions($request->input('permission'));

        return redirect()->route('admin.roles.index')->with('success', 'Role has been added');
    }

    public function show($id)
    {
        //
    }

    public function edit(Role $role)
    {
        abort_unless(\Gate::allows('Roles Edit'), 403);

        $permissions = Permission::all();
        $rolePermissions = \DB::table("role_has_permissions")->join('permissions', 'role_has_permissions.permission_id', '=', 'permissions.id')->where("role_has_permissions.role_id", $role->id)
            ->get();

        return view('admin.roles.edit', compact('role', 'permissions', 'rolePermissions'));
    }

    public function update(UpdateRoleRequest $request, Role $role)
    {
        abort_unless(\Gate::allows('Roles Edit'), 403);

        $role->update(['name' => $request->input('name')]);
        $role->syncPermissions($request->input('permission'));

        return redirect()->route('admin.roles.index')->with('success', 'Role has been updated');
    }

    public function destroy(Role $role)
    {
        abort_unless(\Gate::allows('Roles Delete'), 403);

        $role->delete();
        return redirect()->route('admin.roles.index')->with('success', 'Role has been deleted');
    }
}
