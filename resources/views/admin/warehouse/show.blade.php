@extends('layouts.master', ['title' => 'Warehouse'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Name : {{ $warehouse->nama }}</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Price List Service</h5>
            </div>

            <div class="card-body">
                <a href="/admin/price-service/{{ $warehouse->id }}/create" class=" btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Price Service</a>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Service Code</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Duration</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($services as $service)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $service->product->kode_barang }}</td>
                                <td>{{ $service->product->nama_barang }}</td>
                                <td>@currency($service->harga)</td>
                                <td>{{ $service->product->durasi }}</td>
                                <td>
                                    @can('product-edit')
                                    <a href="/admin/price-service/{{ $service->id }}/edit" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('product-delete')
                                    <form action="/admin/price/{{ $service->id }}/destroy" method="post" style="display: inline;" class="delete-form">
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

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Price List Product</h5>
            </div>

            <div class="card-body">
                <a href="/admin/price-product/{{ $warehouse->id }}/create" class=" btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Price Product</a>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Product Code</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($products as $product)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $product->product->kode_barang }}</td>
                                <td>{{ $product->product->nama_barang }}</td>
                                <td>@currency($product->harga)</td>
                                <td>
                                    <a href="/admin/price-product/{{ $product->id }}/edit" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>

                                    @can('product-delete')
                                    <form action="/admin/price/{{ $product->id }}/destroy" method="post" style="display: inline;" class="delete-form">
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