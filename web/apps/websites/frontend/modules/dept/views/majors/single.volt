<div class="breadcrumb-container">
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home pr-2"></i><a class="link-dark"
                    href="<?= WEB_URL ?>/{{ dept.id != 1? dept.slug : '' }}">{{ ml._ml('home', 'Trang chủ') }}</a></li>
            <li class="breadcrumb-item"><a class="link-dark"
                    href="<?= WEB_URL ?>/{{ dept.id != 1? dept.slug : '' }}nhom-nganh-hoc">{{ ml._ml('home', 'Ngành học') }}</a>
            </li>
            <li class="breadcrumb-item"><a class="link-dark"
                    href="<?= \Gmajors::getUrl($dept,$gmajors) ?>">{{gtitle}}</a></li>
            <li class="breadcrumb-item active">{{title}}</li>
        </ol>
    </div>
</div>
<div class="banner dark-translucent-bg fixed-bg"
    style="background-image:url('<?= WEB_URL ?>/assets/frontend/images/banner-page.jpg'); background-position: 50% 27%;">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title"><span class="text-white text-uppercase">{{title}}</span></h2>
            </div>
        </div>
    </div>
</div>

<section class="main-container pv-45">
    <div class="container">
        <div class="row">
            <div class="col-md-12 main">
                <div class="row mb-5 justify-content-center">
                    {% for key,major in majorList %}
                    <a href="<?= \Majors::getUrl($dept,$major) ?>" class="btn btn-default-transparent radius-50 ml-2 mr-2">{{major.title}}</a>
                    {% endfor %}
                </div>
                <div class="slick-carousel carousel-3">
                    {% for key,major in majorList %}
                    <div class="image-box shadow-2 bordered text-center mb-20">
                        <div class="overlay-container rounded overlay-visible">
                            <img class="grow" src="{{helper.getLinkImage(major.image,'/assets/frontend/images/default2.jpg')}}" alt="{{major.title}}">
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    <a href="<?= \Majors::getUrl($dept,$major) ?>" title="{{major.title}}">{{major.title}}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    {% endfor %}
                </div>
            </div>
        </div>
    </div>
</section>

<section class="main-container pv-45" id="tabMajors">
    <div class="container">
        <div class="row">
            <div class="col-md-12 main">
                <div class="vertical">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" href="#contentTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-magic pr-2"></i> {{ ml._ml('general-introduction', 'Giới thiệu chung') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#stdoutTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-life-saver pr-2"></i> {{ ml._ml('graduation-standard', 'Chuẩn đầu ra') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#curriculumTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-expand pr-2"></i> {{ ml._ml('curriculum', 'Khung chương trình đào tạo') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#prospectsTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-list pr-2"></i> {{ ml._ml('career-prospects', 'Triển vọng nghề nghiệp') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#feeTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-vcard pr-2"></i> {{ ml._ml('tuition-fees-scholarships-and-environment', 'Học phí, học bổng và môi trường học') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#researchesTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-th pr-2"></i> {{ ml._ml('applied-research', 'Nghiên cứu ứng dụng') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#studentsTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-child pr-2"></i> {{ ml._ml('student-activities', 'Hoạt động sinh viên') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#alumniTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-graduation-cap pr-2"></i> {{ ml._ml('typical-students-and-alumni', 'Sinh viên và cựu sinh viên tiêu biểu') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#rpartnersTab" role="tab" data-toggle="tab"><i
                                    class="fa fa-star pr-2"></i> {{ ml._ml('reviews-of-the-employer', 'Đánh giá của nhà tuyển dụng') }}</a>
                        </li>
                    </ul>
                    <div class="tab-content w-100">
                        <div class="tab-pane fade show active" id="contentTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('general-introduction', 'Giới thiệu chung') }}</h3>
                            <article>{{ majorslang.content }}</article>
                        </div>
                        <div class="tab-pane fade" id="stdoutTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('graduation-standard', 'Chuẩn đầu ra') }}</h3>
                            <article>{{ majorslang.stdout }}</article>
                        </div>
                        <div class="tab-pane fade" id="curriculumTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('curriculum', 'Khung chương trình đào tạo') }}</h3>
                            <article>{{ majorslang.curriculum }}</article>
                        </div>
                        <div class="tab-pane fade" id="prospectsTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('career-prospects', 'Triển vọng nghề nghiệp') }}</h3>
                            <article>{{ majorslang.prospects }}</article>
                        </div>
                        <div class="tab-pane fade" id="feeTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('tuition-fees-scholarships-and-environment', 'Học phí, học bổng và môi trường học') }}</h3>
                            <article>{{ majorslang.fee }}</article>
                        </div>
                        <div class="tab-pane fade" id="researchesTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('applied-research', 'Nghiên cứu ứng dụng') }}</h3>
                            <article>{{ majorslang.researches }}</article>
                        </div>
                        <div class="tab-pane fade" id="studentsTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('student-activities', 'Hoạt động sinh viên') }}</h3>
                            <article>{{ majorslang.students }}</article>
                        </div>
                        <div class="tab-pane fade" id="alumniTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('typical-students-and-alumni', 'Sinh viên và cựu sinh viên tiêu biểu') }}</h3>
                            <article>{{ majorslang.alumni }}</article>
                        </div>
                        <div class="tab-pane fade" id="rpartnersTab" role="tabpanel">
                            <h3 class="title">{{ ml._ml('reviews-of-the-employer', 'Đánh giá của nhà tuyển dụng') }}</h3>
                            <article>{{ majorslang.rpartners }}</article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>