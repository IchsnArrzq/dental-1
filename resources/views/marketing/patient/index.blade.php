@extends('layouts.master', ['title' => 'Pasien'])

@section('content')
<div class="row">
    <div class="col-sm-4 col-3">
        <h4 class="page-title">Pasien</h4>
    </div>
    <div class="col-sm-8 col-9 text-right m-b-20">
        @can('patient-create')
        <a href="{{ route('admin.pasien.create') }}" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Pasien</a>
        @endcan
    </div>
</div>

<x-alert></x-alert>

<div class="row">
    <div class="col-sm-12">
        <div class="table-responsive">
            <table class="table table-bordered table-striped custom-table datatable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Telp</th>
                        <th>Email</th>
                        <th>TTL</th>
                        <!-- <th>JK</th> -->
                        <!-- <th>Suku</th> -->
                        <th>Alamat</th>
                        <!-- <th>Profesi</th> -->
                        <th>Marketing</th>
                        <th>Cabang</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($patients as $patient)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $patient->nama }}</td>
                        <td>{{ $patient->no_telp }}</td>
                        <td>{{ $patient->email }}</td>
                        <td>{{ $patient->ttl }}</td>
                        <!-- <td>{{ $patient->jk }}</td> -->
                        <!-- <td>{{ $patient->suku }}</td> -->
                        <td>{{ $patient->alamat }}</td>
                        <!-- <td>{{ $patient->pekerjaan }}</td> -->
                        <td>{{ $patient->user->name }}</td>
                        <td>{{ $patient->cabang->nama }}</td>
                        <td>
                            @can('patient-edit')
                            <a href="{{ route('admin.pasien.edit', $patient->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                            @endcan
                            @can('patient-delete')
                            <form action="{{ route('admin.pasien.destroy', $patient->id) }}" method="post" style="display: inline;" class="delete-form">
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
@stop