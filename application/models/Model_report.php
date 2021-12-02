<?php

class Model_report extends CI_Model
{
    public function __construct()
    {
    }
    public function show_device_report($type = "", $criteria = "")
    {
        $query = "SELECT 
					a.*, 
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
				LEFT JOIN location_details d ON c.`location_id` = d.`location_id` 
				LEFT JOIN location_place lp ON d.`place_id` = lp.`place_id`  
				LEFT JOIN location_building lb ON d.`building_id` = lb.`building_id`  
				LEFT JOIN location_floor lf ON d.`floor_id` = lf.`floor_id`";

        if ($criteria != "") {
            $query .= "WHERE $type IN ($criteria)";
        }

        $query .= "ORDER BY $type ASC";

        return $this->db->query($query)->result_array();
    }
}
