<?php

class Model_location extends CI_Model
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
    public function show_location($location_name = "")
    {


        $query = "SELECT 
			 l.location_id, 
			 l.location_name,
			 l.location_photo, 
			 l.active
			FROM location l 
			";

        // If location_name set
        if ($location_name != "") {
            $query .= " WHERE l.location_name = '$location_name' ";
        }

        $query .= " ORDER BY l.location_name ASC ";


        return $this->db->query($query)->result_array();
    }
}
