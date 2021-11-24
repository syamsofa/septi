<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>

    </div>
    <div class="card-body">
        <table id="tabelTipeDevice">
            <thead>
                <tr>
                    <th>Kode</th>
                    <th>Tipe</th>
                    <th>Aktiv</th>
                    <th>Jumlah Device</th>
                    <th>Detil</th>

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
                <button id="" onclick="show_device_add()" type="button" class="btn btn-success float-right"><i class="fa fa-plus-circle" aria-hidden="true"></i> Tambah</button>

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

<div class="modal fade" id="modalDeviceDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Device Detail</h5>

            </div>
            <div class="modal-body form-horizontal" id="modal_content_device_detail">
                <div class="form-group">
                    <label class="control-label col-sm-3">Device Code :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_code">3317/2021/LPT/12</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Device Type :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_type">Laptop</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Tahun Perolehan :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_tahun">2020</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">No BMN :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_bmn">3.10.01.02.002.037</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Brand :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_brand">Acer</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Model :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_model">ASPIRE 5 A514-52G-547A</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Color :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_color">Purple</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Serial Number :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_serial">NXHMJSN004034059922N00</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Photo :</label>
                    <div class="col-sm-8 form-control-static">
                        <a class="fancybox" rel="group" href="./assets/images/device_photos/standard_device.jpg" id="dl_dev_photo_real" title="">
                            <img src="./assets/images/device_photos/standard_device_thumbnail.jpg" class="img-thumbnail" alt="Device Image" id="dl_dev_photo" style="max-height:180px">
                        </a>
                        <p class="help-block">Click the image to enlarge.</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Description :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_description"></div>
                </div>
                <hr class="dashed">
                <div class="form-group">
                    <label class="control-label col-sm-3">Status :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_status">in use</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Location :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_location">Imam Mustofa</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Place :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_place"></div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Building :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_building"></div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Floor :</label>
                    <div class="col-sm-8 form-control-static" id="dl_dev_floor"></div>
                </div>
            </div>
            <div class="modal-footer">

            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="modalDeviceAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form class="form-horizontal" name="formDeviceAdd" id="formDeviceAdd" enctype="multipart/form-data">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Device Add</h5>

                </div>
                <div class="modal-body form-horizontal" id="modal_content_device_detail">

                    <div id="only_edit">
                        <div class="form-group">
                            <label class="control-label col-sm-3">Device Code</label>
                            <div class="col-sm-9">
                                <p class="form-control-static" id="dev_code_view_edit"></p>
                                <input type="hidden" name="dev_code_edit" id="dev_code_edit" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Device Type</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="dev_type_id_edit"></p>
                            </div>
                        </div>
                    </div>

                    <div id="only_add">
                        <div class="form-group">
                            <label class="control-label col-sm-3">Device Code</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="dev_code_view"></p>
                                <input type="text" name="dev_code" id="dev_code" value="">
                                <!-- <p class="help-block">If you assign 'devtype' in device code format, the code will change based on your device type.</p> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Device Type</label>
                            <div class="col-sm-6">
                                <select class="form-control chosen-select" name="dev_type_id" id="dev_type_id" data-placeholder="Device Type">
                                    <option value=""></option>
                                    <?php
                                    foreach ($device_type as $row) {
                                        echo "<option value='" . $row['type_id'] . "'>" . $row['type_name'] . "</option>";
                                    }
                                    ?>


                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Tahun Perolehan</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="dev_tahun" id="dev_tahun" <?php if (isset($_SESSION["new_dev_tahun"])) {
                                                                                                        echo " value='" . $_SESSION["new_dev_tahun"] . "'";
                                                                                                        unset($_SESSION['new_dev_tahun']);
                                                                                                    } ?>>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">No BMN</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="dev_bmn" id="dev_bmn" <?php if (isset($_SESSION["new_dev_bmn"])) {
                                                                                                    echo " value='" . $_SESSION["new_dev_bmn"] . "'";
                                                                                                    unset($_SESSION['new_dev_bmn']);
                                                                                                } ?>>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Merk/Brand</label>
                        <div class="col-sm-6">
                            <div class="input-group">
                                <input type="text" class="form-control" name="dev_brand" id="dev_brand" required>
                                <div class="input-group-addon">*</div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Model</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="dev_model" id="dev_model" <?php if (isset($_SESSION["new_dev_model"])) {
                                                                                                        echo " value='" . $_SESSION["new_dev_model"] . "'";
                                                                                                        unset($_SESSION['new_dev_model']);
                                                                                                    } ?>>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Color</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="dev_color" id="dev_color" <?php if (isset($_SESSION["new_dev_color"])) {
                                                                                                        echo " value='" . $_SESSION["new_dev_color"] . "'";
                                                                                                        unset($_SESSION['new_dev_color']);
                                                                                                    } ?>>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Serial Number</label>
                        <div class="col-sm-6">
                            <div class="input-group">
                                <input type="text" class="form-control" name="dev_serial" id="dev_serial">
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Photo</label>
                        <div class="col-sm-6">
                            <input type="file" class="form-control" name="dev_photo" id="dev_photo">
                            <p class="help-block" id="photo_info">Leave empty if you don't want to change the photo.</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Asal Barang <br> Tulis Selengkapnya </br></label>
                        <div class="col-sm-8">
                            <textarea class="form-control tinymce" name="dev_description" id="dev_description"> <?php if (isset($_SESSION["new_dev_description"])) {
                                                                                                                    echo $_SESSION["new_dev_description"];
                                                                                                                    unset($_SESSION['new_dev_description']);
                                                                                                                } ?></textarea>
                            <!--<input type="text" class="form-control" name="dev_description" id="dev_description" <?php if (isset($_SESSION["new_dev_description"])) {
                                                                                                                        echo " value='" . $_SESSION["new_dev_description"] . "'";
                                                                                                                        unset($_SESSION['new_dev_description']);
                                                                                                                    } ?>>-->
                        </div>
                    </div>

                    <hr class="dashed">

                    <div class="form-group">
                        <label class="control-label col-sm-3">Status</label>
                        <div class="col-sm-9">
                            <select class="form-control chosen-select" name="dev_status" id="dev_status" data-placeholder="Status">
                                <option value=""></option>
                                <option value="new" <?php if (isset($_SESSION['new_dev_status']) && $_SESSION['new_dev_status'] == "new") {
                                                        echo "selected";
                                                    } ?>>New</option>
                                <option value="in use" <?php if (isset($_SESSION['new_dev_status']) && $_SESSION['new_dev_status'] == "in use") {
                                                            echo "selected";
                                                        } ?>>In Use</option>
                                <option value="damaged" <?php if (isset($_SESSION['new_dev_status']) && $_SESSION['new_dev_status'] == "damaged") {
                                                            echo "selected";
                                                        } ?>>Damaged</option>
                                <option value="repaired" <?php if (isset($_SESSION['new_dev_status']) && $_SESSION['new_dev_status'] == "repaired") {
                                                                echo "selected";
                                                            } ?>>Repaired</option>
                                <option value="discarded" <?php if (isset($_SESSION['new_dev_status']) && $_SESSION['new_dev_status'] == "discarded") {
                                                                echo "selected";
                                                            } ?>>Discarded</option>
                            </select>
                            <?php unset($_SESSION['new_dev_status']); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Ruang</label>
                        <div class="col-sm-6">
                            <select class="form-control chosen-select" name="building_id" id="building_id" data-placeholder="Location">
                                <option value=""></option>
                                <?php
                                foreach ($location_building as $row) {
                                    echo "<option value='" . $row['building_id'] . "'>" . $row['building_name'] . "</option>";
                                }
                                ?>

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Alokasi</label>
                        <div class="col-sm-6">
                            <select class="form-control chosen-select" name="location_id" id="location_id" data-placeholder="Location">
                                <option value=""></option>
                                <?php
                                foreach ($location as $row) {
                                    echo "<option value='" . $row['location_id'] . "'>" . $row['location_name'] . "</option>";
                                }
                                ?>

                            </select>
                        </div>
                    </div>


                </div><!-- /.modal-dialog -->
                <div class="modal-footer">
                    <button class="btn btn-success"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Simpan</button>
                </div>
            </form>
        </div>

    </div>
</div>

<?php
print_r($location);
?>

<script>
    $.ajax({
        type: "POST",
        cache: false,
        url: '<?php echo base_url(); ?>/servicesdevice/show_device_type',
        dataType: 'json',
        data: {},
        success: function(output) {
            console.log(output)
            const tabelTipeDevice = $('#tabelTipeDevice').dataTable();

            tabelTipeDevice.fnClearTable();


            for (var i = 0; i < output.length; i++) {

                outputDataBaris = output[i]
                j = i + 1
                //     "type_id": "1",
                //     "type_name": "Monitor",
                //     "type_code": "MTR",
                //     "active": "yes",
                //     "device_total": "0"
                // }
                tabelTipeDevice.fnAddData([
                    "" + outputDataBaris.type_code + "",
                    "" + outputDataBaris.type_name + "",
                    "" + outputDataBaris.active + "",
                    "" + outputDataBaris.device_total + " device",
                    "</button><button type='button' onclick='bukaFormDeviceList(RecId=" + outputDataBaris.type_id + ")' class='btn btn-primary'>Tampil Perangkat</button>'"

                ]);
            } // End Fo

            // $("#tabelTipeDevice").DataTable()

        }

    })
</script>


<script>
    function bukaFormDeviceList(type_id) {

        $('#modalDeviceList').modal('show');
        $.ajax({
            type: "POST",
            cache: false,
            url: '<?php echo base_url(); ?>/servicesdevice/show_device_by_type',
            dataType: 'json',
            data: {
                type_id: type_id
            },
            success: function(output) {
                console.log(output)
                const tabelDeviceList = $('#tabelDeviceList').dataTable();

                tabelDeviceList.fnClearTable();
                // {
                //     "device_id": "18",
                //     "type_id": "10",
                //     "device_code": "3317/2021/LPT/12",
                //     "device_bmn": "3.10.01.02.002.037",
                //     "device_tahun": "2020",
                //     "device_brand": "Acer",
                //     "device_model": "ASPIRE 5 A514-52G-547A",
                //     "device_serial": "NXHMJSN004034059922N00",
                //     "device_color": "Purple",
                //     "device_description": "",
                //     "device_photo": "./assets/images/device_photos/standard_device.jpg",
                //     "device_status": "in use",
                //     "building_id": "0",
                //     "place_id": "0",
                //     "location_id": "5",
                //     "device_deployment_date": "2021-02-07 13:16:35",
                //     "created_by": "imustofa",
                //     "created_date": "2021-02-06 21:10:33",
                //     "updated_by": "imustofa",
                //     "updated_date": "2021-02-07 13:16:35",
                //     "revision": "1",
                //     "type_name": "Laptop",
                //     "location_name": "Imam Mustofa",
                //     "floor_id": "0",
                //     "place_name": null,
                //     "building_name": null,
                //     "floor_name": null
                // }

                for (var i = 0; i < output.length; i++) {

                    outputDataBaris = output[i]
                    j = i + 1
                    //     "type_id": "1",
                    //     "type_name": "Monitor",
                    //     "type_code": "MTR",
                    //     "active": "yes",
                    //     "device_total": "0"
                    // }
                    tabelDeviceList.fnAddData([
                        outputDataBaris.device_id,
                        outputDataBaris.device_code,

                        outputDataBaris.device_tahun,
                        outputDataBaris.device_bmn,
                        outputDataBaris.device_brand,
                        outputDataBaris.device_model,
                        outputDataBaris.device_status,
                        outputDataBaris.location_name,
                        '<button type="button" class="btn btn-primary" title="Show Detail" onclick="show_device_detail(' + outputDataBaris.device_id + ')"><i class="fa fa-eye" aria-hidden="true"></i></button>' +
                        '<button type="button" class="btn btn-primary" title="Show Detail" onclick="show_device_detail()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>'
                    ]);
                } // End Fo

                // $("#tabelTipeDevice").DataTable()

            }

        })


    }
</script>

<script>
    function show_device_detail(device_id) {
        $('#modalDeviceDetail').modal('show');
        $.ajax({
            type: "POST",
            cache: false,
            url: '<?php echo base_url(); ?>/servicesdevice/show_device_by_id',
            dataType: 'json',
            data: {
                device_id: device_id
            },
            success: function(output) {
                console.log(output)
                // {
                //     "device_id": "9",
                //     "type_id": "10",
                //     "device_code": "3317/2021/LPT/3",
                //     "device_bmn": "3.10.01.02.002.033",
                //     "device_tahun": "2020",
                //     "device_brand": "Lenovo",
                //     "device_model": "Ideapad 5 14IIL05",
                //     "device_serial": "MP1VDQR9",
                //     "device_color": "Grey",
                //     "device_description": "",
                //     "device_photo": "./assets/images/device_photos/standard_device.jpg",
                //     "device_status": "in use",
                //     "building_id": "0",
                //     "place_id": "0",
                //     "location_id": "20",
                //     "device_deployment_date": "2021-02-07 13:55:53",
                //     "created_by": "imustofa",
                //     "created_date": "2021-02-06 20:52:31",
                //     "updated_by": "imustofa",
                //     "updated_date": "2021-02-07 13:55:53",
                //     "revision": "1",
                //     "type_name": "Laptop",
                //     "location_name": "Miyan Andi Irawan",
                //     "floor_id": "0",
                //     "place_name": null,
                //     "building_name": null,
                //     "floor_name": null
                // }

                $("#dl_dev_code").html(output.device_code)
                $("#dl_dev_type").html(output.type_id)
                $("#dl_dev_tahun").html(output.device_tahun)
                $("#dl_dev_bmn").html(output.device_bmn)
                $("#dl_dev_brand").html(output.device_brand)
                $("#dl_dev_model").html(output.device_model)
                $("#dl_dev_color").html(output.device_color)
                $("#dl_dev_serial").html(output.device_serial)
                $("#dl_dev_photo_real").html(output.device_photo)
                $("#dl_dev_status").html(output.device_status)
                $("#dl_dev_location").html(output.location_name)
                $("#dl_dev_place").html(output.place_name)
                $("#dl_dev_floor").html(output.floor_name)


            }

        })
    }
</script>


<script>
    function show_device_add() {
        $('#modalDeviceAdd').modal('show');

    }
</script>

<script>
    $("#formDeviceAdd").submit(function(event) {

        var dataO = $(this)

        console.log(dataO.serialize())
        $.ajax({
            // cache: true,
            type: "POST",
            url: '<?php echo base_url(); ?>/servicesdevice/add_device',
            dataType: 'text',
            data: dataO.serialize(),
            success: function(output) {
                // $("#buttonSubmit").html(" Login ");
                console.log(output)


            }

        })
        event.preventDefault()




    });
</script>