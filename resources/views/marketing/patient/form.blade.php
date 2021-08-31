<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <div class="row">
            <div class="col-sm-6">
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
                        <div class="col-sm-6">
                            <input type="text" name="place" id="place" class="form-control">
                        </div>
                        <div class="col-sm-6">
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

                <div class="form-group">
                    <label class="display-block">Status</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="patient_active" value="option1" checked>
                        <label class="form-check-label" for="patient_active">
                            Active
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_active" id="patient_inactive" value="option2">
                        <label class="form-check-label" for="patient_inactive">
                            Inactive
                        </label>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
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

        <div class="m-t-20 text-center">
            <button type="submit" class="btn btn-primary submit-btn"><i class="fa fa-save"></i> Save</button>
        </div>
    </div>
</div>