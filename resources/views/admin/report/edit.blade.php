@extends('layouts.master', ['title' => 'Komisi'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Edit Komisi</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Komisi</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.komisi.update', $komisi->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <select name="role_id" id="role" class="form-control">
                            <option disabled selected>-- Select Role --</option>
                            @foreach($roles as $role)
                            <option {{ $role->id == $komisi->role_id ? 'selected' : '' }} value="{{ $role->id }}">{{ $role->key }}</option>
                            @endforeach
                        </select>

                        @error('role_id')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Persentase</label>
                        <input type="number" name="persentase" id="persentase" class="form-control" value="{{ $komisi->persentase }}">

                        @error('persentase')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Min Transaksi</label>
                        <input type="number" name="min_transaksi" id="min_transaksi" class="form-control" value="{{ $komisi->min_transaksi }}">

                        @error('min_transaksi')
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