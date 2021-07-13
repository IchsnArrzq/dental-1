@extends('layouts.master', ['title' => 'Warehouse'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Warehouse</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Warehouse</h5>
            </div>

            <div class="card-body">
                @can('Warehouse Create')
                <a href="{{ route('admin.warehouse.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Warehouse</a>
                @endcan
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Whatsapp</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($warehouses as $warehouse)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $warehouse->nama }}</td>
                            <td>{{ $warehouse->alamat }}</td>
                            <td>{{ $warehouse->telepon }}</td>
                            <td>{{ $warehouse->email }}</td>
                            <td>{{ $warehouse->wa }}</td>
                            <td>
                                @can('Warehouse Edit')
                                <a href="{{ route('admin.warehouse.edit', $warehouse->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                @endcan
                                @can('Warehouse Delete')
                                <form action="{{ route('admin.warehouse.destroy', $warehouse->id) }}" method="post" style="display: inline;" class="delete-form">
                                    @method('DELETE')
                                    @csrf
                                    <button type="submit" class="btn btn-sm btn-danger delete"><i class="fa fa-trash"></i></button>
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