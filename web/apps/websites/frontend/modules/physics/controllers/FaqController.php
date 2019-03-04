<?php

namespace Frontend\Modules\Physics\Controllers;

use Library\Helper\Helper;
use Phalcon\Mvc\View;
use Models\Package;
use Models\Faq;

class FaqController extends \FrontendController
{
    public function indexAction(){
        if ($this->request->getQuery('single')) {
            $this->view->setRenderLevel(
                View::LEVEL_ACTION_VIEW
            );
        }
        $data = $this->modelsManager->createBuilder()
        ->columns(array(
            'Models\Faq.id',
            'Models\Faq.package_id',
            'Models\Faq.ask',
            'Models\Faq.answer',
            'Models\Faq.location',
            'Models\Faq.status',
            'Models\Faq.created_at',
            'P.name package_name', 
        ))
        ->from('Models\Faq')
        ->join('Models\Package', 'P.id = Models\Faq.package_id','P')
        ->orderBy('Models\Faq.package_id ASC')
        ->where('1=1');
        $data = $data->getQuery()->execute();

        $this->view->faqs = $data;
    }
}