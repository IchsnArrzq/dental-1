@extends('layouts.master', ['title' => 'Service'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Edit Service</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Service</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.service.update', $service->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Service Code</label>
                        <input type="text" name="kode_barang" id="name" class="form-control" value="{{ $service->kode_barang }}">

                        @error('kode_barang')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="nama_barang" id="name" class="form-control" value="{{ $service->nama_barang }}">

                        @error('nama_barang')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Duration</label>
                        <input type="number" name="durasi" id="name" class="form-control" value="{{ $service->durasi }}">

                        @error('durasi')
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