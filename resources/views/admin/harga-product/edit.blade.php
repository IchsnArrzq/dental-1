@extends('layouts.master', ['title' => 'Price Product'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">
            @if(request()->is('admin/price-product*'))
            Edit Price Product
            @else
            Edit Price Service
            @endif
        </h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">
                    @if(request()->is('admin/price-product*'))
                    Edit Price Product
                    @else
                    Edit Price Service
                    @endif
                </h5>
            </div>

            <div class="card-body">
                @if(request()->is('admin/price-product*'))
                <form action="/admin/price-product/{{ $price->id }}/update" method="post">
                    @else
                    <form action="/admin/price-service/{{ $price->id }}/update" method="post">
                        @endif
                        @method('PATCH')
                        @csrf
                        <div class="form-group">
                            <label>Product</label>
                            <select name="barang_id" id="product" class="form-control">
                                <option disabled selected>-- Choose Product --</option>
                                @foreach($products as $product)
                                <option {{ $price->barang_id == $product->id ? 'selected' : '' }} value="{{ $product->id }}">{{ $product->nama_barang }}</option>
                                @endforeach
                            </select>

                            @error('barang_id')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" name="harga" id="name" class="form-control" value="{{ $price->harga }}">

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