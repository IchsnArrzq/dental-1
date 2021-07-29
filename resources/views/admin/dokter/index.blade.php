@extends('layouts.master', ['title' => 'Master Dokter'])

@section('content')
<div class="row">
    <div class="col-md-12">

        <x-alert></x-alert>

        <div class="row">
            <div class="col-sm-4 col-3">
                <h1 class="page-title">Master Dokter</h1>
            </div>
            <div class="col-sm-8 col-9 text-right m-b-20">
                <a href="add-doctor.html" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Doctor</a>
            </div>
        </div>
        <div class="row doctor-grid">
            @foreach($dokter as $dok)
            <div class="col-md-4 col-sm-4  col-lg-3">
                <div class="profile-widget">
                    <div class="doctor-img">
                        <a class="avatar" href=""><img alt="" src="{{ Storage::url('/storage/app/$images->filename') }}"></a>
                    </div>
                    <div class="dropdown profile-action">
                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="edit-doctor.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_doctor"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                        </div>
                    </div>
                    <h4 class="doctor-name text-ellipsis"><a href="profile.html">{{ $dok->name }}</a></h4>
                    <div class="user-country">
                        <i class="fa fa-map-marker"></i> {{ $dok->address }}
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
@stop