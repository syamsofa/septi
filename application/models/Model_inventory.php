<?php

class Model_inventory extends CI_Model
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
    public function create_thumbnail($source_image, $destination_image_url, $get_width, $get_height)
    {
        ini_set('memory_limit', '512M');
        set_time_limit(0);

        $image_array = explode('/', $source_image);
        $image_name  = $image_array[count($image_array) - 1];
        $max_width   = $get_width;
        $max_height  = $get_height;
        $quality     = 100;

        //Set image ratio
        list($width, $height) = getimagesize($source_image);
        $ratio  = ($width > $height) ? $max_width / $width : $max_height / $height;
        $ratiow = $width / $max_width;
        $ratioh = $height / $max_height;
        $ratio  = ($ratiow > $ratioh) ? $max_width / $width : $max_height / $height;

        if ($width > $max_width || $height > $max_height) {
            $new_width  = $width * $ratio;
            $new_height = $height * $ratio;
        } else {
            $new_width  = $width;
            $new_height = $height;
        }

        if (preg_match("/.jpg/i", "$source_image") or preg_match("/.jpeg/i", "$source_image")) {
            //JPEG type thumbnail
            $image_p = imagecreatetruecolor($new_width, $new_height);
            $image   = imagecreatefromjpeg($source_image);
            imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagejpeg($image_p, $destination_image_url, $quality);
            imagedestroy($image_p);
        } elseif (preg_match("/.png/i", "$source_image")) {
            //PNG type thumbnail
            $im      = imagecreatefrompng($source_image);
            $image_p = imagecreatetruecolor($new_width, $new_height);
            imagealphablending($image_p, false);
            imagecopyresampled($image_p, $im, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagesavealpha($image_p, true);
            imagepng($image_p, $destination_image_url);
        } elseif (preg_match("/.gif/i", "$source_image")) {
            //GIF type thumbnail
            $image_p = imagecreatetruecolor($new_width, $new_height);
            $image   = imagecreatefromgif($source_image);
            $bgc     = imagecolorallocate($image_p, 255, 255, 255);
            imagefilledrectangle($image_p, 0, 0, $new_width, $new_height, $bgc);
            imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagegif($image_p, $destination_image_url, $quality);
            imagedestroy($image_p);
        } else {
            echo 'unable to load image source';
            exit;
        }
    }
    public function setting_data($setting_name)
    {
        $query         = "SELECT setting_value FROM system_settings WHERE setting_name = '$setting_name' AND active = 'yes'";
        $setting_value = $this->db->query($query);
        return $setting_value->result()[0]->setting_value;
    }
}
