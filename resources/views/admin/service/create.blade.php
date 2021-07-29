@extends('layouts.master', ['title' => 'Service'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Service</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Service</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.service.store') }}" method="post">
                    @csrf

                    @include('admin.service.form')

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop