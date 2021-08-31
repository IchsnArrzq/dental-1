@extends('layouts.master', ['title' => 'Attendance'])

@section('content')
<div class="row">
    <div class="col-sm-4">
        <h4 class="page-title">Attendance Sheet</h4>
    </div>

    <div class="col-sm-8 text-right m-b-20">
        @can('cabang-create')
        <a href="{{ route('admin.attendance.update_user') }}" class="btn btn btn-primary btn-rounded float-right" id="tombol-hapus" value="delete"><i class="fa fa-plus"></i> Update User Bulan ini</a>
        @endcan
    </div>
</div>

<form action="{{ route('admin.attendance.search') }}" method="GET">
    <div class="row filter-row">
        <div class="col-sm-6 col-md-3">
            <div class="form-group form-focus">
                <label class="focus-label">Employee Name</label>
                @csrf
                <input type="text" value="{{ old('pegawai') }}" class="form-control floating" name="pegawai">
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="form-group form-focus select-focus">
                <label class="focus-label">Select Month</label>
                <select class="select floating" name="month" value="{{ old('month') }}">
                    <option value="">-</option>
                    <option value="01">Jan</option>
                    <option value="02">Feb</option>
                    <option value="03">Mar</option>
                    <option value="04">Apr</option>
                    <option value="05">May</option>
                    <option value="06">Jun</option>
                    <option value="07">Jul</option>
                    <option value="08">Aug</option>
                    <option value="09">Sep</option>
                    <option value="10">Oct</option>
                    <option value="11">Nov</option>
                    <option value="12">Dec</option>
                </select>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="form-group form-focus select-focus">
                <label class="focus-label">Select Year</label>
                <select class="select floating" name="year" value="{{ old('year') }}">
                    <option value="">-</option>
                    <option>2022</option>
                    <option>2021</option>
                    <option>2020</option>
                    <option>2019</option>
                    <option>2018</option>
                    <option>2017</option>
                    <option>2016</option>
                    <option>2015</option>
                    <option>2014</option>
                    <option>2013</option>
                </select>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <button type="submit" class="btn btn-success btn-block"> Search </button>
        </div>
    </div>
</form>
@if($message = Session::get('error'))
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    </div>
</div>
@endif

@if($message = Session::get('success'))
<div class="row">
    <div class="col-md-12">
        <div class="alert alert-success">
            {{ $message }}
        </div>
    </div>
</div>
@endif

<div class="row">
    <div class="col-lg-12">
        <!-- <div class="card shadow">
            <div class="card-header">
                <div class="d-flex justify-content-round">
                    <div>
                        <a href="{{ route('admin.attendance.update_user') }}" class="btn btn-info text-light btn-block" id="tombol-hapus" value="delete">Update User Bulan ini</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                
            </div>
        </div> -->

        <div class="table-responsive">
            <table class="table border table-bordered table-hover">
                <tr class="text-center bg-success">
                    <th colspan="33">
                        <h5 class="text-light">Attendance - @if(request('month')) {{ Carbon\Carbon::now()->startOfYear()->addMonth(request('month') - 1)->format('M') }} @else {{ Carbon\Carbon::now()->format('M')}} @endif @if(request('year')) {{ request('year') }} @else {{ Carbon\Carbon::now()->format('Y')}} @endif</h5>
                    </th>
                </tr>
                <tr class="text-center bg-info">
                    <th class="text-light">#</th>
                    <th class="text-light">Pegawai</th>
                    @for($i = 1;$i <= $last_date;$i++) <th class="text-light">{{ $i }}</th> @endfor
                </tr>
                @forelse($user as $data)
                <tr class="text-center">
                    <td>{{ $data->id }}</td>
                    <td><button type="button" id="{{ $data->id }}" class="btn btn-outline-primary button-show" data-toggle="modal" data-target=".bd-example-modal-lg">{{ $data->name }}</button></td>
                    @for($i = 1; $i <= $last_date; $i++) <td>
                        @foreach($data->jadwal as $row)
                        @if(Carbon\Carbon::parse($row->tanggal)->format('m') == Carbon\Carbon::now()->format('m'))
                        @if(Carbon\Carbon::parse($row->tanggal)->format('d') == $i)
                        @if($row->shift->kode == 'SF1'|| $row->shift->kode == 'SF2')
                        <i class="fa fa-check text-success">{{ $row->shift->kode }}</i>
                        @else
                        @if($row->shift->kode == 'L')
                        <i class="fa fa-close text-danger">{{ $row->shift->kode }}</i>
                        @else
                        <i class="fa fa-info text-warning">{{ $row->shift->kode }}</i>
                        @endif
                        @endif
                        @endif
                        @endif
                        @endforeach
                        @foreach($holiday as $list)
                        @if(Carbon\Carbon::parse($list->holiday_date)->format('d') == $i)
                        <i class="fa fa-close text-danger">{{ $list ->title }}</i>
                        @endif
                        @endforeach
                        </td>
                        @endfor
                </tr>
                @empty
                <tr>
                    <td colspan="40">
                        <div class="alert alert-warning text-center">Data Kosong</div>
                    </td>
                </tr>
                @endforelse
            </table>
        </div>
    </div>
</div>

@include('admin.attendance.modal')
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
    $('.button-show').click(function() {
        event.preventDefault()
        dataId = $(this).attr('id');
        $.ajax({
            url: `/admin/attendance/${dataId}`,
            success: function(result) {
                $("#name_user").val(result.name);
                $("#cabang_id").val(result.cabang_id)
                $('#cabang').val(result.cabang)
                $('#ruangan_id').html('')
                $.each(result.ruangan, function() {
                    $('#ruangan_id').append(`<option value="${this.id}">${this.nama_ruangan}</option>`)
                })
            }
        });

        $('#form-delete').attr('action', `/admin/attendance/${dataId}`)
        $('#id').val(dataId)
        $('#show-data').modal('show')
        $('#table-jadwal').DataTable({
            destroy: true,
            processing: true,
            serverSide: true,
            ajax: ({
                url: `/admin/attendance/${dataId}/edit`,
                type: 'get',
                error: err => {
                    alert(err)
                }
            }),
            columns: [{
                    name: "id",
                    data: "id"
                },
                {
                    name: "tanggal",
                    data: "tanggal"
                },
                {
                    name: "kode",
                    data: "kode"
                },
                {
                    name: "cabang",
                    data: "cabang"
                },
                {
                    name: "ruang",
                    data: "ruang"
                },
                {
                    data: "SF1"
                },
                {
                    data: "SF2"
                },
                {
                    data: 'L'
                }
            ]
        })
    })
</script>
@stop