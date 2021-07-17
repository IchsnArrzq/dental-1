@extends('layouts.master', ['title' => 'Payment'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Edit Payment</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Payment</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.payments.update', $payment->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="nama_metode" id="name" class="form-control" value="{{ $payment->nama_metode }}">

                        @error('nama_metode')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Piece</label>
                        <input type="text" name="potongan" id="potongan" class="form-control" value="{{ $payment->potongan }}">

                        @error('potongan')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Account Number</label>
                        <input type="text" name="rekening" id="rekening" class="form-control" value="{{ $payment->rekening }}">

                        @error('rekening')
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