<?php
class Social extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("social");
    }

    public function getSource()
    {
        return 'social';
    }
}