<?php
namespace Library\CheckPayment;
use Models\Contract;

class Check{
    public $contract_id;
    public $data = null;

    // function __construct($contract_id){
    //     $this->keysort = $contract_id;
    //     $this->data = $data;
    // }

    static function checkPayment($contract_id){
      $contract = Contract::findFirstById($contract_id);
    }
}