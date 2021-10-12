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
            <table class="table table-striped custom-table" width="100%" id="appointments">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Appointment ID</th>
                        <th>Nama Pasien</th>
                        <th>Dokter</th>
                        <th>Cabang</th>
                        <th>Tanggal Booking</th>
                        <th>Waktu Booking</th>
                        <th>Status Kedatangan</th>
                        <!-- <th>Action</th> -->
                    </tr>
                </thead>

                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
@stop

@section('footer')
<script>
    $(document).ready(function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $('#appointments').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '/admin/appointments/ajax',
                get: 'get'
            },
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'no_booking',
                    name: 'no_booking'
                },
                {
                    data: 'pasien',
                    name: 'pasien'
                },
                {
                    data: 'dokter',
                    name: 'dokter'
                },
                {
                    data: 'cabang',
                    name: 'cabang'
                },
                {
                    data: 'tgl_status',
                    name: 'tgl_status'
                },
                {
                    data: 'waktu',
                    name: 'waktu'
                },
                {
                    data: 'kedatangan',
                    name: 'kedatangan'
                },
            ]
        })
    })
</script>
@stop