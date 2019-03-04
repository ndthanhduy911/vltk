<?php
namespace Backend\Modules\Dashboard\Controllers;

use Library\Common;
use Library\Helper\Helper;

use Phalcon\Mvc\View;

use Phalcon\Paginator\Adapter\QueryBuilder as Paginator;
use Library\Pagination\Pager as Pager;

class AboutController  extends \BackendController
{
    public function indexAction()
    {
        if($this->request->getQuery('single')){
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $this->assets->addCss('/assets/backend/css/help.css');
    }

}
