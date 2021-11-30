<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Site extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_device');
        $this->load->model('model_location');
        $this->load->model('model_location_building');
        $this->load->model('model_location_place');
    }

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
    public function tipe_device()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'Tipe Device',
            'kamus' =>
            [
                "device_type" => $this->model_device->show_device_type("", "", "yes"),                
                "location" => $this->model_location->show_location(),
                "location_building" => $this->model_location_building->show_location_building(),
                "location_place" => $this->model_location->show_location_detail_by_type('place')
            ]


        );

        $this->load->view('site', $data);
    }
    public function system_log()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'System Log',
            'kamus' =>
            [
                "device_type" => $this->model_device->show_device_type("", "", "yes"),
                "location" => $this->model_location->show_location(),
                "location_building" => $this->model_location_building->show_location_building(),
                "location_place" => $this->model_location->show_location_detail_by_type('place')
            ]


        );

        $this->load->view('site', $data);
    }
    public function user()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'User ',
            'kamus' =>
            [
                "device_type" => $this->model_device->show_device_type("", "", "yes"),
                "location" => $this->model_location->show_location(),
                "location_building" => $this->model_location_building->show_location_building(),
                "location_place" => $this->model_location->show_location_detail_by_type('place')
            ]


        );

        $this->load->view('site', $data);
    }
    public function location()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'Lokasi ',
            'kamus' =>
            [
                "device_type" => $this->model_device->show_device_type("", "", "yes"),
                "location" => $this->model_location->show_location(),
                "location_building" => $this->model_location_building->show_location_building(),
                "location_place" => $this->model_location->show_location_detail_by_type('place')
            ]


        );

        $this->load->view('site', $data);
    }
    public function kf()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'Fungsi/Seksi ',
            'kamus' =>
            [
                "device_type" => $this->model_device->show_device_type("", "", "yes"),
                "location" => $this->model_location->show_location(),
                "location_building" => $this->model_location_building->show_location_building(),
                "location_place" => $this->model_location->show_location_detail_by_type('place')
            ]


        );

        $this->load->view('site', $data);
    }
    public function ruangan()
    {
        $data = array(
            'menu' => $this->uri->segment(2),
            'judul' => 'Ruangan ',
            'kamus' =>
            [
                "device_type" => $this->model_device->show_device_type("", "", "yes"),
                "location" => $this->model_location->show_location(),
                "location_building" => $this->model_location_building->show_location_building(),
                "location_place" => $this->model_location->show_location_detail_by_type('place')
            ]


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
