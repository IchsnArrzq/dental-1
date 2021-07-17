@extends('layouts.master', ['title' => 'Voucher'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Voucher</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Voucher</h5>
            </div>

            <div class="card-body">
                @can('roles-create')
                <a href="{{ route('admin.voucher.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Voucher</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Voucher Number</th>
                                <th>Start</th>
                                <th>End</th>
                                <th>Min Trx</th>
                                <th>Min or Per</th>
                                <th>Nominal</th>
                                <th>Percentage</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($vouchers as $voucher)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $voucher->kode_voucher }}</td>
                                <td>{{ $voucher->tgl_mulai }}</td>
                                <td>{{ $voucher->tgl_akhir }}</td>
                                <td>@currency($voucher->min_transaksi)</td>
                                <td>{{ $voucher->type }}</td>
                                <td>@currency($voucher->nominal)</td>
                                <td>{{ $voucher->persentase }}</td>
                                <td>
                                    @can('roles-edit')
                                    <a href="{{ route('admin.voucher.edit', $voucher->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('roles-delete')
                                    <form action="{{ route('admin.voucher.destroy', $voucher->id) }}" method="post" style="display: inline;" class="delete-form">
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