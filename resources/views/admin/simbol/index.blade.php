@extends('layouts.master', ['title' => 'Simbol Odontogram'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Simbol Odontogram</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Simbol Odontogram</h5>
            </div>

            <div class="card-body">
                @can('simbol-edit')
                <a href="{{ route('admin.simbol.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Simbol</a>

                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Nama</th>
                                <th>Singkatan</th>
                                <th width="20">Warna</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($simbol as $smb)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $smb->nama_simbol }}</td>
                                <td>{{ $smb->singkatan }}</td>
                                <td>
                                    <div class="" style=" background-color: {{ $smb->warna }}">&nbsp; &nbsp;</div>
                                </td>
                                <td>
                                    @can('simbol-edit')
                                    <a href="{{ route('admin.simbol.edit', $smb->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('simbol-delete')
                                    <form action="{{ route('admin.simbol.destroy', $smb->id) }}" method="post" style="display: inline;" class="delete-form">
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