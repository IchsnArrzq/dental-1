<div class="row">
    <div class="col-md-12">
        <h1 class="page-title">Dashboard</h1>
    </div>
</div>
<div class="row">
    <input type="file" id="photo">
    <canvas id="canvas" width="640" height="480"></canvas>
    <video id="video" width="640" height="480" autoplay></video>
    <button id="snap">Snap Photo</button>
</div>
<script>
    var video = document.getElementById('video');

    // Get access to the camera!
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        // Not adding `{ audio: true }` since we only want video now
        navigator.mediaDevices.getUserMedia({
            video: true
        }).then(function(stream) {
            //video.src = window.URL.createObjectURL(stream);
            video.srcObject = stream;
            video.play();
        });
    }
    var canvas = document.getElementById('canvas');
    var context = canvas.getContext('2d');
    var video = document.getElementById('video');

    // Trigger photo take
    document.getElementById("snap").addEventListener("click", function() {
        context.drawImage(video, 0, 0, 640, 480);
        console.log(context)
        document.getElementById('photo') = context
        canvas.toDataURL("image/png");
    });


</script>