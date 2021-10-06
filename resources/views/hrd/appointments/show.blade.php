@extends('layouts.master', ['title' => 'Appointment'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table->bordered">
                        <thead>
                            <tr>
                                <th>No Booking</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($booking as $book)
                            <tr>
                                <td><span>{{ $book->image }}</span></td>
                                <td><a href="{{ route('hrd.appointments.download', $book->id) }}" class="btn btn-primary">Download</a></td>
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