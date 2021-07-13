<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateUserRequest;
use App\{User, Warehouse};
use App\Http\Requests\StoreUserRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function index()
    {
        abort_unless(Gate::allows('User Access'), 403);

        $users = User::with('warehouse')->get();

        return view('admin.users.index', compact('users'));
    }

    public function create()
    {
        abort_unless(Gate::allows('User Create'), 403);

        $roles = Role::get();
        $warehouses = Warehouse::get();

        return view('admin.users.create', compact('roles', 'warehouses'));
    }

    public function store(StoreUserRequest $request)
    {
        abort_unless(Gate::allows('User Create'), 403);

        $attr = $request->all();
        $image = $request->file('image');
        $imageUrl = $image->storeAs('images/users', \Str::random(15) . '.' . $image->extension());

        $attr['image'] = $imageUrl;
        $attr['is_active'] = 1;
        $attr['password'] = Hash::make($request->password);

        $user = User::create($attr);

        $user->assignRole($request->input('role'));

        return redirect()->route('admin.users.index')->with('success', 'User has been added');
    }


    public function edit(User $user)
    {
        abort_unless(Gate::allows('User Edit'), 403);

        $roles = Role::get();
        $warehouses = Warehouse::get();

        return view('admin.users.edit', compact('user', 'roles', 'warehouses'));
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        abort_unless(Gate::allows('User Edit'), 403);

        $attr = $request->all();

        if ($request->input('password') == null) {
            $attr['password'] = $user->password;
        } else {
            $attr['password'] =  Hash::make($request->password);
        }

        $image = $request->file('image');

        if ($request->file('image')) {
            Storage::delete($user->image);
            $imageUrl = $image->storeAs('images/users', \Str::random(15) . '.' . $image->extension());
            $attr['image'] = $imageUrl;
        } else {
            $attr['image'] = $user->image;
        }

        $user->update($attr);
        $user->syncRoles($request->input('role'));

        return redirect()->route('admin.users.index')->with('success', 'User has been updated');
    }

    public function destroy(User $user)
    {
        abort_unless(Gate::allows('User Delete'), 403);

        $user->delete();
        return redirect()->route('admin.users.index')->with('success', 'User has been deleted');
    }
}
