@extends('layouts.master', ['title' => 'Warehouse'])

@section('content')
<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Edit Warehouse</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Edit Warehouse</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.warehouse.update', $warehouse->id) }}" method="post">
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="nama" id="name" class="form-control" value="{{ $warehouse->nama }}">

                        @error('nama')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Phone</label>
                        <input type="number" name="telepon" id="phone" class="form-control" value="{{ $warehouse->telepon }}">

                        @error('telepon')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" id="email" class="form-control" value="{{ $warehouse->email }}">

                        @error('email')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Whatsapp</label>
                        <input type="number" name="wa" id="whatsapp" class="form-control" value="{{ $warehouse->wa }}">

                        @error('wa')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <textarea name="alamat" id="alamat" rows="3" class="form-control">{{ $warehouse->alamat }}</textarea>

                        @error('alamat')
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