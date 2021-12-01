<?php

class Model_device extends CI_Model
{
    public const extensionsAllowed = array("png", "jpg", "jpeg", "gif");
    public const lokasiFoto = "./assets/images/device_photos/";
    public function __construct()
    {
        // $this->load->library('lib');
        // $this->load->library('lib_security');
        // $this->load->model('model_role');
        $this->load->model('model_system');
        // $this->load->model('email_model');
        $this->load->model('model_inventory');
        //call function
        // Your own constructor code
    }
    public function device_type_change_status($dt_type)
    {
        // assign variable
        $type_id   = $dt_type["type_id"];
        $active    = $dt_type["status"];

        // create query
        $query   = "UPDATE device_type 
					SET active='$active', updated_by='" . $this->session->userdata('Email') . "', updated_date=NOW(), revision=revision+1 
					WHERE type_id='$type_id'";

        // edit to database
        $process = $this->db->query($query);

        // create system log
        if ($process > 0) {
            $this->model_system->save_system_log($this->session->userdata('Email'), $query);
        }

        return
            ["sukses" => $process];
    }

    public function show_device_by_type($type_id)
    {
        $query = $this->db->query("SELECT a.*, 
        b.`type_name`, 
        c.`location_name`, 
        d.`place_id`, 
        d.`building_id`, 
        d.`floor_id`, 
        lp.`place_name`, 
        lb.`building_name`, 
        lf.`floor_name` 
        FROM device_list a 
        INNER JOIN device_type b ON a.`type_id` = b.`type_id` 
        LEFT JOIN location c ON a.`location_id` = c.`location_id` 
        LEFT JOIN location_details d ON a.`location_id` = d.`location_id` 
        LEFT JOIN location_place lp ON d.`place_id` = lp.`place_id` 
        LEFT JOIN location_building lb ON d.`building_id` = lb.`building_id`  
        LEFT JOIN location_floor lf ON d.`floor_id` = lf.`floor_id`
        WHERE a.`type_id` = '$type_id'");

        return $query->result_array();
    }
    public function show_device_by_status()
    {
        $query = $this->db->query("select a.device_status, count(*) as jumlah from device_list a group by a.device_status");

        return $query->result_array();
    }
    public function show_device_type($type_name = "", $type_code = "", $active = "")
    {
        $query = "SELECT 
					type_id, 
					type_name, 
					type_code, 
					active, 
					(SELECT COUNT(*) FROM device_list WHERE type_id = dt.type_id) as device_total  
					FROM device_type AS dt ";

        // additional parameters?
        if ($type_name != "" || $type_code != "" || $active != "") {
            $query .= " WHERE ";

            if ($type_name != "") {
                $type_name = strtolower(trim($type_name));
                $query     .= " type_name = '$type_name' ";
            }
            if ($type_code != "") {
                $type_code = strtoupper(trim($type_code));
                $query     .= " type_code = '$type_code' ";
            }
            if ($active != "") {
                if ($type_name != "" || $type_code != "") {
                    $query .= " AND ";
                }
                $query .= " active = '$active' ";
            }
        }
        $query .= " ORDER BY type_name ASC";
        // print_r($query);
        return        $this->db->query($query)->result_array();
        // return $process;
    }

    public function show_device($device_serial = "", $device_status = "", $device_id = "")
    {
        $query = "SELECT a.*, 
        b.`type_name`, 
        c.`location_name`, 
        d.`place_id`, 
        d.`building_id`, 
        d.`floor_id`, 
        lp.`place_name`, 
        lb.`building_name`, 
        lf.`floor_name`  
        FROM device_list a 
        INNER JOIN device_type b ON a.`type_id` = b.`type_id` 
        LEFT JOIN location c ON a.`location_id` = c.`location_id` 
        LEFT JOIN location_details d ON a.`location_id` = d.`location_id` 
        LEFT JOIN location_place lp ON d.`place_id` = lp.`place_id`  
        LEFT JOIN location_building lb ON d.`building_id` = lb.`building_id`  
        LEFT JOIN location_floor lf ON d.`floor_id` = lf.`floor_id`
        ";

        // If additional param exists
        if ($device_serial != "" || $device_status != "" || $device_id != "") {
            $query .= " WHERE ";
        }

        // if device serial isn't empty
        if ($device_serial != "") {
            $query .= " device_serial = '$device_serial' ";
        }
        // if device status isn't empty
        if ($device_status != "") {
            if ($device_serial != "") {
                $query .= " AND ";
            }
            $query .= " device_status = '$device_status' ";
        }
        // if device id isn't empty
        if ($device_id != "") {
            if ($device_serial != "" || $device_status != "") {
                $query .= " AND ";
            }
            $query .= " device_id = '$device_id' ";
        }


        return $this->db->query($query)->result_array();
    }
    public function add_device_type($dt_type)
    {
        // print_r($dt_type);
        // Set var
        $type_name = addslashes(trim($dt_type["type_name"]));
        $type_code = addslashes(strtoupper(trim($dt_type["type_code"])));
        $active    = $dt_type["active"];

        // // Check if device exists
        // print_r($type_name, $type_code);
        $type_check = count($this->show_device_type("", $type_code, $active));
        if ($type_check > 0) {
            // Send back with notification
            $process = 0;
            $notification = "|<br>Device type or code is already exists in the database!";
        } else {
            // Insert to database & create notification
            $query        = "INSERT INTO device_type 
        					(type_name, type_code, active, created_by, created_date, updated_by, updated_date) 
        					VALUES ('$type_name', '$type_code', '$active', '" . $this->session->userdata('Email') . "', NOW(), '" . $this->session->userdata('Email') . "', NOW()) ";
            $process      = $this->db->query($query);
            $notification = "Berhasil Tambah Tipe Device";
            // create log
            if ($process > 0) {
                $this->model_system->save_system_log($this->session->userdata('Email'), $query);
            }
        }

        return ["sukses" => $process, "pesan" => $notification];
    }
    public function add_device_by_excel($file)
    {
        print_r($file['file_excel']['tmp_name']);
        require "vendor/autoload.php";
        $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        $spreadsheet = $reader->load($file['file_excel']['tmp_name']);
        $worksheet = $spreadsheet->getActiveSheet();

        // (B) LOOP THROUGH ROWS OF CURRENT WORKSHEET
        foreach ($worksheet->getRowIterator() as $row) {
            // (B1) READ CELLS
            $cellIterator = $row->getCellIterator();
            $cellIterator->setIterateOnlyExistingCells(false);

            // (B2) OUTPUT HTML
            echo "<tr>";
            foreach ($cellIterator as $cell) {
                echo "<td>" . $cell->getValue() . "</td>";
            }
            echo "</tr>";
        }
    }

    public function add_device($dt_device, $dt_photo)
    {

        $device_code        = $dt_device["dev_code"];
        $type_id            = $dt_device["dev_type_id"];
        $device_tahun       = addslashes(trim($dt_device["dev_tahun"]));
        $device_bmn         = addslashes(trim($dt_device["dev_bmn"]));
        $device_brand       = addslashes(trim($dt_device["dev_brand"]));
        $device_model       = addslashes(trim($dt_device["dev_model"]));
        $device_color       = addslashes(trim($dt_device["dev_color"]));
        $device_serial      = addslashes(trim($dt_device["dev_serial"]));
        $device_description = trim($dt_device["dev_description"]);
        $device_status      = $dt_device["dev_status"];
        $building_id        = $dt_device["building_id"];
        $place_id           = $dt_device["place_id"];
        $location_id        = $dt_device["location_id"];
        $device_deployment_date = "0000-00-00 00:00:00";
        if ($device_status != "new") {
            $device_deployment_date = "NOW()";
        }

        // Check if device exists
        $dev_check = count($this->show_device($device_serial));

        if ($dev_check > 0) {
            // Send back with notification
            $process                         = 0;
            $notification                    = "|<br>Device is already exists in the database!";
            $_SESSION['new_type_id']         = $type_id;
            $_SESSION['new_dev_tahun']       = $device_tahun;
            $_SESSION['new_dev_bmn']         = $device_bmn;
            $_SESSION['new_dev_brand']       = $device_brand;
            $_SESSION['new_dev_model']       = $device_model;
            $_SESSION['new_dev_serial']      = $device_serial;
            $_SESSION['new_dev_description'] = $device_description;
            $_SESSION['new_dev_status']      = $device_status;
            $_SESSION['new_building_id']     = $building_id;
            $_SESSION['new_place_id']        = $place_id;
            $_SESSION['new_location_id']     = $location_id;
        } else {
            if ($dt_photo != "") {
                // Init var
                $save_count   = 0;
                $error_count  = 0;
                $notification = "";

                foreach ($dt_photo as $photo_name => $photo_name_value) {
                    $location  = self::lokasiFoto;
                    $file_name = $_FILES[$photo_name]['name'];
                    $file_size = $_FILES[$photo_name]['size'];
                    $file_tmp  = $_FILES[$photo_name]['tmp_name'];
                    $file_type = $_FILES[$photo_name]['type'];

                    if ($file_name != "") {
                        // Check if file is the real image
                        $check_image = getimagesize($file_tmp);
                        if ($check_image !== false) {
                            // Verify extension
                            $extensions = self::extensionsAllowed;
                            $file_ext   = explode('.', $file_name);
                            $file_ext   = strtolower(end($file_ext));

                            if (in_array($file_ext, $extensions) === false) {
                                $errors[] = "<br>Extension not allowed, please use png, jpg or gif file.";
                            }

                            // Verify size
                            if ($file_size > 2097152) {
                                $errors[] = "<br>File size must be less than 2 MB.";
                            }

                            // Set new name
                            $new_photo_name = $device_serial . "." . $file_ext;

                            // Upload file process
                            if (empty($errors) == true) {
                                // Upload
                                move_uploaded_file($file_tmp, $location . $new_photo_name);
                                // Create thumb
                                $this->model_inventory->create_thumbnail($location . $new_photo_name, $location . $device_serial . "_thumbnail." . $file_ext, "200", "150");
                                $save_count = $save_count + 1;
                            } else {
                                // Set error count flag and notification
                                $error_count = $error_count + 1;
                                foreach ($errors as $upload_error) {
                                    $notification .= $upload_error;
                                }
                            }
                        }
                    } else {
                        $new_photo_name = "standard_device.jpg";
                        // nomor asal :P
                        $save_count = $save_count + 5;
                    }

                    // If error_count == 0 > SUCCESS!
                    if ($error_count == 0 && $notification == "" && $save_count > 0) {
                        $notification .= "File foto device berhasil diupload!";
                    }
                }
                $device_photo         = $location . $new_photo_name;
                $process_photo_upload = $save_count;
            } else {
                $device_photo         = self::lokasiFoto . "standard_device.jpg";
                $process_photo_upload = "1";
            }
            // if photo upload success 
            if ($process_photo_upload > 0) {
                // Insert to database & create notification
                $query        = "INSERT INTO device_list (
					type_id, 
					device_code, 
					device_tahun,
					device_bmn,
					device_brand, 
					device_model, 
					device_serial, 
					device_color, 
					device_description, 
					device_photo, 
					device_status, 
					building_id,
					place_id,
					location_id, 
					device_deployment_date, 
					created_by, 
					created_date, 
					updated_by, 
					updated_date) 
				VALUES (
					'$type_id', 
					'$device_code', 
					'$device_tahun',
					'$device_bmn',
					'$device_brand', 
					'$device_model', 
					'$device_serial', 
					'$device_color', 
					'$device_description', 
					'$device_photo', 
					'$device_status', 
					'$building_id',
					'$place_id',
					'$location_id', 
					'$device_deployment_date', 
					'" . $this->session->userdata('Email') . "', 
					NOW(), 
					'" . $this->session->userdata('Email') . "', 
					NOW()) ";
                $process = $this->db->query($query);
                // $notification = "|";
                // create log
                if ($process > 0) {
                    $this->model_system->save_system_log(
                        $this->session->userdata('Email'),
                        $query
                    );
                }
            } else {
                $process = 0;
                $_SESSION['new_type_id']         = $type_id;
                $_SESSION['new_dev_tahun']       = $device_tahun;
                $_SESSION['new_dev_bmn']         = $device_bmn;
                $_SESSION['new_dev_brand']       = $device_brand;
                $_SESSION['new_dev_model']       = $device_model;
                $_SESSION['new_dev_color']       = $device_color;
                $_SESSION['new_dev_serial']      = $device_serial;
                $_SESSION['new_dev_description'] = $device_description;
                $_SESSION['new_dev_status']      = $device_status;
                $_SESSION['new_building_id']     = $building_id;
                $_SESSION['new_place_id']        = $place_id;
                $_SESSION['new_location_id']     = $location_id;
                // $_SESSION['errors']           = $process_photo_upload;
            }
        }


        return ["sukses" => $process, "pesan" => $notification];
    }
    public function edit_device($dt_device, $dt_photo)
    {
        // Set var
        $device_id          = $dt_device["dev_id"];
        $device_tahun       = addslashes(trim($dt_device["dev_tahun"]));
        $device_bmn         = addslashes(trim($dt_device["dev_bmn"]));
        $device_brand       = addslashes(trim($dt_device["dev_brand"]));
        $device_model       = addslashes(trim($dt_device["dev_model"]));
        $device_color       = addslashes(trim($dt_device["dev_color"]));
        $device_serial      = addslashes(trim($dt_device["dev_serial"]));
        $device_description = trim($dt_device["dev_description"]);
        $device_status      = $dt_device["dev_status"];
        $building_id        = $dt_device["building_id"];
        $place_id           = $dt_device["place_id"];
        $location_id        = $dt_device["location_id"];

        // Check if device exists
        $dev_check = count($this->show_device("", "", $device_id));
        if ($dev_check > 0) {
            // Get current values
            $dev_curr_value = $this->show_device("", "", $device_id);
            foreach ($dev_curr_value as $data) {
                $c_device_tahun       = $data["device_tahun"];
                $c_device_bmn         = $data["device_bmn"];
                $c_device_brand       = $data["device_brand"];
                $c_device_model       = $data["device_model"];
                $c_device_color       = $data["device_color"];
                $c_device_serial      = $data["device_serial"];
                $c_device_description = $data["device_description"];
                $c_device_photo       = $data["device_photo"];
                $c_device_status      = $data["device_status"];
                $c_building_id        = $data["building_id"];
                $c_place_id           = $data["place_id"];
                $c_location_id        = $data["location_id"];
            }
            // Changes check
            $changes = '';
            if ($device_tahun != $c_device_tahun) {
                $changes .= "Dev tahun : $c_device_tahun -> $device_tahun. ";
            }
            if ($device_bmn != $c_device_bmn) {
                $changes .= "Dev bmn : $c_device_bmn -> $device_bmn. ";
            }
            if ($device_brand != $c_device_brand) {
                $changes .= "Dev brand : $c_device_brand -> $device_brand. ";
            }
            if ($device_model != $c_device_model) {
                $changes .= "Dev model : $c_device_model -> $device_model. ";
            }
            if ($device_color != $c_device_color) {
                $changes .= "Dev color : $c_device_color -> $device_color. ";
            }
            if ($device_serial != $c_device_serial) {
                $changes .= "Dev serial : $c_device_serial -> $device_serial. ";
            }
            if ($device_description != $c_device_description) {
                $changes .= "Dev description : $c_device_description -> $device_description. ";
            }
            if ($device_status != $c_device_status) {
                $changes .= "Dev status : $c_device_status -> $device_status. ";
            }
            if ($building_id != $c_location_id) {
                $changes .= "Dev building id : $c_building_id -> $building_id. ";
            }
            if ($location_id != $c_location_id) {
                $changes .= "Dev place id : $c_place_id -> $place_id. ";
            }
            if ($location_id != $c_location_id) {
                $changes .= "Dev location id : $c_location_id -> $location_id. ";
            }
            // Insert to device changes
            $query_changes = "INSERT INTO device_changes (device_id, changes, updated_by, updated_date) 
								VALUES ('$device_id', '" . addslashes($changes) . "', '$_SESSION[username]', NOW())";
            $changes_process = $this->db->query($query_changes);

            // Edit process
            // Init var
            $save_count   = 0;
            $error_count  = 0;
            $notification = "";

            foreach ($dt_photo as $photo_name => $photo_name_value) {
                // Set var
                $location  = self::lokasiFoto;
                $file_name = $_FILES[$photo_name]['name'];
                $file_size = $_FILES[$photo_name]['size'];
                $file_tmp  = $_FILES[$photo_name]['tmp_name'];
                $file_type = $_FILES[$photo_name]['type'];

                // If file name isn't empty
                if ($file_name != "") {
                    // Check if file is the real image
                    $check_image = getimagesize($file_tmp);
                    if ($check_image !== false) {
                        // Verify extension
                        $extensions = self::extensionsAllowed;
                        $file_ext   = explode('.', $file_name);
                        $file_ext   = strtolower(end($file_ext));
                        if (in_array($file_ext, $extensions) === false) {
                            $errors[] = "<br>Extension not allowed, please use png, jpg or gif file.";
                        }

                        // Verify size
                        if ($file_size > 2097152) {
                            $errors[] = "<br>File size must be less than 2 MB.";
                        }

                        // Set new name
                        $new_photo_name = $device_serial . "." . $file_ext;

                        // Upload file process
                        if (empty($errors) == true) {
                            // Upload
                            move_uploaded_file($file_tmp, $location . $new_photo_name);
                            // Create thumb
                            $this->model_inventory->create_thumbnail($location . $new_photo_name, $location . $device_serial . "_thumbnail." . $file_ext, "200", "150");
                            $save_count = $save_count + 1;
                        } else {
                            // Set error count flag and notification
                            $error_count = $error_count + 1;
                            foreach ($errors as $upload_error) {
                                $notification .= $upload_error;
                            }
                        }
                    }
                } else {
                    $new_photo_name = "";
                    // nomor asal :P
                    $save_count = $save_count + 5;
                }

                // If error_count == 0 > SUCCESS!
                if ($error_count == 0 && $notification == "" && $save_count > 0) {
                    $notification .= "<br>Photo Uploaded successfully!";
                }
            }

            // if photo name empty
            if ($new_photo_name != "") {
                $process_photo_upload = $save_count;
                $device_photo         = $location . $new_photo_name;
                $query_photo          = "device_photo = '$device_photo', ";
            }
            // empty (dont update photo)
            else {
                $process_photo_upload = "1";
                $query_photo          = "";
                // If serial changes, update photo name in db, change photo name file
                if ($c_device_photo != self::lokasiFoto . "standard_device.jpg" && $c_device_serial != $device_serial) {
                    $device_photo = str_replace($c_device_serial, $device_serial, $c_device_photo);
                    $query_photo  = "device_photo = '$device_photo', ";

                    // photo name
                    rename($c_device_photo, $device_photo);

                    // thumbnail name
                    $newnames    = explode(".", strrev($device_photo), 2);
                    $newname_ext = strrev($newnames[0]);
                    $newname     = strrev($newnames[1]) . "_thumbnail." . $newname_ext;
                    $thumbnails  = explode(".", strrev($c_device_photo), 2);
                    $thumb_ext   = strrev($thumbnails[0]);
                    $thumb_name  = strrev($thumbnails[1]);
                    $thumb_name  = rename($thumb_name . "_thumbnail." . $thumb_ext, $newname);
                }
            }


            // if photo upload success 
            if ($process_photo_upload > 0) {
                // Update database & create notification
                $query = "UPDATE device_list 
							SET 
							device_tahun = '$device_tahun',
							device_bmn = '$device_bmn',
							device_brand = '$device_brand', 
							device_model = '$device_model', 
							device_color = '$device_color', 
							device_serial = '$device_serial', 
							device_description = '$device_description', 
							$query_photo  
							device_status = '$device_status', 
							building_id = '$building_id',
							place_id = '$place_id',
							location_id = '$location_id', 
							device_deployment_date = NOW(), 
							updated_by = '$_SESSION[username]', 
							updated_date = NOW(), 
							revision = revision+1 
							WHERE device_id = '$device_id' ";
                $process = $this->db->query($query);
                // create log
                if ($process > 0) {
                    $this->model_system->save_system_log($this->session->userdata('Email'), $query);
                }
            } else {
                $process = 0;
                $_SESSION['new_dev_tahun']       = $device_tahun;
                $_SESSION['new_dev_bmn']         = $device_bmn;
                $_SESSION['new_dev_brand']       = $device_brand;
                $_SESSION['new_dev_model']       = $device_model;
                $_SESSION['new_dev_color']       = $device_color;
                $_SESSION['new_dev_serial']      = $device_serial;
                $_SESSION['new_dev_description'] = $device_description;
                $_SESSION['new_dev_status']      = $device_status;
                $_SESSION['new_building_id']     = $building_id;
                $_SESSION['new_place_id']        = $place_id;
                $_SESSION['new_location_id']     = $location_id;
            }
        } else {
            $process      = 0;
            $notification = "No Device Found!";
        }

        return $process . $notification;
    }
}
