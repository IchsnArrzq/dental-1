@extends('layouts.master', ['title' => 'Holidays'])
@section('content')
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <h4 class="page-title">Add Holiday</h4>
    </div>
</div>
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <div class="card shadow">
            <div class="card-body">
                <div class="m-b-30 text-left">
                    <a href="{{ route('admin.holidays.index') }}" class="btn btn-info btn-sm">Back</a>
                </div>
                <form action="{{ route('admin.holidays.store') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label>Holiday Name <span class="text-danger">*</span></label>
                        <input class="form-control @error('title') is-invalid @enderror" name="title" type="text">
                        @error('title')
                        <div class="invalid-feedback">
                            {{ $message }}
                        </div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label>Holiday Date <span class="text-danger">*</span></label>
                        <div class="cal-icon">
                            <input class="form-control @error('title') is-invalid @enderror datetimepicker" name="holiday_date" type="text">
                            @error('holiday_date')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                            @enderror
                        </div>
                    </div>
                    <div class="m-t-20 text-center">
                        <button class="btn btn-primary submit-btn">Create Holiday</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@stop
