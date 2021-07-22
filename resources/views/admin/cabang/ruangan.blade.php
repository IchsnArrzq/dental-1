@extends('layouts.master', ['title' => 'Ruangan'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Ruangan ({{ $cabang->nama }})</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Ruangan</h5>
            </div>

            <div class="card-body">
                @can('cabang-create')
                <a href="/admin/ruangan/{{$cabang->id}}/create" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Ruangan</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Nama Ruangan</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($ruangan as $ruang)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $ruang->nama_ruangan }}</td>
                                <td>
                                    <a href="{{ route('admin.ruangan.edit', $ruang->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>

                                    <form action="{{ route('admin.ruangan.destroy', $ruang->id) }}" method="post" style="display: inline;" class="delete-form">
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
</div>
@stop