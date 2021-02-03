<?php

namespace Frontend\Modules\Dept\Controllers;

class MajorsController extends \LayoutsController
{
    public $className = \Majors::class;

    public $classNameLang = \MajorsLang::class;

    public $itemid = 'majorid';

    public $attrid = 6;

    public $title = 'Ngành học';

    public function indexC($view){
        $view->pick('templates/pages/majors');
        return $view;
    }

    public function singleC($view){
        $majorList = $this->modelsManager->createBuilder()
        ->columns(array(
            'r.id',
            'r.slug',
            'r.image',
            'rl.title',
        ))
        ->from(['r'=>'Majors'])
        ->where("r.deptid = {$this->dept->id} AND r.status = 1 AND r.deleted = 0")
        ->leftJoin('MajorsLang', "rl.majorid = r.id AND rl.langid = {$this->langid}",'rl')
        ->getQuery()
        ->execute();
        $view->majorList = $majorList;
        return $view;
    }
}