@extends('layouts.master', ['title' => 'Rincian Komisi'])

@section('content')
<div class="row">
    <div class="col-md-4">
        <h1 class="page-title">Rincian Komisi</h1>
    </div>
</div>

<x-alert></x-alert>

<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped custom-table" id="appointments" width="100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>No Appointment</th>
                        <th>Nama Pasien</th>
                        <!-- <th>Dokter</th> -->
                        <th>Cabang</th>
                        <th>Tanggal Booking</th>
                        <th>Waktu Booking</th>
                        <th>Status</th>
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
                url: '/supervisor/komisi/ajax',
                get: 'get'
            },
            columns: [{
                    data: 'id',
                    name: 'id'
                },
                {
                    data: 'booking',
                    name: 'booking'
                },
                {
                    data: 'pasien',
                    name: 'pasien'
                },
                // {
                //     data: 'dokter',
                //     name: 'dokter'
                // },
                {
                    data: 'cabang',
                    name: 'cabang'
                },
                {
                    data: 'tgl',
                    name: 'tgl'
                },
                {
                    data: 'waktu',
                    name: 'waktu'
                },
                {
                    data: 'status',
                    name: 'status'
                },
            ]
        })
    })
</script>
@stop