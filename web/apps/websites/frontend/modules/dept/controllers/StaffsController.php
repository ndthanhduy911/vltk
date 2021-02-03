<?php

namespace Frontend\Modules\Dept\Controllers;

class StaffsController extends \LayoutsController
{
    public $className = \Staffs::class;

    public $classNameLang = \StaffsLang::class;

    public $itemid = 'staffid';

    public $attrid = 2;

    public $title = 'Tổ chức Nhân sự';

    public function indexC($view){
        $view->pick('templates/pages/staffs');
        return $view;
    }

    public function singleC($view){
        return $view;
    }
}