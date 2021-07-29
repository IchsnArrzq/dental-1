@extends('layouts.master', ['title' => 'Cabang'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Add Cabang</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Cabang</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.cabang.store') }}" method="post">
                    @csrf

                    @include('admin.cabang.form')

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop