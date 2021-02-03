<?php

namespace Frontend\Modules\Dept\Controllers;

class ClassesController extends \LayoutsController
{
    public $className = \Classes::class;

    public $classNameLang = \ClassesLang::class;

    public $itemid = 'classid';

    public $attrid = 7;

    public function indexC($view){
        $view->pick('templates/pages/classes');
        return $view;
    }
}