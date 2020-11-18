<?php
    if($dept->id == 1){
        $deanStaffs = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            's.slug',
            's.image',
            's.dean',
            's.dept_position',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.langid = $langid",'sl')
        ->where("s.status = 1 AND (s.dean = 1 OR s.dean = 2)")
        ->orderBy("s.sort ASC, s.dean ASC")
        ->limit(3)
        ->getQuery()
        ->execute();
        
        $otherStaffs = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            's.slug',
            's.image',
            's.dean',
            's.dept_position',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.langid = $langid",'sl')
        ->where("s.status = 1")
        ->inWhere("s.dept_position", [1,2])
        ->orderBy("s.deptid ASC, s.dept_position ASC, s.sort ASC")
        ->getQuery()
        ->execute();
    }else{
        $mainStaffs = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            's.slug',
            's.image',
            's.dean',
            's.dept_position',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->where("s.deleted = 0 AND s.status = 1 AND s.dept_position != 5 AND s.deptid = $dept->id")
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.langid = $langid",'sl')
        ->orderBy("s.dept_position ASC")
        ->getQuery()
        ->execute();
        
        $employStaff = $this->modelsManager->createBuilder()
        ->columns(array(
            's.id',
            's.slug',
            's.image',
            's.dean',
            's.dept_position',
            's.email',
            's.deptid',
            'sl.title title',
            'sl.content content'
        ))
        ->from(['s'=>'Staff'])
        ->where("s.deleted = 0 AND s.status = 1 AND s.dept_position = 5 AND s.deptid = $dept->id")
        ->leftJoin("StaffLang", "sl.staff_id = s.id AND sl.langid = $langid",'sl')
        ->orderBy("s.dept_position ASC")
        ->getQuery()
        ->execute();
    } 
?>

<!-- banner start -->
<!-- ================ -->
<div class="banner dark-translucent-bg fixed-bg"style="background-image:url('{{helper.getLinkImage(page.background_image, '/assets/frontend/images/page-about-banner-1.jpg') }}'); background-position: 50% 27%;">
    <!-- breadcrumb start -->
    <!-- ================ -->
    {{ partial('breadcrumb') }}
    <!-- breadcrumb end -->
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h1 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><span class="text-white text-uppercase">{{ page_lang.title }}</span></h1>
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
                        {% for key,staff in deanStaffs %}
                        <div class="w-{{ key === 1 ? '40' : '30' }} pl-1 pr-1 mt-3">
                            <div class="team-member image-box style-2 dark-bg text-center">
                                <div class="overlay-container overlay-visible">
                                    <img src="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/teams.jpg') }}" alt="{{ staff.title }}" width="100%">
                                </div>
                                <div class="body">
                                    <h5 class="margin-clear text-uppercase"><a href="<?= \Staff::getUrl($dept,$staff) ?>" title="{{ staff.title }}">{{ staff.title }}</a></h5>
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
                        {% if dept_o_id != staff.deptid %}
                            <h3 class="text-primary text-uppercase">{{ ml._ml_system('subject', 'Bộ môn') }} <?= Depts::getTitleById($staff->deptid, $langid) ?></h3>
                            <div class="separator-2"></div>
                            <div class="w-100">
                        {% endif %}
                            <div class="image-box team-member style-3-b">
                                <div class="row">
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <div class="overlay-container overlay-visible">
                                            <img src="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/teams.jpg') }}" alt="{{staff.title}}" width="100%">
                                        </div>
                                    </div>
                                    <div class="col-md-9 p-sm-0">
                                        <div class="body mt-3">
                                            <h5 class="title margin-clear"><a href="<?= \Staff::getUrl($dept, $staff) ?>" title="{{ staff.title }}">{{ staff.title }}</a></h5>
                                            <div class="separator-2 mt-2"></div>
                                            <h5 class="m-0 text-uppercase">{{ helper.getPosition(staff.dept_position) }}</h5>
                                            {% if staff.email %}
                                            <a href="mailto:{{staff.email}}" class="btn btn-link pl-0 text-left"><i class="pr-10 margin-clear fa fa-envelope-o"></i>{{staff.email}}</a>
                                            {% endif %}
                                            <div class="w-100">
                                                <a href="<?= \Staff::getUrl($dept, $staff) ?>" class="btn btn-default btn-sm btn-animated radius-50">{{ ml._ml_system('more', 'Xem thêm') }} <i class="fa fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% if dept_o_id != staff.deptid %}
                            {% set dept_o_id = staff.deptid %}
                            </div>
                        {% endif %}
                    {% endfor %}
                {% else %}
                    <h2 class="page-title">{{ ml._ml_system('main_staff', 'Cán bộ cơ hữu') }}</h2>
                    <div class="separator-2"></div>
                    {% for staff in mainStaffs %}
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3">
                                <div class="overlay-container overlay-visible">
                                <img width="100%" src="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/teams.jpg') }}" alt="{{ staff.title }}">
                                <a href="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/teams.jpg') }}" class="popup-img overlay-link" title="{{ staff.title }}"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                            <div class="col-md-9 col-lg-9">
                                <div class="body">
                                <h3 class="title margin-clear">{{ staff.title }} - <small>{{ helper.getPosition(staff.dept_position) }}</small></h3>
                                <div class="separator-2 mt-10"></div>
                                {#{ helper.getExcerpt(staff.content,0,400) }#}
                                {% if staff.email %}
                                <h4 class="title mt-3">{{ ml._ml_system('contact', 'Liên hệ') }}</h4>
                                <ul class="list-icons">
                                    <li><a href="mailto:{{ staff.email }}" class="text-info"><i class="fa fa-envelope-o pr-10"></i>{{ staff.email }}</a></li>
                                {% endif %}
                                <div class="w-100">
                                    <a href="<?= \Staff::getUrl($dept, $staff) ?>" class="btn btn-default btn-sm btn-animated radius-50">{{ ml._ml_system('more', 'Xem thêm') }} <i class="fa fa-arrow-right"></i></a>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {% endfor %}

                    <h2 class="page-title">{{ ml._ml_system('employ_staff', 'Cán bộ thỉnh giảng') }}</h2>
                    <div class="separator-2"></div>
                    {% for staff in employStaff %}
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3">
                                <div class="overlay-container overlay-visible">
                                <img width="100%" src="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/teams.jpg') }}" alt="{{ staff.title }}">
                                <a href="{{ helper.getLinkImage(staff.image,'/assets/frontend/images/teams.jpg') }}" class="popup-img overlay-link" title="{{ staff.title }}"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                            <div class="col-md-9 col-lg-9">
                                <div class="body">
                                    <h3 class="title margin-clear">{{ staff.title }}</small></h3>
                                    <div class="separator-2 mt-10"></div>
                                    {#{ helper.getExcerpt(staff.content,0,400) }#}
                                    {% if staff.email %}
                                    <h4 class="title mt-3">{{ ml._ml_system('contact', 'Liên hệ') }}</h4>
                                    <ul class="list-icons">
                                        <li><a href="mailto:{{ staff.email }}" class="text-info"><i class="fa fa-envelope-o pr-10"></i>{{ staff.email }}</a></li>
                                    </ul>
                                    {% endif %}
                                    <div class="w-100">
                                        <a href="<?= \Staff::getUrl($dept, $staff) ?>" class="btn btn-default btn-sm btn-animated radius-50">{{ ml._ml_system('more', 'Xem thêm') }} <i class="fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {% endfor %}
                {% endif %}
            </div>
            <div class="col-md-3">
                {{ partial('sidebar') }}
            </div>
        </div>
    </div>
</section>