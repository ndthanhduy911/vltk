<?php
namespace Backend\Modules\Master\Controllers;
use Phalcon\Mvc\Controller;

class UploadsController extends Controller
{
    public function indexAction()
    {
    }

    public function importAction($filename = null)
    {
        $this->view->disable();
        $dirPath = implode(DIRECTORY_SEPARATOR, [BASE_DIR, 'files','import']);
        $download = new \Library\PrintExcel\DownloadFileExcel([
            'dirPath' => $dirPath,
            'filename' => $filename.'.xlsx',
            'password' => EXCEL_PASSWORD
        ]);
        switch ($filename) {
            case 'checkin_import': {
                if(!$perL = $this->master::checkPermissionDepted('checkin','update')){
                    require ERROR_FILE; die;
                }
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }
                $download->download($this->createCheckInExcel($download,$perL));
                break;
            }
            case 'checkout_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createCheckOutExcel($download));
                break;
            }
            case 'reduction_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createReductionExcel($download));
                break;
            }
            case 'inventory_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createInventoryExcel($download));
                break;
            }
            case 'estimate_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createEstimateExcel($download));
                break;
            }
            case 'transfer_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createTransferExcel($download));
                break;
            }
            case 'furnish_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createFurnishExcel($download));
                break;
            }
            case 'pcplan_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createPlanExcel($download));
                break;
            }
            case 'employee_import': {
                if ($resFile = $download->getFilePrint() !== true) {
                    throw new \Exception($resFile);
                }
                if ($resValidation = $download->validation() !== true) {
                    throw new \Exception($resValidation);
                }

                $download->download($this->createEmployeeExcel($download));
                break;
            }
            default: {
                $download->run();
                break;
            }

        }
    }

    public function displayAction($dir = '', $file = ''){
        try {
            $this->view->disable();
            if (empty($dir) || empty($file)) {
                throw new \Exception('');
            }
            $filePath = BASE_DIR . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . $dir . DIRECTORY_SEPARATOR . $file;
            if (!file_exists($filePath)) {
                throw new \Exception('');
            }

            // Get mime file
            $mimeFile = mime_content_type($filePath);
            if (in_array($mimeFile, ['image/jpeg', 'image/png'])) {
                $this->helper->displayOutputImage($filePath);
            }elseif ($mimeFile == 'application/pdf') {
                $this->helper->displayOutputPDF($filePath);
            }else{
                throw new \Exception('');
            }
        } catch (\Throwable $e) {
            echo "ERROR!!!";
        }
        die;
    }
    // ============================
    // FUNCTION
    // ============================

    private function createCheckInExcel ($download,$perL) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetIn = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(2);
        $worksheetLocation = $spreadsheet->getSheet(3);
        $worksheetAssetType = $spreadsheet->getSheet(4);
        $worksheetUnit = $spreadsheet->getSheet(5);
        $worksheetOrigin = $spreadsheet->getSheet(6);
        $worksheetPurchase = $spreadsheet->getSheet(7);
        $worksheetMade = $spreadsheet->getSheet(8);
        $worksheetSuplier = $spreadsheet->getSheet(9);
        // $worksheetCity = $spreadsheet->getSheet(10);
        // $worksheetDis = $spreadsheet->getSheet(11);
        // $worksheetWard = $spreadsheet->getSheet(12);

        $depts = \Depts::getTreeNamePermission($perL,[],'','__');
        $assetType = \AssetType::find(["deleted = 0",'columns' => 'name,code']);
        $units = \AssetUnit::find(["deleted = 0",'columns' => 'name']);
        $origins = \AssetOrigin::find(["deleted = 0",'columns' => 'name']);
        $purchase = \AssetPurchase::find(["deleted = 0",'columns' => 'name']);
        $mades = \AssetMadeIn::find(["deleted = 0",'columns' => 'name']);
        $supliers = \Supplier::find(["deleted = 0",'columns' => 'name']);

        // $citys = \Provinces::find(["deleted = 0",'columns' => 'name']);

        // $supliers = \Supplier::find(["deleted = 0",'columns' => 'name']);

        // $supliers = \Supplier::find(["deleted = 0",'columns' => 'name']);

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('E7')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($supliers->count()){
            $stt = 1;
            foreach ($supliers as $value) {
                $worksheetSuplier->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetSuplier->getCell('B'.(1+$stt))->setValue($value->name);
                $stt++;
            }
            $title = $worksheetSuplier->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('E10')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);

            $worksheetIn->getDataValidation("P18:P21")
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($assetType->count()){
            $stt = 1;
            foreach ($assetType as $item) {
                $worksheetAssetType->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetType->getCell('B'.(1+$stt))->setValue($item->code);
                $worksheetAssetType->getCell('C'.(1+$stt))->setValue($item->name);
                $stt++;
            }
            $title = $worksheetAssetType->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation("D18:D21")
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($units->count()){
            $stt = 1;
            foreach ($units as $value) {
                $worksheetUnit->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetUnit->getCell('B'.(1+$stt))->setValue($value->name);
                $stt++;
            }
            $title = $worksheetUnit->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation("E18:E21")
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($origins->count()){
            $stt = 1;
            foreach ($origins as $value) {
                $worksheetOrigin->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetOrigin->getCell('B'.(1+$stt))->setValue($value->name);
                $stt++;
            }
            $title = $worksheetOrigin->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('J18:J21')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($purchase->count()){
            $stt = 1;
            foreach ($purchase as $value) {
                $worksheetPurchase->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetPurchase->getCell('B'.(1+$stt))->setValue($value->name);
                $stt++;
            }
            $title = $worksheetPurchase->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation("K18:K21")
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($mades->count()){
            $stt = 1;
            foreach ($mades as $value) {
                $worksheetMade->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetMade->getCell('B'.(1+$stt))->setValue($value->name);
                $stt++;
            }
            $title = $worksheetMade->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('O18:O21')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createCheckOutExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetOut = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(2);

        $depts = \Depts::getTreeName(0,[],'','__');

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetOut = $spreadsheet->getActiveSheet();
            $worksheetOut->getDataValidation('D7')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);

            $worksheetOut->getDataValidation('D10')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createReductionExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetRe = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);

        $depts = \Depts::getTreeName(0,[],'','__');

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetRe = $spreadsheet->getActiveSheet();
            $worksheetRe->getDataValidation('D4')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createInventoryExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetIn = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);

        $depts = \Depts::getTreeName(0,[],'','__');

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D4')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createEstimateExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetIn = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);

        $depts = \Depts::getTreeName(0,[],'','__');

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D4')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createTransferExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetIn = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);
        $worksheetDepts2 = $spreadsheet->getSheet(2);
        $depts = \Depts::getTreeName(0,[],'','__');
        $depts2 = \Depts::getTreeName(0,[],'','__');

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D5')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($depts2)){
            $stt = 1;
            foreach ($depts2 as $dept) {
                $worksheetDepts2->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts2->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts2->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D7')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createFurnishExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetIn = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);
        $worksheetAssetType = $spreadsheet->getSheet(2);
        $worksheetAssetUnit = $spreadsheet->getSheet(3);
        $worksheetAssetPurchase = $spreadsheet->getSheet(4);
        $depts = \Depts::getTreeName(0,[],'','__');
        $assetType = \AssetType::getTreeName(0,[],'','__');
        $units = \AssetUnit::find(["deleted = 0",'columns' => 'name']);
        $purchases = \AssetPurchase::find(["deleted = 0",'columns' => 'name']);

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D4')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($assetType)){
            $stt = 1;
            foreach ($assetType as $type) {
                $worksheetAssetType->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetType->getCell('B'.(1+$stt))->setValue($type);
                $stt++;
            }
            $title = $worksheetAssetType->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D15:D19')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($units)){
            $stt = 1;
            foreach ($units as $type) {
                $worksheetAssetUnit->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetUnit->getCell('B'.(1+$stt))->setValue($type);
                $stt++;
            }
            $title = $worksheetAssetUnit->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('I15:I19')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($purchases)){
            $stt = 1;
            foreach ($purchases as $type) {
                $worksheetAssetPurchase->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetPurchase->getCell('B'.(1+$stt))->setValue($type);
                $stt++;
            }
            $title = $worksheetAssetPurchase->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('J15:J19')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createPlanExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheetIn = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);
        $worksheetAssetType = $spreadsheet->getSheet(2);
        $worksheetAssetUnit = $spreadsheet->getSheet(3);
        $worksheetAssetPurchase = $spreadsheet->getSheet(4);
        $depts = \Depts::getTreeName(0,[],'','__');
        $assetType = \AssetType::getTreeName(0,[],'','__');
        $units = \AssetUnit::find(["deleted = 0",'columns' => 'name']);
        $purchases = \AssetPurchase::find(["deleted = 0",'columns' => 'name']);

        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D4')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($assetType)){
            $stt = 1;
            foreach ($assetType as $type) {
                $worksheetAssetType->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetType->getCell('B'.(1+$stt))->setValue($type);
                $stt++;
            }
            $title = $worksheetAssetType->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('D15:D19')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($units)){
            $stt = 1;
            foreach ($units as $type) {
                $worksheetAssetUnit->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetUnit->getCell('B'.(1+$stt))->setValue($type);
                $stt++;
            }
            $title = $worksheetAssetUnit->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('I14:I18')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if(count($purchases)){
            $stt = 1;
            foreach ($purchases as $type) {
                $worksheetAssetPurchase->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetAssetPurchase->getCell('B'.(1+$stt))->setValue($type);
                $stt++;
            }
            $title = $worksheetAssetPurchase->getTitle();
            $worksheetIn = $spreadsheet->getActiveSheet();
            $worksheetIn->getDataValidation('J14:J18')
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }

    private function createEmployeeExcel ($download) {
        $spreadsheet = $download->getSpreadsheet();
        $spreadsheet->getSecurity()->setWorkbookPassword(EXCEL_PASSWORD);
        $worksheet = $spreadsheet->getSheet(0);
        $worksheetDepts = $spreadsheet->getSheet(1);
        $worksheetDuty = $spreadsheet->getSheet(2);


        $depts = \Depts::getTreeName(0,[],'','__');
        $duty = \Duty::find(["deleted = 0",'columns' => 'name']);


        if(count($depts)){
            $stt = 1;
            foreach ($depts as $dept) {
                $worksheetDepts->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDepts->getCell('B'.(1+$stt))->setValue($dept);
                $stt++;
            }
            $title = $worksheetDepts->getTitle();
            $worksheet->getDataValidation("C2:C6")
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        if($duty->count()){
            $stt = 1;
            foreach ($duty as $value) {
                $worksheetDuty->getCell('A'.(1+$stt))->setValue($stt);
                $worksheetDuty->getCell('B'.(1+$stt))->setValue($value->name);
                $stt++;
            }
            $title = $worksheetDuty->getTitle();
            $worksheet->getDataValidation("D2:D6")
            ->setType( \PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
            ->setFormula1("'$title'". '!$B$2:$B$'.$stt)
            ->setShowDropDown(TRUE);
        }

        return $spreadsheet;
    }
}
