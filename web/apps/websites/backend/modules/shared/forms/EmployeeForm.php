<?php
namespace Backend\Modules\Shared\Forms;

use Depts;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Form;

class EmployeeForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        $name = new Text('name');
        $name->setLabel('Tên nhân viên '.requiredLabel());
        $name->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'data-error' => "Thông tin chưa hợp lệ",
            'required' => '',
            'placeholder' => 'Ví dụ: Nguyễn Văn A',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 100 ký tự",
        ));
        $this->add($name);

        $ecode = new Text('ecode');
        $ecode->setLabel('Mã nhân viên '.requiredLabel());
        $ecode->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "13",
            'size' => "13",
            'required' => '',
            'placeholder' => 'Ví dụ: Nguyễn Văn A',
            'data-error' => "Thông tin chưa hợp lệ",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-maxlength-error' => "Thông tin không được quá 13 ký tự"
        ));
        $this->add($ecode);

        $perL = \Library\Master\Master::checkPermissionDepted('employee','index');
        $deptType = \Depts::getTreeNamePermission($perL);
        $deptid = new Select('deptid', $deptType, array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Đơn vị/bộ phận không đúng quy định.",
        ));
        $deptid->setLabel('Đơn vị/bộ phận '.requiredLabel());
        $this->add($deptid);

        $dutyid = new Select('dutyid', \Duty::find(["deleted = 0"]), array(
            'using' => array('id', 'name'),
            'class' => 'form-control form-control-sm',
            'required' => '',
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Chức vụ không đúng quy định.",
        ));
        $dutyid->setLabel('Chức vụ');
        $this->add($dutyid);

        $note = new Text('note');
        $note->setLabel('Ghi chú');
        $note->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "150",
            'data-error' => "Thông tin chưa hợp lệ",
            'placeholder' => 'Ví dụ: Đang thử việc',
            'data-maxlength-error' => "Thông tin không được quá 150 ký tự",

        ));
        $this->add($note);
    }
}
