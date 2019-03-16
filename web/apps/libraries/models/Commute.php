<?php

class Commute extends \Phalcon\Mvc\Model
{
    public $id;

    public $code;

    public $assets_id;

    public $descrip2;

    public $bill_num;

    public $buy_date;

    public $expired_guarantee_date;

    public $used_date;

    public $unit_price_pro;

    public $price_pro;

    public $supplier_id;

    public $status;

    public $department_id;

    public $manager_id;

    public $depreciation_time;

    public $depreciation_total;

    public $depreciation_type;

    public $depreciation_tm;

    public $evaluated;

    public $quality;

    public $quantity;

    public static function findFirstId($id, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "id = :id:",
            "bind" => array('id' => $id),
            "columns" => $columns,
        ]);
    }

    public function getSource()
    {
        return 'commute';
    }
}
