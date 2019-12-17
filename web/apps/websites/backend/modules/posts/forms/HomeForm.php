<?php
namespace Backend\Modules\Posts\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Date as DateValidator;
use Models\Categories;

class HomeForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $dept_id = isset($_SESSION['dept_id']) ? $_SESSION['dept_id'] : 0;
        $npCat = Categories::getNamepace();
        $cats = $this->modelsManager->createBuilder()
        ->columns(array(
            $npCat.'.id',
            'CL.name name',
        ))
        ->from($npCat)
        ->join('Models\CategoriesLang', "CL.cat_id = $npCat.id AND CL.lang_id = 1",'CL')
        ->orderBy('CL.name ASC')
        ->where("$npCat.dept_id = $dept_id")
        ->getQuery()
        ->execute();

        $cat_list = new Select('cat_list', $cats, array(
            'using' => array('id', 'name'),
            'class' => 'form-control pull-right w-100',
            'data-error' => "Chưa đúng định dạng",
            'name' => 'cat_list[]',
            'multiple' => true
        ));
        $cat_list->addValidators(array(
            new PresenceOf(array(
                'message' => 'Danh mục không được để trống',
            )),
        ));
        $this->add($cat_list);

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
    }
}
