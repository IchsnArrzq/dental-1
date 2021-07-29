@extends('layouts.master', ['title' => 'Pasien'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Pasien</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Pasien</h5>
            </div>

            <div class="card-body">
                @can('patient-create')
                <a href="{{ route('admin.patients.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Patient</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Nama</th>
                                <th>Telp</th>
                                <th>Email</th>
                                <th>Tanggal Lahir</th>
                                <th>JK</th>
                                <th>Suku</th>
                                <th>Alamat</th>
                                <th>Profesi</th>
                                <th>Marketing</th>
                                <th>Cabang</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($patients as $patient)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $patient->nama }}</td>
                                <td>{{ $patient->no_telp }}</td>
                                <td>{{ $patient->email }}</td>
                                <td>{{ $patient->ttl }}</td>
                                <td>{{ $patient->jk }}</td>
                                <td>{{ $patient->suku }}</td>
                                <td>{{ $patient->alamat }}</td>
                                <td>{{ $patient->pekerjaan }}</td>
                                <td>{{ $patient->user->name }}</td>
                                <td>{{ $patient->cabang->nama }}</td>
                                <td>
                                    <a href="{{ route('admin.patients.odontogram', $patient->id) }}" class="btn btn-sm btn-success"><i class="fa fa-plus-square"></i></a>
                                    @can('patient-edit')
                                    <a href="{{ route('admin.patients.edit', $patient->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('patient-delete')
                                    <form action="{{ route('admin.patients.destroy', $patient->id) }}" method="post" style="display: inline;" class="delete-form">
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