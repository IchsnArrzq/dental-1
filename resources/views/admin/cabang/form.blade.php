<div class="form-group">
    <label for="name">Nama</label>
    <input type="text" name="nama" id="name" class="form-control" value="{{ $cabang->nama }}">

    @error('nama')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>

<div class="form-group">
    <label for="telpon">Telp</label>
    <input type="number" name="telpon" id="phone" class="form-control" value="{{ $cabang->telpon }}">

    @error('telpon')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>

<div class="form-group">
    <label for="email">Email</label>
    <input type="email" name="email" id="email" class="form-control" value="{{ $cabang->email }}">

    @error('email')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>

<div class="form-group">
    <label for="whatsapp">Whatsapp</label>
    <input type="number" name="wa" id="whatsapp" class="form-control" value="{{ $cabang->wa }}">

    @error('wa')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>

<div class="form-group">
    <label for="alamat">Alamat</label>
    <textarea name="alamat" id="alamat" rows="3" class="form-control">{{ $cabang->alamat }}</textarea>

    @error('alamat')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>