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
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>No Booking</th>
                                <th>Dokter</th>
                                <th>Dokter Pengganti</th>
                                <th>Pasien</th>
                                <th>Tindakan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($booking as $book)
                            <tr>
                                <td>{{ $book->id }}</td>
                                <td><span>{{ $book->no_booking }}</span></td>
                                <td>{{ $book->dokter->name }}</td>
                                <td>{{ $book->dokter_pengganti->name ?? 'Kosong' }}</td>
                                <td>{{ $book->pasien->nama }}</td>
                                <td>
                                    @foreach($book->tindakan as $row)
                                    <ul class="list-unstyled">
                                        <li>
                                            @if($row->status)
                                            <span class="custom-badge status-green">{{ $row->item->nama_barang }} - {{ $row->dokter->name }}</span>
                                            @else
                                            <span class="custom-badge status-red">{{ $row->item->nama_barang }} - {{ $row->dokter->name }}</span>
                                            @endif
                                        </li>
                                    </ul>
                                    @endforeach
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('hrd.appointments.show', $book->id) }}" class="btn btn-success">Image</a>
                                        <a href="{{ route('hrd.appointments.edit', $book->id) }}" class="btn btn-warning">Edit</a>
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