<?php
if ($this->session->userdata('Email'))
    redirect('site/dashboard');

?>


<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
    function tes() {
        $(".hold-transition").html('OK')
    }
</script>
Login SepTI
<form id="formLogin">
    <div class="input-group mb-3">
        <input type="text" class="form-control" id="username" placeholder="Username Community">
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-user"></span>
            </div>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="password" class="form-control" id="password" placeholder="Password Community">
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-lock"></span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-8">
            <div class="icheck-primary">
            </div>
        </div>
        <!-- /.col -->
        <div class="col-4">


            <button id="buttonSubmit" type="submit" class="btn btn-primary btn-block">Login</button>
        </div>

        <!-- /.col -->
    </div>
</form>


<script>
    $("#formLogin").submit(function(event) {
        $.ajax({
            type: "POST",
            cache: false,
            url: '<?php echo base_url(); ?>/servicespengguna/LoginJatengklik',
            dataType: 'json',
            data: {
                username: $("#username").val(),
                password: $("#password").val()
            },
            success: function(output) {
                // $("#buttonSubmit").html(" Login ");

                console.log(output)
                if (output.sukses == true)
                    location.reload();


            }

        })
        event.preventDefault()




    });
</script>