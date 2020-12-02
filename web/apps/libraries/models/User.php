<?php
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\InclusionIn;
use Phalcon\Validation\Validator\ExclusionIn;

class User extends \ModelCore
{
    public function initialize()
    {
        $this->setSchema(SCHEMADB);
        $this->setSource("user");
    }

    public function vdUpdate($try=false)
    {
        $validator = new Validation();

        //username
        $validator->add(
            'username',
            new StringLength([
                "max"            => 30,
                "messageMaximum" => "Tên tài khoản không được quá 30 ký tự",
            ])
        );
        $validator->add(
            'username',
            new PresenceOf([
                'message'   => 'Tên tài khoản không được để trống'
            ])
        );
        $model = !empty($this->id) ? parent::find(["deleted = 0 AND id != $this->id",'columns' => 'username']) : parent::find(["deleted = 0",'columns' => 'username']);
        $validator->add(
            'username',
            new ExclusionIn([
                "message" => "Tên tài khoản đã tồn tại",
                "domain"  => array_column($model->toArray(),'username'),
            ])
        );

        //fullname
        $validator->add(
            'fullname',
            new StringLength([
                "max"            => 250,
                "messageMaximum" => "Họ và tên không được quá 250 ký tự",
            ])
        );

        //email
        $validator->add(
            'email',
            new PresenceOf([
                'message'   => 'E-mail không được để trống'
            ])
        );
        $validator->add(
            'email',
            new StringLength(
            [
                "max"            => 50,
                "messageMaximum" => "E-mail không được quá 50 ký tự",
            ])
        );
        $validator->add(
            'email',
            new EmailValidator([
                'model'   => $this,
                'message' => 'Địa chỉ e-mail không đúng định dạng',
            ])
        );
        $model = !empty($this->id) ? parent::find(["deleted = 0 AND id != $this->id",'columns' => 'email']) : parent::find(["deleted = 0",'columns' => 'email']);
        $validator->add(
            'email',
            new ExclusionIn([
                "message" => "E-mail đã được sử dụng",
                "domain"  => array_column($model->toArray(),'email'),
            ])
        );

        //password
        $validator->add(
            'password',
            new PresenceOf([
                'message'   => 'Mật khẩu không được để trống'
            ])
        );
        $validator->add(
            'password',
            new StringLength(
            [
                "max"            => 60,
                "min"            => 6,
                "messageMaximum" => "Mật khẩu không được quá 60 ký tự",
                "messageMaximum" => "Mật khẩu lớn hơn 6 ký tự",
            ])
        );

        //roleid
        $validator->add(
            'roleid',
            new PresenceOf([
                'message'   => 'Nhóm người dùng không được để trống'
            ])
        );

        $validator->add(
            'roleid',
            new InclusionIn([
                "message" => "Nhóm người dùng không đúng",
                "domain"  => array_column(Role::find()->toArray(),'id'),
            ])
        );

        //status
        $validator->add(
            'status',
            new PresenceOf([
                'message'   => 'Trạng thái không được để trống'
            ])
        );

        if($try){
            if(!$this->validate($validator)){
                foreach ($this->getMessages() as $message) {
                    throw new \Exception($message->getMessage());
                }
            }
        }

        return $this->validate($validator);
    }

    public static function findFirstUsername($username, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "username = :username:",
            "bind" => ['username' => $username],
            "columns" => $columns
        ]);
    }

    public static function findFirstUsernameLogin($username, $columns = "*")
    {
        return parent::findFirst([
            "conditions" => "username = :username: AND deleted = 0 AND status = 1",
            "bind" => ['username' => $username],
            "columns" => $columns
        ]);
    }
}
