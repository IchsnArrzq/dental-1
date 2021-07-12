@extends('layouts.master', ['title' => 'Roles'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Roles</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Role</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.roles.update', $role->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" id="name" class="form-control" value="{{ $role->name }}">
                    </div>
                    <div class="form-group">
                        <label>Permissions</label>
                        <select name="permission[]" id="permission" class="form-control select2" multiple>
                            @foreach($rolePermissions as $roles)
                            <option value="{{ $roles->permission_id }}" selected>{{ $roles->name }}</option>
                            @endforeach
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