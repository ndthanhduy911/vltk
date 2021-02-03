{{ partial('breadcrumb') }}
<div class="banner dark-translucent-bg fixed-bg"
    style="background-image:url('<?= WEB_URL ?>/img/banner-page.jpg'); background-position: 50% 27%;">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title"><span class="text-white text-uppercase">{{title}}</span></h2>
            </div>
        </div>
    </div>
</div>

<section class="main-container pv-45 bg-light">
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
                <ul class="nav nav-tabs style-1" role="tablist">
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
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="contentTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('general-introduction', 'Giới thiệu chung') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.content }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="stdoutTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('graduation-standard', 'Chuẩn đầu ra') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.stdout }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="curriculumTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('curriculum', 'Khung chương trình đào tạo') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.curriculum }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="prospectsTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('career-prospects', 'Triển vọng nghề nghiệp') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.prospects }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="feeTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('tuition-fees-scholarships-and-environment', 'Học phí, học bổng và môi trường học') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.fee }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="researchesTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('applied-research', 'Nghiên cứu ứng dụng') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.researches }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="studentsTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('student-activities', 'Hoạt động sinh viên') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.students }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="alumniTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('typical-students-and-alumni', 'Sinh viên và cựu sinh viên tiêu biểu') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.alumni }}</article>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="rpartnersTab" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="header-title mb-0 text-default">{{ ml._ml('reviews-of-the-employer', 'Đánh giá của nhà tuyển dụng') }}</h3>
                            </div>
                            <div class="card-body">
                                <article>{{ itemslang.rpartners }}</article>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>