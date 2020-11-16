<?php
namespace Backend\Modules\Admins\Forms;


use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\PresenceOf;

class HomeForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $deptid = isset($_SESSION['deptid']) ? $_SESSION['deptid'] : 0;
        $dept = \Depts::findFirstId($deptid);
        if($dept && $dept->post_connect){
            $array_dept = [$deptid, 1];
        }else{
            $array_dept = [$deptid];
        }

        $cats = $this->modelsManager->createBuilder()
        ->columns(array(
            'c.id',
            'cl.name name',
            'c.deptid',
        ))
        ->from(['c'=>'Categories'])
        ->inWhere("c.deptid", $array_dept)
        ->leftJoin('CategoriesLang', "cl.catid = c.id AND cl.langid = 1",'cl')
        ->orderBy('c.deptid DESC, cl.name ASC')
        ->getQuery()
        ->execute();

        $dataCat = [];
        foreach ($cats as $key => $value) {
            $dataCat[$value->id] = $value->deptid == 1 ? $value->name.' (Khoa)' : $value->name;
        }

        $cat_list_array = new Select('cat_list[]', $dataCat, array(
            'class' => 'form-control pull-right',
            'data-error' => "Chưa đúng định dạng",
            'name' => 'cat_list[]',
            'multiple' => true
        ));
        if(!empty($entity->cat_list)){
            $cat_list_array->setDefault(json_decode($entity->cat_list));
        }
        $this->add($cat_list_array);


        $post_number = new Numeric('post_number');
        $post_number->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Số lượng bài viết',
            'maxlength' => "50",
        ));
        $this->add($post_number);

        $partner_bg = new Hidden('partner_bg');
        $this->add($partner_bg);

        $specialized_bg = new Hidden('specialized_bg');
        $this->add($specialized_bg);

        $cat_list = new Hidden('cat_list');
        $cat_list->addValidators(array(
            new PresenceOf(array(
                'message' => 'Danh mục không được để trống',
            )),
        ));
        $this->add($cat_list);
    }
}
