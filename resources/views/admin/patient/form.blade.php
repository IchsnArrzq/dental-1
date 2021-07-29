<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="nama">Nama</label>
            <input type="text" name="nama" id="nama" class="form-control">

            @error('nama')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control">

            @error('email')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="no_telp">No Telp.</label>
            <input type="number" name="no_telp" id="no_telp" class="form-control">

            @error('no_telp')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="place">Tempat, Tangal Lahir</label>
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
            <label for="jk">Jenis Kelamin</label>
            <div class="radio">
                <input type="radio" name="jk" id="jk" value="Laki-Laki"> Laki-Laki
                <input type="radio" name="jk" id="jk" value="Perempuan" class="ml-3"> Perempuan
            </div>

            @error('jk')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="suku">Suku</label>
            <input type="text" name="suku" id="suku" class="form-control">

            @error('suku')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="pekerjaan">Pekerjaan</label>
            <input type="text" name="pekerjaan" id="pekerjaan" class="form-control">

            @error('pekerjaan')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="no_rek">No Rek</label>
            <input type="number" name="no_rek" id="no_rek" class="form-control">

            @error('no_rek')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="alamat">Alamat</label>
            <textarea name="alamat" id="alamat" rows="3" class="form-control"></textarea>

            @error('alamat')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="form-group">
            <label for="pict">Foto</label>
            <input type="file" name="pict" id="pict" class="form-control">

            @error('pict')
            <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>
    </div>
</div>