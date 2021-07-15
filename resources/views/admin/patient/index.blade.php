@extends('layouts.master', ['title' => 'Patients'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Patients</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Patients</h5>
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
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Date of Birth</th>
                                <th>Gender</th>
                                <th>Tribe</th>
                                <th>Address</th>
                                <th>Profession</th>
                                <th>Marketing</th>
                                <th>Warehouse</th>
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
                                <td>{{ $patient->warehouse->nama }}</td>
                                <td>
                                    @can('patient-show')
                                    <a href="{{ route('admin.patients.show', $patient->id) }}" class="btn btn-sm btn-success"><i class="fa fa-eye"></i></a>
                                    @endcan
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