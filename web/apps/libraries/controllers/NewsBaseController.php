<?php

use Phalcon\Mvc\Controller;
use Library\Common;
use Models\Film\Film;
use Models\News\Category;
class NewsBaseController extends FrontendController
{
    public function initialize()
    {
        parent::initialize();
    }
}
