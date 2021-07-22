@extends('layouts.master', ['title' => 'Ruangan'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Ruangan</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Ruangan</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.ruangan.store') }}" method="post">
                    @csrf

                    <input type="hidden" name="cabang_id" value="{{ $cabang->id }}">
                    <div class="form-group">
                        <label>Nama Ruangan</label>
                        <input type="text" name="nama_ruangan" id="nama_ruangan" class="form-control">

                        @error('nama_ruangan')
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