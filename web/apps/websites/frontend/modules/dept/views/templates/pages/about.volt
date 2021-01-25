{{ partial('breadcrumb') }}
<div class="banner dark-translucent-bg fixed-bg"
    style="background-image:url('<?php echo WEB_URL ?>/assets/frontend/images/banner-page.jpg'); background-position: 50% 27%;">

    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title"><span class="text-white text-uppercase">{{ title }}</span></h2>
                {% if pageslang.excerpt %}
                <div class="separator mt-10">
                </div>
                <p class="text-center">{{ pageslang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>
<section class="main-container">
    <div class="container">
        <div class="row">
            <div class="main col-12">
                <h3 class="title">{{ ml._ml('about', 'Giới thiệu') }} <strong class="text-primary">{{ deptlang.name }}</strong></h3>
                <div class="separator-2"></div>
                <div class="row">
                    <div class="col-lg-12">
                        {{ pageslang.content }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>