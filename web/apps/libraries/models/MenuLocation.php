<?php
class MenuLocation extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("menulocation");
    }
}