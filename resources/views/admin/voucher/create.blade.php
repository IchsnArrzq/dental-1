@extends('layouts.master', ['title' => 'Voucher'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Voucher</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Voucher</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.voucher.store') }}" method="post">
                    @csrf

                    @include('admin.voucher.form')

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop