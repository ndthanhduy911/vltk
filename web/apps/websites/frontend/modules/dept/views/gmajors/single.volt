<div class="breadcrumb-container">
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home pr-2"></i><a class="link-dark" href="<?= WEB_URL ?>/{{ dept.id != 1? dept.slug : '' }}">{{ ml._ml('home', 'Trang chủ') }}</a></li>
            <li class="breadcrumb-item"><a class="link-dark" href="<?= WEB_URL ?>/{{ dept.id != 1? dept.slug : '' }}nhom-nganh-hoc">{{ ml._ml('home', 'Ngành học') }}</a></li>
            <li class="breadcrumb-item active">{{title}}</li>
        </ol>
    </div>
</div>
<div class="banner dark-translucent-bg fixed-bg" style="background-image:url('<?= WEB_URL ?>/assets/frontend/images/banner-page.jpg'); background-position: 50% 27%;">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title"><span class="text-white text-uppercase">{{title}}</span></h2>
                {% if gmajorslang.excerpt %}
                <div class="separator mt-10">
                </div>
                <p class="text-center">{{ gmajorslang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<section class="main-container pv-45">
    <div class="container">
        <div class="row">
            <div class="col-md-12 main">
                <div class="row mb-5 justify-content-center">
                    {% for key,major in majors %}
                    <a href="<?= \Majors::getUrl($dept,$major) ?>" class="btn btn-default-transparent radius-50 ml-2 mr-2">{{major.title}}</a>
                    {% endfor %}
                </div>
                <div class="slick-carousel carousel-3">
                    {% for key,major in majors %}
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

