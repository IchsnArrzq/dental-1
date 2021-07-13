@extends('layouts.master', ['title' => 'Permissions'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Permissions</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Permissions List</h5>
            </div>

            <div class="card-body">
                @can('Permission Create')
                <a href="{{ route('admin.permissions.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Permission</a>
                @endcan
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Guard Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($permissions as $permission)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $permission->name }}</td>
                            <td>{{ $permission->guard_name }}</td>
                            <td>
                                @can('Permission Edit')
                                <a href="{{ route('admin.permissions.edit', $permission->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                @endcan
                                @can('Permission Delete')
                                <form action="{{ route('admin.permissions.destroy', $permission->id) }}" method="post" style="display: inline;" class="delete-form">
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