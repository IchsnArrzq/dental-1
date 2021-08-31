@extends('layouts.master', ['title' => 'Pasien'])

@section('content')
<div class="row">
    <div class="col-sm-4">
        <h4 class="page-title">Pasien - {{ auth()->user()->cabang->nama }}</h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-border table-striped" id="table" width="100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Umur</th>
                        <th>Alamat</th>
                        <th>Jenis Kelamin</th>
                        <th>NIK KTP</th>
                        <th>Suku</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="{{ asset('/') }}js/jquery-3.2.1.min.js"></script>
<script>
    $(document).ready(function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $('#table').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '/dokter/ajax/pasien',
                get: 'get'
            },
            columns: [{
                    data: 'id',
                    name: 'id'
                },
                {
                    data: 'nama',
                    name: 'nama'
                },
                {
                    data: 'umur',
                    name: 'umur'
                },
                {
                    data: 'alamat',
                    name: 'alamat'
                },
                {
                    data: 'jk',
                    name: 'jk'
                },
                {
                    data: 'nik_ktp',
                    name: 'nik_ktp'
                },
                {
                    data: 'suku',
                    name: 'suku'
                }
            ]
        })
    })
</script>
@stop