<?php $socials = \Socials::find(["status = 1 AND deptid = $dept->id", "order" => "sort ASC"]) ?>
<div class="banner dark-translucent-bg fixed-bg"
    style="background-image:url('<?php echo WEB_URL ?>/assets/frontend/images/page-about-banner-1.jpg'); background-position: 50% 27%;">
    {{ partial('breadcrumb') }}
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h1 class="page-title text-center">{{ title }}</h1>
                {% if page_lang.excerpt %}
                <div class="separator object-non-visible mt-10" data-animation-effect="fadeIn" data-effect-delay="100">
                </div>
                <p class="text-center object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">{{ page_lang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<section class="main-container">
    <div class="container">
        <div class="row">
            <div class="main col-12">
                <h3 class="title">{{ ml._ml_system('contact', 'Liên hệ') }}</h3>
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