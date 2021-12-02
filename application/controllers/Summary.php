<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;

defined('BASEPATH') or exit('No direct script access allowed');

class Summary extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_report');
        $this->load->model('model_inventory');
    }

    public function index()
    {
        require APPPATH . 'third_party/fpdf184/fpdf.php';
        // Get Datas
        $by       = $_GET['by'];
        $criteria = '';
        $report_name = ucwords(str_replace("_", " ", $_GET['name']));
     

        // If criteria is set
        if (isset($_GET['criteria']) && $_GET['criteria'] != '') {
            $criteria = $_GET['criteria'];
        }

        $no = 0;

        $datas = $this->model_report->show_device_report($by, $criteria);
        $pdf = new FPDF('L');
        $pdf->AddPage();
        $pdf->SetFont('Times', '', 8);
        $logo_image = "assets/images/logo.png";

        $pdf->Image($logo_image, 10, 6, 25);
        $pdf->SetFont('Arial','B',15);
        $pdf->Cell(120);
        $pdf->Cell(30,10,$this->model_inventory->setting_data("inventory_name"),0,1,'C');

        $pdf->SetFont('Arial','',12);
        $pdf->Cell(120);
        $pdf->Cell(30,5,'Report '.$report_name,0,0,'C');
        // Line break
        $pdf->Ln(10);

        // Table header
        $pdf->SetFont('Arial','B',9);
        $pdf->Cell(9, 10, "No", 1, 0);
        $pdf->Cell(25, 10, "Kode", 1, 0);
        $pdf->Cell(30, 10, "Jenis Barang", 1, 0);
		$pdf->Cell(12, 10, "Tahun", 1, 0);
        $pdf->Cell(28, 10, "No. BMN", 1, 0);
		$pdf->Cell(15, 10, "Merek", 1, 0);
        $pdf->Cell(35, 10, "Model", 1, 0);
        $pdf->Cell(50, 10, "SN", 1, 0);
        $pdf->Cell(15, 10, "Color", 1, 0);
        $pdf->Cell(35, 10, "Pemegang", 1, 0);
        $pdf->Cell(15, 10, "Status", 1, 1);
        $pdf->SetFont('Arial','',8);
        
        foreach ($datas as $data) {
            $no++;

            // if location details enabled
            if ($this->model_inventory->setting_data("location_details") == "enable") {
                //$locationdetail = $data['place_name'].", ".$data['building_name'].", ".$data['floor_name'].", ".$data['location_name'];
                $locationdetail = $data['location_name'];
            } else {
                $locationdetail = $data['location_name'];
            }

            $pdf->Cell(9, 10, $no, 1, 0);
            $pdf->Cell(25, 10, $data['device_code'], 1, 0);
            $pdf->Cell(30, 10, $data['type_name'], 1, 0);
            $pdf->Cell(12, 10, $data['device_tahun'], 1, 0);
            $pdf->Cell(28, 10, $data['device_bmn'], 1, 0);
            $pdf->Cell(15, 10, $data['device_brand'], 1, 0);
            $pdf->Cell(35, 10, $data['device_model'], 1, 0);
            $pdf->Cell(50, 10, $data['device_serial'], 1, 0);
            $pdf->Cell(15, 10, $data['device_color'], 1, 0);
            $pdf->Cell(35, 10, $locationdetail, 1, 0);
            $pdf->Cell(15, 10, ucfirst($data['device_status']), 1, 1);
        }


        $pdf->Output();
    }
}
