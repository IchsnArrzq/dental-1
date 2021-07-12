@extends('layouts.master', ['title' => 'Master User'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Master User</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Data Users</h5>
            </div>

            <div class="card-body">
                <a href="{{ route('admin.users.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add User</a>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Cabang</th>
                            <th>Mac Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($users as $user)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->roles }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->mac_address }}</td>
                            <td>
                                <a href="{{ route('admin.users.edit', $user->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                <form action="" method="post" style="display: inline;">
                                    @method('DELETE')
                                    @csrf
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop