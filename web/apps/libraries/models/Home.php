<?php
class Home extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("home");
    }

    public function getSource()
    {
        return 'home';
    }
}