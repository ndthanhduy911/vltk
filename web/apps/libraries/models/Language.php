<?php
class Language extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("language");
    }

    public function getSource()
    {
        return 'language';
    }
}