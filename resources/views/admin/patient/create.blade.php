@extends('layouts.master', ['title' => 'Patients'])

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1 class="page-title">Add Patient</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="text-bold card-title">Add Patient</h5>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.patients.store') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="nama" id="name" class="form-control">

                        @error('nama')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" id="email" class="form-control">

                        @error('email')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Phone</label>
                        <input type="number" name="no_telp" id="phone" class="form-control">

                        @error('no_telp')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Date of Birth</label>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" name="place" id="place" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <input type="date" name="date" id="date" class="form-control">
                            </div>
                        </div>

                        @error('date')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Gender</label>
                        <div class="radio">
                            <input type="radio" name="jk" id="jk" value="Laki-Laki"> Laki-Laki
                            <input type="radio" name="jk" id="jk" value="Perempuan" class="ml-3"> Perempuan
                        </div>

                        @error('jk')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Tribe</label>
                        <input type="text" name="suku" id="tribse" class="form-control">

                        @error('suku')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Profession</label>
                        <input type="text" name="pekerjaan" id="profession" class="form-control">

                        @error('pekerjaan')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Account Number</label>
                        <input type="number" name="no_rek" id="profession" class="form-control">

                        @error('no_rek')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <textarea name="alamat" id="alamat" rows="3" class="form-control"></textarea>

                        @error('alamat')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Picture</label>
                        <input type="file" name="pict" id="pict" class="form-control">

                        @error('pict')
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