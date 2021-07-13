@extends('layouts.master', ['title' => 'Roles'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Roles</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Roles List</h5>
            </div>

            <div class="card-body">
                @can('Roles Access')
                <a href="{{ route('admin.roles.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Role</a>
                @endcan
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Permissions</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($roles as $role)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $role->name }}</td>
                            <td>
                                @php
                                $permissions = \Spatie\Permission\Models\Permission::join("role_has_permissions","role_has_permissions.permission_id","=","permissions.id")
                                ->where("role_has_permissions.role_id",$role->id)
                                ->get();
                                @endphp
                                @foreach($permissions as $permission)
                                <span class="badge badge-info">{{ $permission->name }}</span>
                                @endforeach
                            </td>
                            <td>
                                @can('Roles Edit')
                                <a href="{{ route('admin.roles.edit', $role->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                @endcan
                                @can('Roles Delete')
                                <form action="{{ route('admin.roles.destroy', $role->id) }}" method="post" style="display: inline;" class="delete-form">
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
@stop