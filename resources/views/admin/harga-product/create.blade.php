@extends('layouts.master', ['title' => 'Harga Produk'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">
            @if(request()->is('admin/price-product*'))
            Add Harga Produk
            @else
            Add Harga Service
            @endif
        </h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">
                    @if(request()->is('admin/price-product*'))
                    Add Harga Produk
                    @else
                    Add Harga Service
                    @endif
                </h5>
            </div>

            <div class="card-body">
                <form action="/admin/price/store" method="post">
                    @csrf
                    <input type="hidden" name="cabang_id" value="{{ $cabang->id }}">

                    @include('admin.harga-product.form')

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop