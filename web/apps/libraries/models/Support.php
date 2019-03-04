<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Support extends \Phalcon\Mvc\Model
{
    public $id;

    public $package_id;

    public $ticket;

    public $req_package;

    public $content;

    public $priority;

    public $department_id;

    public $department_other;

    public $note;

    public $assign_person_id;

    public $main_assign_person;

    public $des_assign;

    public $user_assign_id;

    public $date_assign;

    public $deadline;

    public $progress;

    public $status;

    public $assess;

    public $file;

    public $updated_at;

    public $created_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize(){
        $this->setSource("support");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'support';
    }
}
