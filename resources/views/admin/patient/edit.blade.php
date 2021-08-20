@extends('layouts.master', ['title' => 'Roles'])

@section('content')
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <h4 class="page-title">Add Pasien</h4>
    </div>
</div>
<form action="{{ route('admin.pasien.update') }}" method="post">
    @method('PATCH')
    @csrf
    @include('admin.patient.form')
</form>
@stop