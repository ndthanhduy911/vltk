<!-- banner start -->
<!-- ================ -->
<div class="banner dark-translucent-bg fixed-bg"
    style="background-image:url('<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-banner-1.jpg'); background-position: 50% 27%;">
    <!-- breadcrumb start -->
    <!-- ================ -->
    {{ partial('breadcrumb') }}
    <!-- breadcrumb end -->
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><span
                        class="text-white text-uppercase"><?php echo isset($title) ? $title : 'Mặc định'; ?></span></h2>
                <div class="separator object-non-visible mt-10" data-animation-effect="fadeIn" data-effect-delay="100">
                </div>
                <p class="text-center object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">
                    <?php echo $page->excerpt ?>
                </p>
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
                <h3 class="title">Giới thiệu <strong class="text-primary">Khoa Vật Lý - Vật Lý Kỹ Thuật</strong></h3>
                <div class="separator-2"></div>
                <div class="row">
                    <div class="col-lg-6">
                        <?php echo $page->content ?>
                    </div>
                    <div class="col-lg-6">
                        <div class="slick-carousel content-slider-with-controls">
                            <div class="overlay-container overlay-visible">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-1.jpg" alt="">
                                <div class="overlay-bottom hidden-sm-down">
                                    <div class="text">
                                        <h3 class="title">We Can Do It</h3>
                                    </div>
                                </div>
                                <a href="<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-1.jpg"
                                    class="slick-carousel--popup-img overlay-link" title="image title"><i
                                        class="fa fa-plus"></i></a>
                            </div>
                            <div class="overlay-container overlay-visible">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-2.jpg" alt="">
                                <div class="overlay-bottom hidden-sm-down">
                                    <div class="text">
                                        <h3 class="title">You Can Trust Us</h3>
                                    </div>
                                </div>
                                <a href="<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-2.jpg"
                                    class="slick-carousel--popup-img overlay-link" title="image title"><i
                                        class="fa fa-plus"></i></a>
                            </div>
                            <div class="overlay-container overlay-visible">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-3.jpg" alt="">
                                <div class="overlay-bottom hidden-sm-down">
                                    <div class="text">
                                        <h3 class="title">We Love What We Do</h3>
                                    </div>
                                </div>
                                <a href="<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-3.jpg"
                                    class="slick-carousel--popup-img overlay-link" title="image title"><i
                                        class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main end -->

        </div>
    </div>
</section>
<!-- main-container end -->

<!-- section start -->
<!-- ================ -->
<section class="pv-40 fixed-bg dark-translucent-bg hovered"
    style="background-image:url('<?php echo FRONTEND_URL ?>/assets/frontend/images/page-about-banner-1.jpg'); background-position: 50% 50%;">
    <div class="slick-carousel content-slider">
        <div>
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-lg-8">
                        <div class="testimonial text-center">
                            <div class="testimonial-image">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images//testimonial-1.jpg"
                                    alt="Jane Doe" title="Jane Doe" class="rounded-circle">
                            </div>
                            <h3 class="mt-3">Just Perfect!</h3>
                            <div class="separator"></div>
                            <div class="testimonial-body">
                                <blockquote>
                                    <p>Sed ut perspiciatis unde omnis iste natu error sit voluptatem accusan tium dolore
                                        laud antium, totam rem dolor sit amet tristique pulvinar, turpis arcu rutrum
                                        nunc, ac laoreet turpis augue a justo.</p>
                                </blockquote>
                                <div class="testimonial-info-1">- Jane Doe</div>
                                <div class="testimonial-info-2">By Company</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-lg-8">
                        <div class="testimonial text-center">
                            <div class="testimonial-image">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images//testimonial-2.jpg"
                                    alt="Jane Doe" title="Jane Doe" class="rounded-circle">
                            </div>
                            <h3 class="mt-3">Amazing!</h3>
                            <div class="separator"></div>
                            <div class="testimonial-body">
                                <blockquote>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et cupiditate deleniti
                                        ratione in. Expedita nemo, quisquam, fuga adipisci omnis ad mollitia libero
                                        culpa nostrum est quia eos esse vel!</p>
                                </blockquote>
                                <div class="testimonial-info-1">- Jane Doe</div>
                                <div class="testimonial-info-2">By Company</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- section end -->