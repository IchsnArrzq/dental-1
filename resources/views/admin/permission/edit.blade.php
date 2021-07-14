@extends('layouts.master', ['title' => 'Permissions'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Edit Permissions</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Permissions</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.permissions.update', $permission->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" id="name" class="form-control" value="{{ $permission->key }}">
                    </div>

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop