<div class="form-group">
    <label for="kode_barang">Kode Produk</label>
    <input type="text" name="kode_barang" id="name" class="form-control" value="{{ $product->kode_barang }}">

    @error('kode_barang')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>

<div class="form-group">
    <label for="nama_barang">Nama</label>
    <input type="text" name="nama_barang" id="name" class="form-control" value="{{ $product->nama_barang }}">

    @error('nama_barang')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>