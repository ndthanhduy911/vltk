<?php

class PostsLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("postslang");
    }

    public function getSource()
    {
        return 'postslang';
    }
}