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
                <h2 class="title"><span class="text-white text-uppercase">{{ pageslang.title }}</span></h2>
                {% if pageslang.excerpt %}
                <div class="separator mt-10">
                </div>
                <p class="text-center">{{ pageslang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>
<!-- banner end -->

<section class="main-container pt-5">
    <div class="container">
        <div class="row">
            <div class="main col-md-9">
                <article>
                    {{ pageslang.content }}
                </article>
            </div>

            <div class="col-md-3">
                {{ partial('sidebar') }}
            </div>
        </div>
    </div>
</section>