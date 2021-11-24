<?php

class Model_location_building extends CI_Model
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
    public function show_location_building()
    {


        $query = "SELECT *
			FROM location_building l 
			";


        return $this->db->query($query)->result_array();
    }
}
