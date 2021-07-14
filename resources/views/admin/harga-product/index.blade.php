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
                @can('roles-create')
                <a href="{{ route('admin.roles.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Role</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Name</th>
                                <th>Key Access</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($roles as $role)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $role->key }}</td>
                                <td>{{ $role->name }}</td>
                                <td>
                                    @can('roles-show')
                                    <a href="{{ route('admin.roles.show', $role->id) }}" class="btn btn-sm btn-success"><i class="fa fa-eye"></i></a>
                                    @endcan
                                    @can('roles-edit')
                                    <a href="{{ route('admin.roles.edit', $role->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('roles-delete')
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
</div>
@stop