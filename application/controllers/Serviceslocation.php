<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Serviceslocation extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_location');

        // Your own constructor code
    }
    public function show_location()
    {
        $output = $this->model_location->show_location();

        echo json_encode($output);
    }
    public function show_location_place()
    {
        $output = $this->model_location->show_location_detail_by_type('place');

        echo json_encode($output);
    }
    
    public function show_location_building()
    {
        $output = $this->model_location->show_location_building();

        echo json_encode($output);
    }
    
}
