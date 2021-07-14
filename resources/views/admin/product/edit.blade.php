@extends('layouts.master', ['title' => 'Product'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Edit Product</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Product</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.product.update', $product->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Product Code</label>
                        <input type="text" name="kode_barang" id="name" class="form-control" value="{{ $product->kode_barang }}">

                        @error('kode_barang')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="nama_barang" id="name" class="form-control" value="{{ $product->nama_barang }}">

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