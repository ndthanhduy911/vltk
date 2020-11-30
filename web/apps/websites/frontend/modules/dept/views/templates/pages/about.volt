<!-- banner start -->
<!-- ================ -->
<div class="banner dark-translucent-bg fixed-bg"
    style="background-image:url('<?php echo WEB_URL ?>/assets/frontend/images/page-about-banner-1.jpg'); background-position: 50% 27%;">
    <!-- breadcrumb start -->
    <!-- ================ -->
    {{ partial('breadcrumb') }}
    <!-- breadcrumb end -->
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><span class="text-white text-uppercase">{{ title }}</span></h2>
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

<!-- main-container start -->
<!-- ================ -->
<section class="main-container">
    <div class="container">
        <div class="row">
            <!-- main start -->
            <!-- ================ -->
            <div class="main col-12">
                <h3 class="title">{{ ml._ml_system('about', 'Giới thiệu') }} <strong class="text-primary">{{ deptlang.name }}</strong></h3>
                <div class="separator-2"></div>
                <div class="row">
                    <div class="col-lg-12">
                        {{ page_lang.content }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>