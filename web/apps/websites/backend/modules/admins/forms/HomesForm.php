<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Form;

class HomesForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $deptid = $this->session->get('deptid');
        $cats = \Categories::find([
            "deptid = {$deptid} AND deleted = 0",
            "columns" => "Categories.id, (SELECT cl.name FROM CategoriesLang AS cl WHERE cl.catid = Categories.id AND cl.langid = 1) AS catname"
        ]);
        $catlist = new Select('catlist', $cats, array(
            'using' => ['id','catname'],
            'multiple' => "",
            'name' => "catlist[]",
            'class' => 'form-control form-control-sm',
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $catlist->setLabel('Chuyên mục');
        $this->add($catlist);

        $postnumber = new Text('postnumber');
        $postnumber->setLabel('Số bài viết');
        $postnumber->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Slug',
            'maxlength' => "200",
            'data-error' => "Thông tin chưa hợp lệ",
        ));
        $this->add($postnumber);

        //specializedbg
        $specializedbg = new Hidden('specializedbg');
        $this->add($specializedbg);

        //partnerbg
        $partnerbg = new Hidden('partnerbg');
        $this->add($partnerbg);
    }
}
