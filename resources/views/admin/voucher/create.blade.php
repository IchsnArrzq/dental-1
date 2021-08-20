@extends('layouts.master', ['title' => 'Voucher'])

@section('content')
<div class="row justify-content-center text-center">
    <div class="col-md-6">
        <h1 class="page-title">Add Voucher</h1>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-md-6">
        <form action="{{ route('admin.voucher.store') }}" method="post">
            @csrf
            @include('admin.voucher.form')
        </form>
    </div>
</div>
@stop