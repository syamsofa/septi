<style>
    .loader {
        border: 16px solid #f3f3f3;
        border-radius: 50%;
        border-top: 16px solid blue;
        border-right: 16px solid green;
        border-bottom: 16px solid red;
        width: 120px;
        height: 120px;
        -webkit-animation: spin 2s linear infinite;
        animation: spin 2s linear infinite;
    }

    @-webkit-keyframes spin {
        0% {
            -webkit-transform: rotate(0deg);
        }

        100% {
            -webkit-transform: rotate(360deg);
        }
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }
</style>
<div class="loader"></div>

<script>
    $('.loader').show();
</script>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>

    </div>
    <div class="card-body">
        <table id="tabelUser">
            <thead>
                <tr>
                    <th>Nama</th>
                    <th>Email</th>

                </tr>
            </thead>

            <tbody></tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="modalDeviceList" tabindex="-2" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Device List</h5>
                <button id="" onclick="show_device_add()" type="button" class="btn btn-success "><i class="fa fa-plus-circle" aria-hidden="true"></i> Tambah</button>
                <button id="" onclick="show_device_by_excel_add()" type="button" class="btn btn-success "><i class="fa fa-plus-circle" aria-hidden="true"></i> Tambah Pakai Excel</button>

            </div>
            <div class="modal-body">

                <table id="tabelDeviceList" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Code</th>
                            <th>Tahun</th>
                            <th>BMN</th>
                            <th>Merk</th>
                            <th>Model</th>
                            <th>Status</th>
                            <th>Location</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

            </div>
            <div class="modal-footer">

            </div>

        </div>
    </div>
</div>

<script>
    $.ajax({
        type: "POST",
        cache: false,
        url: '<?php echo base_url(); ?>/Servicespengguna/read_pengguna',
        dataType: 'json',
        data: {},
        success: function(output) {
            console.log(output)
            const tabelUser = $('#tabelUser').dataTable();

            tabelUser.fnClearTable();

            $('.loader').hide();

            for (var i = 0; i < output.length; i++) {

                outputDataBaris = output[i]
                tabelUser.fnAddData([
                    "" + outputDataBaris.Nama + "",
                    "" + outputDataBaris.Email + ""
                ]);
            } // End Fo

            // $("#tabelUser").DataTable()

        }

    })
</script>