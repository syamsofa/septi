<?php

class Model_device extends CI_Model
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

	public function show_device_by_status()
	{
		$query=$this->db->query("select a.device_status, count(*) as jumlah from device_list a group by a.device_status");
	
        return $query->result_array();
		
	}

	public function cek_pengguna($data)
	{
		$query = $this->db->query("select * from pengguna where OpsiLoginId=? and Email=?  ", array($data['OpsiLoginId'], $data['Email']));
		if ($query->num_rows() > 0) {

			$dataPengguna = $query->result_array()[0];
			$dataRolePengguna = $this->model_role->read_role_pengguna_by_id_pengguna(array("PenggunaId" => $dataPengguna['RecId']));
			$dataPengguna['RolePengguna'] = $dataRolePengguna;
			return array(
				'sukses' => true,
				'data' => $dataPengguna
			);
		} else
			return array(
				'sukses' => false,
				'data' => null

			);
	}
	public function edit_url_picture($dataInput)
	{
		$this->db->query("update pengguna set UrlPicture=? where RecId=? ", array($dataInput['UrlPicture'], $dataInput['RecId']));

		$afftectedRows = $this->db->affected_rows();
		if ($afftectedRows == 1) {
			return array(
				'sukses' => true,
				'data' => $dataInput
			);
		} else
			return array(
				'sukses' => false,
				'data' => $dataInput
			);
	}
}
