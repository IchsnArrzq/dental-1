@extends('layouts.master', ['title' => 'Holidays'])
@section('content')
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <h4 class="page-title">Add Holiday</h4>
    </div>
</div>
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <form action="{{ route('admin.holidays.update', $holiday->id) }}" method="post">
            @csrf
            @method('put')
            <div class="form-group">
                <label>Holiday Name <span class="text-danger">*</span></label>
                <input class="form-control" name="title" type="text" value="{{ $holiday->title }}">
            </div>
            <div class="form-group">
                <label>Holiday Date <span class="text-danger">*</span></label>
                <div class="cal-icon">
                    <input class="form-control datetimepicker" name="holiday_date" value="{{ Carbon\Carbon::parse($holiday->holiday_date)->format('d/m/Y') }}" type="text">
                </div>
            </div>
            <div class="m-t-20 text-center">
                <button class="btn btn-primary submit-btn">Update Holiday</button>
            </div>
        </form> 
    </div>
</div>
@stop
