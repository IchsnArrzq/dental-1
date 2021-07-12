@extends('layouts.master', ['title' => 'Edit User'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Edit User</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Users</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.users.update', $user->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" class="form-control" value="{{ $user->name }}">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" id="email" class="form-control" value="{{ $user->email }}">
                            </div>
                            <div class="form-group">
                                <label for="phone_number">Phone Number</label>
                                <input type="number" name="phone_number" id="phone_number" class="form-control" value="{{ $user->email }}">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="role">Role</label>
                                <select name="role" id="role" class="form-control">
                                    <option disabled selected>-- Select Role --</option>
                                    @foreach($roles as $role)
                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="cabang">Cabang</label>
                                <select name="cabang" id="cabang" class="form-control">
                                    <option disabled selected>-- Select Cabang --</option>
                                    @foreach($roles as $role)
                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea name="address" id="address" rows="3" class="form-control">{{ $user->address }}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="image">Image Profile</label><br>
                                <input type="file" name="image" id="image">
                            </div>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop