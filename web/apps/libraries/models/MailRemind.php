<?php

namespace Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class MailRemind extends Model
{
    public $id;

    public $contract_id;

    public $email_receiver;

    public $client_receiver;

    public $status;
    
    public $sent_date;

    public $created_at;

    public $updated_at;

    public function initialize()
    {
        $this->setSource("mail_remind");
        $this->belongsTo(
            "contract_id",
            "Contract",
            "id",['alias' => 'Contract']
        );
    }

    public function getSource()
    {
        return 'mail_remind';
    }

}
