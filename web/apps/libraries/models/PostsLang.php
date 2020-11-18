<?php

class PostsLang extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("postlang");
    }

    public function getSource()
    {
        return 'postlang';
    }
}