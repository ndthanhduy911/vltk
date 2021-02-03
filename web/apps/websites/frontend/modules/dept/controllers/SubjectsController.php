<?php

namespace Frontend\Modules\Dept\Controllers;

class SubjectsController extends \LayoutsController
{
    public $className = \Subjects::class;

    public $classNameLang = \SubjectsLang::class;

    public $itemid = 'subjectid';

    public $attrid = 8;

    public $title = 'Danh sách môn học';

    public function indexC($view){
        $view->pick('templates/pages/subjects');
        return $view;
    }
}