<?php
namespace Backend\Modules\Master\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Role;

class SearchUserForm extends Form{
    public function initialize($entity = null, $options = null){
        //roleidSearch
        $roleidSearch = new Select('roleidSearch', Role::find(['id != 1']), array(
            'using'         => array('id', 'name'),
            'class'         => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả',
        ));
        $roleidSearch->setLabel('Nhóm người dùng');
        $this->add($roleidSearch);

        //usernameSearch
        $usernameSearch = new Text('usernameSearch');
        $usernameSearch->setLabel('Tên tài khoản');
        $usernameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: admin',
            'maxlength' => "100",
        ));
        $this->add($usernameSearch);

        //fullnameSearch
        $fullnameSearch = new Text('fullnameSearch');
        $fullnameSearch->setLabel('Họ và tên');
        $fullnameSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'maxlength' => "100",
            'placeholder' => 'Ví dụ: Nguyễn Văn A',
        ));
        $this->add($fullnameSearch);

        //emailSearch
        $emailSearch = new Text('emailSearch');
        $emailSearch->setLabel('E-mail');
        $emailSearch->setAttributes(array(
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Ví dụ: admin@honeynet.vn',
            'maxlength' => "100",
        ));
        $this->add($emailSearch);

        //statusSearch
        $statusSearch = new Select('statusSearch',[
            1              => "Hoạt động",
            0              => "Khóa",
        ], [
            'class'         => 'form-control form-control-sm',
            'useEmpty'      => true,
            'emptyValue'    => 'all',
            'emptyText'     => 'Tất cả',
        ]);
        $statusSearch->setLabel('Trạng thái');
        $this->add($statusSearch);

        //packgeSearch
        $paged = new Hidden('paged');
        $paged->setAttributes(array('id' => null));
        $this->add($paged);
    }
}
