@extends('layouts.master', ['title' => 'Payments'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Payments</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Master Payments</h5>
            </div>

            <div class="card-body">
                @can('payment-create')
                <a href="{{ route('admin.payments.create') }}" class="btn btn-primary mb-3"><i class="fa fa-plus"></i> Add Payment</a>
                @endcan
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>Nama</th>
                                <th>Potongan</th>
                                <th>Rekening</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach($payments as $payment)
                            <tr>
                                <td></td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $payment->nama_metode }}</td>
                                <td>{{ $payment->potongan }}</td>
                                <td>{{ $payment->rekening }}</td>
                                <td>
                                    @can('payment-edit')
                                    <a href="{{ route('admin.payments.edit', $payment->id) }}" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></a>
                                    @endcan
                                    @can('payment-delete')
                                    <form action="{{ route('admin.payments.destroy', $payment->id) }}" method="post" style="display: inline;" class="delete-form">
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