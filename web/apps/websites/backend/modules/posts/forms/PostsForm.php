<?php
namespace Backend\Modules\Posts\Forms;


use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Date as DateValidator;
use Models\Categories;

class PostsForm extends Form
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

        $calendar = new Text('calendar');
        $calendar->setAttributes(array(
            'class' => 'form-control-sm datetime-basic w-100',
            'placeholder' => 'dd/mm/yyyy hh:mm',
            'maxlength' => "16",
            // 'pattern' =>"^(0[1-9]|1\d|2\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$",
            // 'data-pattern-error' => "Định đạng không đúng. Chỉ cho phép ngày theo định dạng dd/mm/yyyy"
        ));
        $calendar->addValidators(array(
            new StringLength([
                "max" => 16,
                "messageMaximum" => "Tóm tắt không được dài quá 16 ký tự",
            ]),
            new DateValidator(
                [
                    "format"  => "d/m/Y H:i",
                    "message" => "Không đúng định dạng thời gian",
                ]
            )
        ));
        $this->add($calendar);

        $slug = new Text('slug');
        $slug->setAttributes(array(
            'class' => 'form-control',
            'placeholder' => 'Slug',
            'maxlength' => "200",
        ));
        $slug->addValidators(array(
            new StringLength([
                "max" => 200,
                "messageMaximum" => "Slug không được dài quá 255 ký tự",
            ]),
        ));
        $this->add($slug);

        $cat_id = new Select('cat_id', $cats, array(
            'using' => array('id', 'name'),
            'class' => 'form-control pull-right w-100',
            'data-error' => "Chưa đúng định dạng",
        ));
        $cat_id->addValidators(array(
            new PresenceOf(array(
                'message' => 'Danh mục không được để trống',
            )),
        ));
        $this->add($cat_id);

        $status = new Select('status', [
            1 => "Hoạt động",
            0 => "Khóa",
        ], [
            'useEmpty' => true,
            'emptyText' => 'Vui lòng chọn trạng thái',
            'emptyValue' => '',
            'class' => 'form-control pull-right w-100',
            'required' => '',
            'data-required-error' => 'Vui lòng điền đầy đủ thông tin.',
        ]);
        $status->addValidators(array(
            new PresenceOf(array(
                'message' => 'Trạng thái không được để trống.',
            )),
        ));
        $this->add($status);

        $featured_image = new Hidden('featured_image');
        $this->add($featured_image);

        $deleted = new Hidden('deleted');
        $this->add($deleted);
    }
}
