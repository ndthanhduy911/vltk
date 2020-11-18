<?php
class MenuLocation extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("menulocation");
    }

    public function getSource()
    {
        return 'menulocation';
    }
}