<?php
class HomeLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("homelang");
    }
}