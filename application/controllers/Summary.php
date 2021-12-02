<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;

defined('BASEPATH') or exit('No direct script access allowed');

class Summary extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_device');
    }

    public function by_location()
    {
        require __DIR__ . '/vendor/autoload.php'; 
  

    }
}
