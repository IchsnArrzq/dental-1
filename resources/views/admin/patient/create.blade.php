@extends('layouts.master', ['title' => 'Pasien'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Add Pasien</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Pasien</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.patients.store') }}" method="post" enctype="multipart/form-data">
                    @csrf

                    @include('admin.patient.form')

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop