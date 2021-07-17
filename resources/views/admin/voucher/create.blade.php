@extends('layouts.master', ['title' => 'Voucher'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Voucher</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Voucher</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.voucher.store') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label>Voucher Number</label>
                        <input type="text" name="kode_voucher" id="name" class="form-control">

                        @error('kode_voucher')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Start</label>
                        <input type="date" name="tgl_mulai" id="tgl_mulai" class="form-control">

                        @error('tgl_mulai')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>End</label>
                        <input type="date" name="tgl_akhir" id="tgl_akhir" class="form-control">

                        @error('tgl_akhir')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Min Transaction</label>
                        <input type="number" name="min_transaksi" id="min_transaksi" class="form-control" value="0">

                        @error('min_transaksi')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Nominal</label>
                        <input type="number" name="nominal" id="nominal" class="form-control" value="0">

                        @error('nominal')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Type</label>
                        <select name="type" id="type" class="form-control">
                            <option disabled selected>-- Select Type --</option>
                            <option value="Min">Min</option>
                            <option value="Per">Per</option>
                        </select>

                        @error('type')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Percentage</label>
                        <input type="number" name="persentase" id="persentase" class="form-control" value="0">

                        @error('persentase')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop