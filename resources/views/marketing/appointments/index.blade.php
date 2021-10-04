@extends('layouts.master', ['title' => 'Appointment'])
@section('content')
<div class="row">
    <div class="col-sm-4 col-3">
        <h4 class="page-title">Appointments</h4>
    </div>
    <div class="col-sm-8 col-9 text-right m-b-20">
        <a href="{{ route('marketing.dashboard') }}" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Appointment</a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-body">

                <div class="table-responsive">
                    <table class="table table-striped custom-table datatable">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>No Booking</th>
                                <th>Nama Pasien</th>
                                <th>Umur</th>
                                <th>Dokter</th>
                                <th>Cabang</th>
                                <th>Tanggal</th>
                                <th>Waktu</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($booking as $data)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td><a href="{{ route('marketing.appointments.show', $data->id) }}"><span class="badge badge-success">{{ $data->no_booking }}</span></a></td>
                                <td>{{ $data->pasien->nama }}</td>
                                <td>{{ (int)Carbon\Carbon::now()->format('Y') - (int)Carbon\Carbon::parse($data->pasien->tgl_lahir)->format('Y') }}</td>
                                <td>{{ $data->dokter->name }}</td>
                                <td>{{ $data->cabang->nama }}</td>
                                <td>{{ $data->tanggal_status }}</td>
                                <td>{{ $data->jam_status }} - {{ $data->jam_selesai }}</td>
                                <td>
                                    <span class="custom-badge status-{{ $data->kedatangan->warna }}">{{ $data->kedatangan->status }}</span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown dropdown-action">
                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="edit-appointment.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_appointment"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                        </div>
                                    </div>
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