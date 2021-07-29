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

                    @include('admin.product.form')

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop