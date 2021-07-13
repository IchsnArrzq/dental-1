@extends('layouts.master', ['title' => 'Roles'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Roles</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Roles</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.roles.store') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" id="name" class="form-control">

                        @error('name')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Permissions</label>
                        <select name="permission[]" id="permisson" class="form-control select2" multiple>
                            @foreach($permissions as $permission)
                            <option value="{{ $permission->id }}">{{ $permission->name }}</option>
                            @endforeach
                        </select>

                        @error('permission')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
@stop