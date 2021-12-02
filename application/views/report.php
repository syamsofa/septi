    <div class="modal-body " id="modal_content_device_detail">



        <div class="form-group row">
            <label class="control-label col-sm-3">Per Tipe Device</label>
            <div class="col-sm-9">
                <select class="form-control chosen-select" name="type_id" id="type_id" data-placeholder="Device Type" require>
                    <option value="">--Pilih--</option>
                    <?php
                    foreach ($device_type as $row) {
                        echo "<option value='" . $row['type_id'] . "'>" . $row['type_name'] . "</option>";
                    }
                    ?>


                </select>
            </div>
            <div class="col-sm-9">
                <!-- http://localhost/tik/report_summary.php?by=a.type_id&name=per_device_type&criteria=10 -->
                <button onclick="goReport('a.type_id&name=per_device_type','type_id')" class="btn btn-success"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Cetak</button>
            </div>
        </div>
    </div>



    <div class="modal-body " id="modal_content_device_detail">

        <div class="form-group row">
            <label class="control-label col-sm-3">Per Ruang</label>
            <div class="col-sm-9">
                <select require class="form-control chosen-select" name="building_id" id="building_id" data-placeholder="Location">
                    <option value="">--Pilih--</option>
                    <?php
                    foreach ($location_building as $row) {
                        echo "<option value='" . $row['building_id'] . "'>" . $row['building_name'] . "</option>";
                    }
                    ?>

                </select>
            </div>
            <div class="col-sm-9">
                <button onclick="goReport('a.building_id&name=per_building','building_id')" class="btn btn-success"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Cetak</button>
            </div>
        </div>
    </div>
    <div class="modal-body " id="modal_content_device_detail">



        <div class="form-group row">
            <label class="control-label col-sm-3">Per KF/Sub Koordinator</label>
            <div class="col-sm-9">
                <select require class="form-control chosen-select" name="place_id" id="place_id" data-placeholder="Location">
                    <option value="">--Pilih--</option>
                    <?php
                    foreach ($location_place as $row) {
                        echo "<option value='" . $row['place_id'] . "'>" . $row['place_name'] . "</option>";
                    }
                    ?>

                </select>
            </div>
            <div class="col-sm-9">
                <button onclick="goReport('a.place_id&name=per_place','place_id')" class="btn btn-success"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Cetak</button>
            </div>
        </div>
    </div>
    <div class="modal-body " id="modal_content_device_detail">
        <div class="form-group row">
            <label class="control-label col-sm-3">Per Lokasi/PenanggungJawab</label>
            <div class="col-sm-9">
                <select class="form-control chosen-select" name="location_id" id="location_id" data-placeholder="Location">
                    <option value="">--Pilih--</option>
                    <?php
                    foreach ($location as $row) {
                        echo "<option value='" . $row['location_id'] . "'>" . $row['location_name'] . "</option>";
                    }
                    ?>

                </select>
            </div>
            <div class="col-sm-9">
                <button onclick="goReport('a.location_id&name=per_location','location_id')" class="btn btn-success"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Cetak</button>
            </div>
        </div>
    </div>

    </div><!-- /.modal-dialog -->

    <script>
        function goReport(string, kriteria) {
            location.href = '<?php echo base_url(); ?>summary?by=' + string + '&criteria=' + $("#" + kriteria).val()
        }
    </script>