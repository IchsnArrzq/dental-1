<div class="form-group">
    <label for="role">Nama</label>
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
    <label for="persentase">Persentase</label>
    <input type="number" name="persentase" id="persentase" class="form-control" value="{{ $komisi->persentase }}">

    @error('persentase')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>

<div class="form-group">
    <label for="min_transaksi">Min Transaksi</label>
    <input type="number" name="min_transaksi" id="min_transaksi" class="form-control" value="{{ $komisi->min_transaksi }}">

    @error('min_transaksi')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>