@extends('layouts.master', ['title' => 'Product'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Product</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Product</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.product.store') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label>Product Code</label>
                        <input type="text" name="kode_barang" id="name" class="form-control">

                        @error('kode_barang')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="nama_barang" id="name" class="form-control">

                        @error('nama_barang')
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