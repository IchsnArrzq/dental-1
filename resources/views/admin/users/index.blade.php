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
                @can('user-create')
                <a href="{{ route('admin.users.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add User</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
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
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>
                                    @foreach($user->roles as $role)
                                    <span class="custom-badge status-blue">{{ $role->name }}</span>
                                    @endforeach
                                </td>
                                <td>{{ $user->warehouse->nama }}</td>
                                <td>{{ $user->mac_address }}</td>
                                <td>
                                    @can('user-edit')
                                    <a href="{{ route('admin.users.edit', $user->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('user-delete')
                                    <form action="{{ route('admin.users.destroy', $user->id) }}" method="post" style="display: inline;" class="delete-form">
                                        @method('DELETE')
                                        @csrf
                                        <button type="submit" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                                    </form>
                                    @endcan
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop