<div class="form-group">
    <label for="status">Status</label>
    <input type="text" name="status" id="status" class="form-control" value="{{ $status->status }}">

    @error('status')
    <small class="text-danger">{{ $message }}</small>
    @enderror
</div>