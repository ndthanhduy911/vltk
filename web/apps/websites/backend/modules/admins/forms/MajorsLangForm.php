<?php
namespace Backend\Modules\Admins\Forms;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;

class MajorsLangForm extends \Phalcon\Forms\Form
{
    public function initialize($entity = null, $lang = null)
    {
        $title = new Text('title');
        $title->setLabel('<i class="fas fa-book mr-1"></i>Tiêu đề');
        $attr = [
            'class' => "form-control form-control-sm",
            'placeholder' => 'Tiêu đề',
            'required' => '',
            'maxlength' => "255",
            'data-required-error' => "Vui lòng nhập thông tin",
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'title');
        $title->setAttributes($attr);
        $this->add($title);

        //excerpt
        $excerpt = new Textarea('excerpt');
        $excerpt->setLabel('<i class="fas fa-newspaper mr-1"></i> Giới thiệu chung');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Giới thiệu chung',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'excerpt');
        $excerpt->setUserOption('attr','editor');
        $excerpt->setAttributes($attr);
        $this->add($excerpt);
        
        //stdout
        $stdout = new Textarea('stdout');
        $stdout->setLabel('<i class="fas fa-newspaper mr-1"></i> Chuẩn đầu ra');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Chuẩn đầu ra',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'stdout');
        $stdout->setUserOption('attr','editor');
        $stdout->setAttributes($attr);
        $this->add($stdout);
        
        //curriculum
        $curriculum = new Textarea('curriculum');
        $curriculum->setLabel('<i class="fas fa-newspaper mr-1"></i> Khung chương trình đào tạo');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Khung chương trình đào tạo',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'curriculum');
        $curriculum->setUserOption('attr','editor');
        $curriculum->setAttributes($attr);
        $this->add($curriculum);

        //prospects
        $prospects = new Textarea('prospects');
        $prospects->setLabel('<i class="fas fa-newspaper mr-1"></i> Triển vọng nghề nghiệp');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Triển vọng nghề nghiệp',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'prospects');
        $prospects->setUserOption('attr','editor');
        $prospects->setAttributes($attr);
        $this->add($prospects);

        //fee
        $fee = new Textarea('fee');
        $fee->setLabel('<i class="fas fa-newspaper mr-1"></i> Học phí - Học bổng - Môi trường học');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Học phí - Học bổng - Môi trường học',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'fee');
        $fee->setUserOption('attr','editor');
        $fee->setAttributes($attr);
        $this->add($fee);

        //researches
        $researches = new Textarea('researches');
        $researches->setLabel('<i class="fas fa-newspaper mr-1"></i> Nghiên cứu ứng dụng');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Nghiên cứu ứng dụng',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'researches');
        $researches->setUserOption('attr','editor');
        $researches->setAttributes($attr);
        $this->add($researches);

        //students
        $students = new Textarea('students');
        $students->setLabel('<i class="fas fa-newspaper mr-1"></i> Sinh viên và cựu sinh viên tiêu biểu');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Sinh viên và cựu sinh viên tiêu biểu',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'students');
        $students->setUserOption('attr','editor');
        $students->setAttributes($attr);
        $this->add($students);

        //rpartners
        $rpartners = new Textarea('rpartners');
        $rpartners->setLabel('<i class="fas fa-newspaper mr-1"></i> Đánh giá của nhà tuyển dụng');
        $attr = [
            'class' => 'form-control form-control-sm',
            'placeholder' => 'Đánh giá của nhà tuyển dụng',
            'data-error' => "Thông tin chưa hợp lệ"
        ];
        $attr = cFL($attr,$lang,'rpartners');
        $rpartners->setUserOption('attr','editor');
        $rpartners->setAttributes($attr);
        $this->add($rpartners);
    }
}
