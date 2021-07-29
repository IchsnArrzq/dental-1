@extends('layouts.master', ['title' => 'Add User'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Add User</h1>

        <x-alert></x-alert>

        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Users</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.users.store') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    @include('admin.users.form')
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop