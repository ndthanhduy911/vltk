<?php

class CalendarsLang extends \Phalcon\Mvc\Model
{

    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("calendarslang");
    }
}