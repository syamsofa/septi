<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Site extends CI_Controller
{

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
    public function dashboard()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'Dashboard',
            // 'satker' => $this->satker,
            // 'organisasi' => $this->organisasi,
            // 'satuan' => $this->satuan,
            // 'pengguna' => $this->pengguna,
            // 'pekerjaan' => $this->pekerjaan

        );

        $this->load->view('site', $data);
    }
    public function jenis_perangkat()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'Jenis Perangkat',
            // 'satker' => $this->satker,
            // 'organisasi' => $this->organisasi,
            // 'satuan' => $this->satuan,
            // 'pengguna' => $this->pengguna,
            // 'pekerjaan' => $this->pekerjaan

        );

        $this->load->view('site', $data);
    }
    public function logout()
    {
        $array_items = array('Nama', 'Email', 'UrlPicture');
        $this->session->unset_userdata($array_items);
        include APPPATH . 'third_party/glogin/config.php';

        if ($this->session->userdata('OpsiLoginId') == 2)
            $google_client->revokeToken();
        else if ($this->session->userdata('OpsiLoginId') == 1) {

            redirect($this->session->userdata('UrlLogout'));
        }

        session_destroy();
        redirect('login');
    }
}
