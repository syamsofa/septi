<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function index()
	{
		$data = array(
			'menu' => $this->uri->segment(2),
			'judul' => 'index',		
			// 'satker' => $this->satker,
			// 'organisasi' => $this->organisasi,
			// 'satuan' => $this->satuan,
			// 'pengguna' => $this->pengguna,
			// 'pekerjaan' => $this->pekerjaan

		);

		$this->load->view('login', $data);
	}
}
