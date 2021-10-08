@extends('layouts.master', ['title' => 'Appointments'])

@section('content')
<div class="row">
    <div class="col-md-4">
        <h1 class="page-title">Appointments</h1>
    </div>
</div>

<x-alert></x-alert>

<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped custom-table datatable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>No Appointment</th>
                        <th>Nama Pasien</th>
                        <th>Dokter</th>
                        <th>Cabang</th>
                        <th>Tanggal Booking</th>
                        <th>Waktu Booking</th>
                        <th>Status Kedatangan</th>
                        <th>Tindakan</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($appointments as $appointment)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td><a href="{{ route('resepsionis.appointments.show', $appointment->id) }}">{{ $appointment->no_booking }}</a></td>
                        <td>{{ $appointment->pasien->nama }}</td>
                        <td>{{ $appointment->dokter->name }}</td>
                        <td>{{ $appointment->cabang->nama }}</td>
                        <td>{{ \Carbon\Carbon::parse($appointment->tanggal_status)->format('d/m/Y') }}</td>
                        <td>{{ \Carbon\Carbon::parse($appointment->jam_status)->format('H.i')  }} - {{ \Carbon\Carbon::parse($appointment->jam_selesai)->format('H.i')  }}</td>
                        <td><span class="custom-badge status-{{ $appointment->kedatangan->warna}}">{{ $appointment->kedatangan->status}}</span></td>
                        <td>
                            @if($appointment->tindakan->where('status', 0)->count() > 0)
                            <button class="custom-badge status-red d-flex justify-content-between">
                                Belum
                                <span>{{ $appointment->tindakan->where('status', 0)->count() }}</span>
                            </button>
                            @else
                            <button class="custom-badge status-green">
                                Selesai
                            </button>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@stop