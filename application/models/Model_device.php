<?php

class Model_device extends CI_Model
{
    public function __construct()
    {
        // $this->load->library('lib');
        // $this->load->library('lib_security');
        // $this->load->model('model_role');
        // $this->load->model('email_model');
        //call function
        // Your own constructor code
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
        $query = $this->db->query("SELECT 
        type_id, 
        type_name, 
        type_code, 
        active, 
        (SELECT COUNT(*) FROM device_list WHERE type_id = dt.type_id) as device_total  
        FROM device_type AS dt ");

        return $query->result_array();
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


        return $this->db->query($query)->result_array()[0];
    }

    public function add_device($dt_device, $dt_photo)
    {
        print_r($dt_device);
        // Set var
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
            // $_SESSION['new_dev_status']      = $dev_status;
            $_SESSION['new_building_id']     = $building_id;
            $_SESSION['new_place_id']        = $place_id;
            $_SESSION['new_location_id']     = $location_id;
        } else {
            // Check if dt_photo isn't empty
            if ($dt_photo != "") {
                // Init var
                $save_count   = 0;
                $error_count  = 0;
                $notification = "";

                foreach ($dt_photo as $photo_name => $photo_name_value) {
                    // Set var
                    $location  = "./assets/images/device_photos/";
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
                            $extensions = array("png", "jpg", "jpeg", "gif");
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
                                $this->inventory->create_thumbnail($location . $new_photo_name, $location . $device_serial . "_thumbnail." . $file_ext, "200", "150");
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
                        $notification .= "<br>Photo Uploaded successfully!";
                    }
                }

                $device_photo         = $location . $new_photo_name;
                $process_photo_upload = $save_count;
            } else {
                $device_photo         = "./assets/images/device_photos/standard_device.jpg";
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
					'$_SESSION[username]', 
					NOW(), 
					'$_SESSION[username]', 
					NOW()) ";
                $process = $this->db->query($query);
                // $notification = "|";
                // create log
                if ($process > 0) {
                    $this->sysClass->save_system_log($_SESSION['username'], $query);
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
                // $_SESSION['new_dev_status']      = $dev_status;
                $_SESSION['new_building_id']     = $building_id;
                $_SESSION['new_place_id']        = $place_id;
                $_SESSION['new_location_id']     = $location_id;
                // $_SESSION['errors']           = $process_photo_upload;
            }
        }

        return $process . $notification;
    }
}
