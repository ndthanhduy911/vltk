<?php
class Partner extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("partner");
    }

    public function getSource()
    {
        return 'partner';
    }
}