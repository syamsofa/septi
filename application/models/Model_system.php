<?php

class Model_system extends CI_Model
{
    public function __construct()
    {
      
    }
    public function save_system_log($username, $query)
	{
		// Check query process
		$raw_statement = explode(" ", $query);
		
		// Which SQL statement is used 
		$statement     = strtolower($raw_statement[0]);
		
		if ($statement === 'insert') {
			// Get table name (3rd position based on INSERT INTO 'table')
			$table            = $raw_statement[2];
			$log_descriptions = "$username insert new data into the $table table on ".date("Y/m/d H:i:s");
		}
		elseif ( $statement === 'update' ) {
			// Get table name (2nd position based on UPDATE 'table')
			$table            = $raw_statement[1];
			$log_descriptions = "$username update data : ";
			// Left limit -> SET -> First "SET"
			$left_limit       = explode("SET", $query, 2);
			// Right limit -> WHERE -> Reverse String "EREHW" to avoid another "WHERE" from query input
			$right_limit      = explode("EREHW", strrev($left_limit[1]), 2);
			// Get edited column and new values
			$updated_columns  = addslashes(strrev($right_limit[1]));
			$updated_columns  = explode(", updated_by", $updated_columns);
			$updated_columns  = $updated_columns[0];
			$update_criteria  = addslashes(strrev($right_limit[0]));
			$log_descriptions .= "$updated_columns where $update_criteria from $table table on ".date("Y/m/d H:i:s");
		}
		else {
			return NULL;
		}

		// Process save to system log
		$query_system_log = "INSERT INTO system_logs (log_date, username, description) VALUES (NOW(), '$username', '$log_descriptions')";
		$process          = $this->db->query($query_system_log);
	}

}
