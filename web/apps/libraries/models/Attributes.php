<?php

class Attributes extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("banner");
    }

    public function getSource()
    {
        return 'banner';
    }
}