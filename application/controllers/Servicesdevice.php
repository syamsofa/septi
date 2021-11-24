<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Servicesdevice extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_device');
    }

    public function show_device_by_status()
    {
        echo json_encode($this->model_device->show_device_by_status());
    }
}
