@extends('layouts.master', ['title' => 'Service'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Service</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Service</h5>
            </div>

            <div class="card-body">
                @can('service-create')
                <a href="{{ route('admin.service.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Service</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Kode Service</th>
                                <th>Nama</th>
                                <th>Durasi</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($services as $service)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $service->kode_barang }}</td>
                                <td>{{ $service->nama_barang }}</td>
                                <td>{{ $service->durasi }}</td>
                                <td>
                                    @can('service-edit')
                                    <a href="{{ route('admin.service.edit', $service->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('service-delete')
                                    <form action="{{ route('admin.service.destroy', $service->id) }}" method="post" style="display: inline;" class="delete-form">
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