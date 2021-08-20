@extends('layouts.master', ['title' => 'Add User'])

@section('content')
<div class="row">
    <div class="col-lg-8">
        <h4 class="page-title">Add Pasien</h4>
    </div>
</div>

<form action="{{ route('admin.users.store') }}" method="post" enctype="multipart/form-data">
    @csrf
    @include('admin.users.form')

</form>
@stop