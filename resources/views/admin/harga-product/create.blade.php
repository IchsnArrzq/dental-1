@extends('layouts.master', ['title' => 'Price Product'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">
            @if(request()->is('admin/price-product*'))
            Add Price Product
            @else
            Add Price Service
            @endif
        </h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">
                    @if(request()->is('admin/price-product*'))
                    Add Price Product
                    @else
                    Add Price Service
                    @endif
                </h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.price-product.store') }}" method="post">
                    @csrf
                    <input type="hidden" name="cabang_id" value="{{ $warehouse->id }}">
                    <div class="form-group">
                        <label>Product</label>
                        <select name="barang_id" id="product" class="form-control">
                            <option disabled selected>-- Choose Product --</option>
                            @foreach($products as $product)
                            <option value="{{ $product->id }}">{{ $product->nama_barang }}</option>
                            @endforeach
                        </select>

                        @error('barang_id')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" name="harga" id="name" class="form-control">

                        @error('harga')
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