<?php

class OffersPelf extends \Phalcon\Mvc\Model
{
    public $id;

    public $assets_id;

    public $plan_id;

    public $department_id;

    public $purpose;

    public $quantity;

    public $unit_price_ex;

    public $price_ex;

    public $used_date_ex;

    public $buy_method;

    public $status;

    public $created_user;

    public $created_at;

    public $updated_at;

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
        return 'offers_pelf';
    }
}
