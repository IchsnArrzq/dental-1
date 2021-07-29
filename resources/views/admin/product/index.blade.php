@extends('layouts.master', ['title' => 'Produk'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Produk</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Produk</h5>
            </div>

            <div class="card-body">
                @can('product-create')
                <a href="{{ route('admin.product.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Produk</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Kode Produk</th>
                                <th>Nama</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($products as $product)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $product->kode_barang }}</td>
                                <td>{{ $product->nama_barang }}</td>
                                <td>
                                    @can('product-edit')
                                    <a href="{{ route('admin.product.edit', $product->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('product-delete')
                                    <form action="{{ route('admin.product.destroy', $product->id) }}" method="post" style="display: inline;" class="delete-form">
                                        @method('DELETE')
                                        @csrf
                                        <button type="submit" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                                    </form>
                                    @endcan
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop