<?php

use Models\Departments;
use Models\Staff; 
    $staffModel = new Staff();
    $npStaff = Staff::getNamepace();
    if($dept->id == 1){
        $deanStaffs = $this->modelsManager->createBuilder()
        ->columns(array(
            $npStaff.'.id',
            $npStaff.'.slug',
            $npStaff.'.featured_image',
            $npStaff.'.dean',
            $npStaff.'.dept_position',
            $npStaff.'.email',
            $npStaff.'.dept_id',
            'SL.title title',
            'SL.content content'
        ))
        ->from($npStaff)
        ->leftJoin("Models\StaffLang", "SL.staff_id = $npStaff.id AND SL.lang_id = $lang_id",'SL')
        ->where("$npStaff.status = 1 AND ($npStaff.dean = 1 OR $npStaff.dean = 2)")
        ->orderBy("$npStaff.dean ASC")
        ->limit(3)
        ->getQuery()
        ->execute();
        
        $otherStaffs = $this->modelsManager->createBuilder()
        ->columns(array(
            $npStaff.'.id',
            $npStaff.'.slug',
            $npStaff.'.featured_image',
            $npStaff.'.dean',
            $npStaff.'.dept_position',
            $npStaff.'.email',
            $npStaff.'.dept_id',
            'SL.title title',
            'SL.content content'
        ))
        ->from($npStaff)
        ->leftJoin("Models\StaffLang", "SL.staff_id = $npStaff.id AND SL.lang_id = $lang_id",'SL')
        ->where("$npStaff.status = 1")
        ->inWhere("$npStaff.dept_position", [1,2])
        ->orderBy("$npStaff.dept_id ASC, $npStaff.dept_position ASC")
        ->getQuery()
        ->execute();
        
    }else{
        $deanStaffs = $this->modelsManager->createBuilder()
        ->columns(array(
            $npStaff.'.id',
            $npStaff.'.slug',
            $npStaff.'.featured_image',
            $npStaff.'.dean',
            $npStaff.'.dept_position',
            $npStaff.'.email',
            $npStaff.'.dept_id',
            'SL.title title',
            'SL.content content'
        ))
        ->from($npStaff)
        ->leftJoin("Models\StaffLang", "SL.staff_id = $npStaff.id AND SL.lang_id = $lang_id AND $npStaff.dept_id = $dept->id",'SL')
        ->where("$npStaff.status = 1")
        ->inWhere("$npStaff.dept_position", [1,2])
        ->orderBy("$npStaff.dept_position ASC")
        ->limit(3)
        ->getQuery()
        ->execute();
    } 
?>

<!-- banner start -->
<!-- ================ -->
<div class="banner dark-translucent-bg fixed-bg"style="background-image:url('{{helper.getLinkImage(page.backgroud_image, '/assets/frontend/images/page-about-banner-1.jpg') }}'); background-position: 50% 27%;">
    <!-- breadcrumb start -->
    <!-- ================ -->
    {{ partial('breadcrumb') }}
    <!-- breadcrumb end -->
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><span class="text-white text-uppercase">{{ page_lang.title }}</span></h2>
                {% if page_lang.excerpt %}
                <div class="separator object-non-visible mt-10" data-animation-effect="fadeIn" data-effect-delay="100">
                </div>
                <p class="text-center object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">{{ page_lang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>
<!-- banner end -->

<section class="main-container pt-4">
    <div class="container">
        <div class="row">
            <div class="main col-md-9">
                {% if dept.id == 1 %}
                    <h3 class="text-primary">{{ ml._ml_system('main_staff', 'BAN CHỦ NHIỆM') }}</h3>
                    <div class="separator-2"></div>
                    <div class="row grid-space-10">
                        {% for staff in deanStaffs %}
                        <div class="col-md-4">
                            <div class="team-member image-box style-2 dark-bg text-center">
                                <div class="overlay-container overlay-visible">
                                    <img src="{{ helper.getLinkImage(staff.featured_image,'/assets/frontend/images/team-member-1.jpg') }}" alt="{{ staff.title }}" width="100%">
                                </div>
                                <div class="body">
                                    <h5 class="margin-clear text-uppercase"><a href="{{ staffModel.getUrl(staff) }}" title="{{ staff.title }}">{{ staff.title }}</a></h5>
                                    <small class="text-uppercase">{{ helper.getDean(staff.dean) }}</small>
                                    <div class="separator mt-10"></div>
                                    {% if staff.email %}
                                    <a href="mailto:{{ staff.email }}" class="margin-clear btn btn-md-link link-light"><i class="pr-10 fa fa-envelope-o"></i>{{ staff.email }}</a>
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                    <br>
                    <br>

                    {% set dept_o_id = 0 %}
                    {% for key, staff in otherStaffs %}
                        {% if dept_o_id != staff.dept_id %}
                            <h3 class="text-primary text-uppercase">{{ ml._ml_system('subject', 'Bộ môn') }} <?= Departments::getTitleById($staff->dept_id, $lang_id) ?></h3>
                            <div class="separator-2"></div>
                            <div class="w-100">
                        {% endif %}
                            <div class="image-box team-member style-3-b">
                                <div class="row">
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <div class="overlay-container overlay-visible">
                                            <img src="{{ helper.getLinkImage(staff.featured_image,'/assets/frontend/images/team-member-1.jpg') }}" alt="{{staff.title}}" width="100%">
                                        </div>
                                    </div>
                                    <div class="col-md-9 p-sm-0">
                                        <div class="body mt-3">
                                            <h5 class="title margin-clear"><a href="{{ staffModel.getUrl(staff) }}" title="{{ staff.title }}">{{ staff.title }}</a></h5>
                                            <div class="separator-2 mt-2"></div>
                                            <h5 class="m-0 text-uppercase">{{ helper.getPosition(staff.dept_position) }}</h5>
                                            {% if staff.email %}
                                            <a href="mailto:{{staff.email}}" class="btn btn-link pl-0 text-left"><i class="pr-10 margin-clear fa fa-envelope-o"></i>{{staff.email}}</a>
                                            {% endif %}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% if dept_o_id != staff.dept_id %}
                            {% set dept_o_id = staff.dept_id %}
                            </div>
                        {% endif %}
                    {% endfor %}
                {% else %}

                {% endif %}
            </div>
            <div class="col-md-3">
                {{ partial('sidebar') }}
            </div>
        </div>
    </div>
</section>