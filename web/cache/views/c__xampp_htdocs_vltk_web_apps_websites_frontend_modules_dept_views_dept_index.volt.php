<!-- banner start -->
<!-- ================ -->
<div class="banner clearfix">
    <!-- slideshow start -->
    <!-- ================ -->
    <div class="slideshow">

        <!-- slider revolution start -->
        <!-- ================ -->
        <div class="slider-revolution-5-container">
            <div id="slider-banner-fullwidth-big-height" class="slider-banner-fullwidth-big-height rev_slider"
                data-version="5.0">
                <ul class="slides">
                    <?php foreach ($banners as $key => $banner) { $location = $key%2 == 0 ? 'left' : 'right'; ?>
                    <li data-transition="random" data-slotamount="default" data-masterspeed="default"
                        data-title="<?php echo $banner->title ?>">
                        <img src="<?php echo FRONTEND_URL.$banner->image ?>" alt="<?php echo $banner->title ?>" data-bgposition="center top"
                            data-bgrepeat="no-repeat" data-bgfit="cover" class="rev-slidebg">

                        <!-- Transparent Background -->
                        <div class="tp-caption" data-x="center" data-y="center" data-start="0"
                            data-transform_idle="o:1;" data-transform_in="o:0;s:600;e:Power2.easeInOut;"
                            data-transform_out="o:0;s:600;" data-width="5000" data-height="5000" style="background-color: rgba(0, 0, 0, 0.1);">
                        </div>

                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption sfb fadeout caption-box text-left rounded"
                            style="background-color: rgba(0, 0, 0, 0.8);" data-x="<?php echo $location ?>" data-y="center"
                            data-start="600" data-whitespace="normal" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];sX:1;sY:1;o:0;s:1150;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;">
                            <h2 class="title slider-title"><?php echo $banner->title ?></h2>
                            <div class="separator-2 clearfix"></div>
                            <p class="slider-content"><?php echo $banner->description ?></p>
                            <div class="text-right"><a class="btn btn-small btn-default margin-clear" href="<?php echo $banner->button_link ?>"><?php echo $banner->button_text ? $banner->button_text : 'Chi tiết' ?></a></div>
                        </div>

                    </li>
                    <?php } ?>
                </ul>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
        <!-- slider revolution end -->

    </div>
    <!-- slideshow end -->
</div>
<!-- banner end -->

<div id="page-start"></div>

<!-- section start thông báo-->
<!-- ================ -->
<section id="section1" class="section clearfix pt-5">
    <div class="container mt-4">
        <div class="row">
            <div class="col-lg-4">
                <h3><span class="text-default">Tin Giáo Vụ</span></h3>
                <div class="separator-2"></div>
                <div class="block">
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/defaut_img.png"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Đăng ký thi chứng chỉ VNU-EPT</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25am</div>
                        </div>
                    </div>
                    <hr>
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/medical-blog-thumb-2.jpg"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Đăng ký thi chứng chỉ VNU-EPT</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/medical-blog-thumb-3.jpg"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Đăng ký thi chứng chỉ VNU-EPT</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <footer class="clearfix">
                        <div class="link pull-right small"><i class="fa fa-link pr-1"></i><a href="#">Xem thêm</a></div>
                    </footer>
                </div>
            </div>
            <div class="col-lg-4">
                <h3><span class="text-default">Tin NCKH - Seminar</span></h3>
                <div class="separator-2"></div>
                <div class="block">
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/defaut_img.png"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Mời tham dự Hội nghị</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/medical-blog-thumb-2.jpg"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Mời tham dự Hội nghị</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/medical-blog-thumb-3.jpg"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Mời tham dự Hội nghị</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <footer class="clearfix">
                        <div class="link pull-right small"><i class="fa fa-link pr-1"></i><a href="#">Xem thêm</a></div>
                    </footer>
                </div>
            </div>
            <div class="col-lg-4">
                <h3><span class="text-default">Thông Báo Tuyển Dụng</span></h3>
                <div class="separator-2"></div>
                <div class="block">
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/defaut_img.png"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html"> Công ty New-Ocean thông báo tuyển
                                    dụng</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/medical-blog-thumb-2.jpg"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Công ty New-Ocean thông báo tuyển
                                    dụng</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <div class="media margin-clear">
                        <div class="overlay-container rounded">
                            <img class="media-object" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/medical-blog-thumb-3.jpg"
                                alt="blog-thumb">
                            <a href="blog-post.html" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading"><a href="blog-post.html">Công ty New-Ocean thông báo tuyển
                                    dụng</a></h5>
                            <div class="small"><i class="fa fa-calendar pr-10"></i>Oct 23, 2017 <i
                                    class="fa fa-clock-o pl-10 pr-10"></i>10:25
                                am</div>
                        </div>
                    </div>
                    <hr>
                    <footer class="clearfix">
                        <div class="link pull-right small"><i class="fa fa-link pr-1"></i><a href="#">Xem thêm</a></div>
                    </footer>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- section end thông báo-->

<!-- section start các bộ môn-->
<!-- ================ -->
<section class="pt-5 pb-5 section dark-translucent-bg fixed-bg"
    style="background-position: 50% 42%; background-image: url(./assets/frontend/images/education-4.jpg)">
    <div class="container mt-4">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center">
                <h2 class="page-title text-center"><strong>HƯỚNG NGHIÊN CỨU</strong></h2>
                <div class="separator"></div>
            </div>
        </div>
    </div>
    <div class="row mb-4 mr-0 ml-0">
        <div class="col-lg-3 col-md-6 isotope-item">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Lập trình trên thiết bị di động
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Lập trình website
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Thu thập và xử lý tín hiệu
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item interior-design">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Mạng máy tính
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item architecture-plans">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Xử lý hình ảnh
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item construction-management">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Xử lý âm thanh
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item architecture-plans">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Lập trình game
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 isotope-item interior-design">
            <div class="image-box shadow-2 bordered text-center mb-20">
                <div class="overlay-container rounded overlay-visible">
                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/section-image-3.jpg" alt="">
                    <a href="#" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                    <div class="overlay-bottom hidden-xs">
                        <div class="text">
                            Internet Of Thing
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- section end các bộ môn -->

<!-- section start lãnh đạo-->
<!-- ================ -->
<section class="clearfix pt-5 pb-5">
    <div class="container">
        <div class="row justify-content-lg-center pv-20">
            <div class="col-lg-8">
                <h2 class="page-title text-center"><strong>NHÂN SỰ</strong></h2>
                <div class="separator"></div>
                <p class="lead text-center">LĐội ngũ cán bộ nhiệt quyết có kinh nghiệm giảng dạy trong và ngoài nước.
                    Phương châm giúp sinh viên nắm chắc kiến thức và ứng dụng kiến thưcd vào thực tiến công việc.</p>
            </div>
        </div>
        <div class="slick-carousel carousel-autoplay pv-20">
            <div class="col-md-3">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/education-4.jpg" alt="">
                        <a href="#" class="overlay-link" title="Jane Doe - CEO"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text">
                                <h3 class="title">PGS.TS. Huỳnh Văn Tuấn</h3>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em>Trưởng khoa <br> Trưởng bộ môn Vật Lý Tin Học</em>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/education-4.jpg" alt="">
                        <a href="#" class="overlay-link" title="Jane Doe - CEO"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text">
                                <h3 class="title">PGS.TS. Huỳnh Văn Tuấn</h3>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em>Trưởng khoa <br> Trưởng bộ môn Vật Lý Tin Học</em>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/education-4.jpg" alt="">
                        <a href="#" class="overlay-link" title="Jane Doe - CEO"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text">
                                <h3 class="title">PGS.TS. Huỳnh Văn Tuấn</h3>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em>Trưởng khoa <br> Trưởng bộ môn Vật Lý Tin Học</em>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/education-4.jpg" alt="">
                        <a href="#" class="overlay-link" title="Jane Doe - CEO"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text">
                                <h3 class="title">PGS.TS. Huỳnh Văn Tuấn</h3>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em>Trưởng khoa <br> Trưởng bộ môn Vật Lý Tin Học</em>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/education-4.jpg" alt="">
                        <a href="#" class="overlay-link" title="Jane Doe - CEO"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text">
                                <h3 class="title">PGS.TS. Huỳnh Văn Tuấn</h3>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em>Trưởng khoa <br> Trưởng bộ môn Vật Lý Tin Học</em>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- section end lãnh đạo-->

<!-- section start liên kết-->
<!-- ================ -->
<section class="pt-5 pb-5 section background-img-1 dark-translucent-bg fixed-bg" style="background-position: 50% 42%;">
    <div class="container pv-20">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <h2 class="text-center"> <strong>Liên kết</strong></h2>
                <div class="separator"></div>
                <p class="large text-center">Cán bộ Khoa Vật lý từ lâu đã tham gia hợp tác giảng dạy nghiên cứu ở nhiều
                    nơi. Các giảng viên tham gia thỉnh giảng trong và ngoài nước: ĐH Sư phạm TPHCM, ĐH Sài Gòn, ĐH Tôn
                    Đức Thắng, ĐH Cần Thơ, ĐH Đà Lạt. Ngược lại các cán bộ từ các trường khác tới Khoa tham gia các hội
                    đồng, đồng hướng dẫn luận văn.</p>
            </div>
        </div>
    </div>
    <div class="col-md-12 pv-20">
        <div class="slick-carousel carousel-5">
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="100">
                    <span class="icon large circle"><img class="rounded-circle" alt="beauty"
                            src="<?php echo FRONTEND_URL ?>/assets/frontend/images/beauty-1.jpg"></span>
                    <h3>Logo liên kết 1</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="200">
                    <span class="icon large circle"><img class="rounded-circle" alt="beauty"
                            src="<?php echo FRONTEND_URL ?>/assets/frontend/images/beauty-2.jpg"></span>
                    <h3>Logo liên kết 1</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="300">
                    <span class="icon large circle"><img class="rounded-circle" alt="beauty"
                            src="<?php echo FRONTEND_URL ?>/assets/frontend/images/beauty-3.jpg"></span>
                    <h3>Logo liên kết 1</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="100">
                    <span class="icon large circle"><img class="rounded-circle" alt="beauty"
                            src="<?php echo FRONTEND_URL ?>/assets/frontend/images/beauty-4.jpg"></span>
                    <h3>Logo liên kết 1</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="200">
                    <span class="icon large circle"><img class="rounded-circle" alt="beauty"
                            src="<?php echo FRONTEND_URL ?>/assets/frontend/images/beauty-5.jpg"></span>
                    <h3>Logo liên kết 1</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="300">
                    <span class="icon large circle"><img class="rounded-circle" alt="beauty"
                            src="<?php echo FRONTEND_URL ?>/assets/frontend/images/beauty-6.jpg"></span>
                    <h3>Logo liên kết 1</h3>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- section end liên kết-->

<section id="section-5" class="section pv-40 stats padding-bottom-clear hovered">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="text-center">Liên hệ</h2>
                <div class="separator"></div>
                <p class="lead text-center">It would be great to hear from you! Just drop us a line and ask for anything
                    with which you think we could be helpful. We are looking forward to hearing from you!</p>
                <ul class="list-inline mb-20 text-center">
                    <li class="list-inline-item"><i class="text-default fa fa-map-marker pr-1"></i>Street Address No,
                        City</li>
                    <li class="list-inline-item"><a href="#" class="link-dark"><i
                                class="text-default fa fa-phone pl-10 pr-1"></i>+00 1234567890</a></li>
                    <li class="list-inline-item"><a href="#" class="link-dark"><i
                                class="text-default fa fa-envelope-o pl-10 pr-1"></i>example@your_domain.com</a></li>
                </ul>
                <div class="separator"></div>
                <ul class="social-links circle animated-effect-1 margin-clear text-center space-bottom">
                    <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li class="googleplus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li class="xing"><a href="#"><i class="fa fa-xing"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>