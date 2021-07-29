@extends('layouts.master', ['title' => 'Cabang'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Master Cabang</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Cabang</h5>
            </div>

            <div class="card-body">
                @can('cabang-create')
                <a href="{{ route('admin.cabang.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Cabang</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Nama Cabang</th>
                                <th>Alamat</th>
                                <th>Telp</th>
                                <th>Email</th>
                                <th>Whatsapp</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($cabangs as $cabang)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td><a href="{{ route('admin.cabang.show', $cabang->id) }}">{{ $cabang->nama }}</a></td>
                                <td>{{ $cabang->alamat }}</td>
                                <td>{{ $cabang->telpon }}</td>
                                <td>{{ $cabang->email }}</td>
                                <td>{{ $cabang->wa }}</td>
                                <td>
                                    <a href="/admin/cabang/{{ $cabang->id }}/ruangan" class="btn btn-sm btn-success"><i class="fa fa-home"></i></a>
                                    @can('cabang-edit')
                                    <a href="{{ route('admin.cabang.edit', $cabang->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('cabang-delete')
                                    <form action="{{ route('admin.cabang.destroy', $cabang->id) }}" method="post" style="display: inline;" class="delete-form">
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
</div>
@stop