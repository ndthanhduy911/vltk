<?php 

namespace Library\Helper;

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\ExclusionIn;
use Phalcon\Validation\Validator\Digit;
use Phalcon\Validation\Validator\Date as DateValidator;
use Phalcon\Validation\Validator\Between;
use Phalcon\Validation\Validator\Numericality;

/**
 * 
 */
class HelperValidation
{
    private $validator = null;

    function __construct($options = []){
        $this->validator = new Validation();
    }

    public function setValidation($validationName, $options = []){
        switch ($validationName) {
            case 'required':{
                $this->validator->add(
                    $options['name'],
                    new PresenceOf([
                        'message' => $options['msg']
                    ])
                );
                break;
            }
            case 'max':{
                $this->validator->add(
                    $options['name'],
                    new StringLength([
                        'max' => $options['len'],
                        'messageMaximum' => $options['msg']
                    ])
                );
                break;
            }
            case 'min':{
                $this->validator->add(
                    $options['name'],
                    new StringLength([
                        'min' => $options['len'],
                        'messageMinimum' => $options['msg']
                    ])
                );
                break;
            }
            case 'numeric':{
                $this->validator->add(
                    $options['name'],
                    new Numericality([
                        'message' => $options['msg']
                    ])
                );
                break;
            }
            case 'int':{
                $this->validator->add(
                    $options['name'],
                    new Digit([
                        'message' => $options['msg']
                    ])
                );
                break;
            }
            case 'date':{
                $this->validator->add(
                    $options['name'],
                    new DateValidator(
                        [
                            "format"  => $options['format'],
                            "message" => $options['msg']
                        ]
                    )
                );
                break;
            }
            case 'exclusionin':{
                $this->validator->add(
                    $options['name'],
                    new ExclusionIn(
                        [
                            "domain"  => $options['domain'],
                            "message" => $options['msg']
                        ]
                    )
                );
                break;
            }
            case 'between':{
                $this->validator->add(
                    $options['name'],
                    new Between(
                        [
                            "minimum" => $options['min'],
                            "maximum"  => $options['max'],
                            "message" => $options['msg']
                        ]
                    )
                );
                break;
            }
            default:{
                $this->validator->add(
                    $options['name'],
                    new FailedValidator(
                        [
                            "message" => $options['msg']
                        ]
                    )
                );
                break;
            }
        }
    }

    public function getValidation(){
        return $this->validator;
    }
}