@extends('layouts.master', ['title' => 'Appointment'])

@section('content')

<div class="row">
    <div class="col-sm-12">
        <h4 class="page-title">Appointments List Doctor</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header">
                <a href="{{ url()->previous() }}" class="btn btn-warning">Back</a>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>No Booking</th>
                                <th>Dokter</th>
                                <th>Pasien</th>
                                <th>Status</th>
                                <th>Tindakan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($tindakan as $book)
                            <tr>
                                <td>{{ $book->id }}</td>
                                <td><span>{{ $book->booking->no_booking }}</span></td>
                                <td><span class="custom-badge status-red">{{ $book->dokter->name }}</span></td>
                                <td>{{ $book->booking->pasien->nama }}</td>
                                <td><span class="custom-badge status-{{ $book->booking->status->warna }}">{{ $book->booking->status->status }}</span></td>
                                <td>
                                    <ul class="list-unstyled">
                                        <li>
                                            @if($book->status)
                                            <span class="custom-badge status-green">{{ $book->item->nama_barang }} - {{ $book->dokter->name }}</span>
                                            @else
                                            <span class="custom-badge status-red">{{ $book->item->nama_barang }} - {{ $book->dokter->name }}</span>
                                            @endif
                                        </li>
                                    </ul>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('hrd.appointments.show', $book->booking->id) }}" class="btn btn-success">Image</a>
                                        <a href="{{ route('hrd.appointments.edit', $book->booking->id) }}" class="btn btn-warning">Edit</a>
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