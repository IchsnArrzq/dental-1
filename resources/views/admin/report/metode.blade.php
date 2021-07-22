@extends('layouts.master', ['title' => 'Laporan Metode Pembayaran'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Laporan Metode Pembayaran</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Laporan Metode Pembayaran</h5>
            </div>

            <div class="card-body">
                <form action="" method="get" id="form" class="mb-3">
                    @csrf
                    <div class="row">
                        <div class="col-md-3 col-12">
                            <div class="form-group">
                                <label for="metode">Metode</label>
                                <select name="metode" id="metode" class="form-control">
                                    <option>-- Select Metode --</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-12">
                            <div class="form-group">
                                <label for="mulai">Mulai</label>
                                <input type="date" name="mulai" id="mulai" class="form-control" value="{{ request('mulai') ? request('mulai') : '' }}">

                                @error('mulai')
                                <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-3 col-12">
                            <div class="form-group">
                                <label for="sampai">Sampai</label>
                                <input type="date" name="sampai" id="sampai" class="form-control" value="{{ request('sampai') ? request('sampai') : '' }}">

                                @error('sampai')
                                <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-3 col-12">
                            <button type="submit" class="btn btn-primary mt-4">Submit</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Role</th>
                                <th>Persentase</th>
                                <th>Min Transaksi</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop