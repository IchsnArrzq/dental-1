@extends('layouts.master', ['title' => 'Pricelist'])
@section('content')

<div class="row">
    <div class="col-sm-4">
        <h4 class="page-title">Pricelist</h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-body">

                <div class="table-responsive">
                    <table class="table table-bordered custom-table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama</th>
                                <th>Cabang</th>
                                <th>Harga</th>
                                <th>Durasi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($barang as $data)
                            <tr>
                                <td>{{ $data->id }}</td>
                                <td>{{ $data->nama_barang }}</td>
                                <td>
                                    <ul class="list-unstyled">
                                        @foreach($data->produkharga as $row)
                                        <li>{{ $row->cabang->nama }}</li>
                                        @endforeach
                                    </ul>
                                </td>
                                <td>
                                    <ul class="list-unstyled">
                                        @foreach($data->produkharga as $row)
                                        <li>Rp. {{ number_format($row->harga) }}</li>
                                        @endforeach
                                    </ul>
                                </td>
                                <td>
                                    {{ $data->durasi }}
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