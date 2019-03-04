<?php
namespace Models;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class CommentClient extends \Phalcon\Mvc\Model
{
    public $id;

    public $user_id;

    public $type_user;

    public $support_id;

    public $content;

    public $file;
    
    public $created_at;

    public $updated_at;

    /**
     * Initialize method for model.
     */
    
    public function initialize()
    {
        $this->setSource("comment_client");

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'comment_client';
    }
}