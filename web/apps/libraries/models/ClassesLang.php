<?php

class ClassesLang extends \Phalcon\Mvc\Model
{

    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("classeslang");
    }
}