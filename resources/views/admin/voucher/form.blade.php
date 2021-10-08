<div class="form-group">
    <label for="kode_voucher">Kode Voucher</label>
    <input type="text" name="kode_voucher" id="kode_voucher" class="form-control" value="{{ $voucher->kode_voucher }}">

    @error('kode_voucher')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>
@if(!$voucher->id)
<div class="form-group">
    <label for="jml_voc">Total Generate</label>
    <input type="number" name="jml_voc" id="jml_voc" class="form-control" value="1">

    @error('jml_voc')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>
@endif

<div class="row">
    <div class="col-md-6">

        <div class="form-group">
            <label for="mulai">Tanggal Mulai</label>
            <input type="date" name="tgl_mulai" id="mulai" class="form-control" value="{{ $voucher->tgl_mulai }}">

            @error('tgl_mulai')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="tgl_akhir">Tanggal Akhir</label>
            <input type="date" name="tgl_akhir" id="tgl_akhir" class="form-control" value="{{ $voucher->tgl_akhir }}">

            @error('tgl_akhir')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="min_transaksi">Min Transaksi</label>
            <input type="number" name="min_transaksi" id="min_transaksi" class="form-control" value="{{ $voucher->min_transaksi ?? 0 }}">

            @error('min_transaksi')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="nominal">Nominal</label>
            <input type="number" name="nominal" id="nominal" class="form-control" value="{{ $voucher->nominal ?? 0 }}">

            @error('nominal')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="type">Type</label>
            <select name="type" id="type" class="form-control">
                <option disabled selected>-- Select Type --</option>
                <option {{ $voucher->type == 'Min' ? 'selected' : '' }} value="Min">Min</option>
                <option {{ $voucher->type == 'Per' ? 'selected' : '' }} value="Per">Per</option>
            </select>

            @error('type')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="persentase">Persentase</label>
            <input type="number" name="persentase" id="persentase" class="form-control" value="{{ $voucher->persentase ?? 0 }}">

            @error('persentase')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
    </div>
</div>

<div class="m-t-20 text-center">
    <button type="submit" class="btn btn-primary submit-btn"><i class="fa fa-save"></i> Save</button>
</div>