<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Servicessystem extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_system');
    }
    public function show_system_logs()
    {
        echo json_encode($this->model_system->show_system_logs());
    }
}
