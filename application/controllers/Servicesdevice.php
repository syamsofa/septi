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

    public function show_device_type()
    {
        echo json_encode($this->model_device->show_device_type("", "", "yes"));
    }

    public function device_type_change_status()
    {
        print_r($this->input->post());
        $type_id = $this->input->post('type_id');
        $active = $this->input->post('active');
        echo json_encode($this->model_device->device_type_change_status(['type_id' => $type_id, 'active' => $active]));
    }
    public function show_device_by_type()
    {
        $type_id = $this->input->post('type_id');
        echo json_encode($this->model_device->show_device_by_type($type_id));
    }
    public function show_device_by_id()
    {
        $device_id = $this->input->post('device_id');
        echo json_encode($this->model_device->show_device("", "", $device_id));
    }
    public function add_device()
    {
        // print_r($this->input->post());
        echo json_encode($this->model_device->add_device($this->input->post(), $_FILES));
    }
    public function add_device_by_excel()
    {
        // print_r($this->input->post());
        echo json_encode($this->model_device->add_device_by_excel($_FILES));
    }

    public function add_device_type()
    {
        // print_r("SSS");
        // print_r($this->input->post());
        echo json_encode($this->model_device->add_device_type($this->input->post()));
    }
}
