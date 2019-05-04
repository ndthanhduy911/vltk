<?php
    use Models\Pages;
    use Models\Departments;
    use Models\Categories;
?>
<!-- header-container start -->
<div class="header-container">
    <!-- header-top start -->
    <!-- classes:  -->
    <!-- "dark": dark version of header top e.g. class="header-top dark" -->
    <!-- "colored": colored version of header top e.g. class="header-top colored" -->
    <!-- ================ -->
    <div class="header-top colored">
        <div class="container">
            <div class="row">
                <div class="col-2 col-md-5">
                    <!-- header-top-first start -->
                    <!-- ================ -->
                    <div class="header-top-first clearfix">
                        <ul class="social-links circle small clearfix hidden-sm-down">
                            <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li class="skype"><a href="#"><i class="fa fa-skype"></i></a></li>
                            <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li class="googleplus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li class="youtube"><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                            <li class="flickr"><a href="#"><i class="fa fa-flickr"></i></a></li>
                            <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                        </ul>
                        <div class="social-links hidden-md-up circle small">
                            <div class="btn-group dropdown">
                                <button id="header-top-drop-1" type="button"
                                    class="btn dropdown-toggle dropdown-toggle--no-caret" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false"><i class="fa fa-share-alt"></i></button>
                                <ul class="dropdown-menu dropdown-animation" aria-labelledby="header-top-drop-1">
                                    <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li class="skype"><a href="#"><i class="fa fa-skype"></i></a></li>
                                    <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li class="googleplus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li class="youtube"><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                                    <li class="flickr"><a href="#"><i class="fa fa-flickr"></i></a></li>
                                    <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- header-top-first end -->
                </div>
                <div class="col-10 col-md-7">

                    <!-- header-top-second start -->
                    <!-- ================ -->
                    <div id="header-top-second" class="clearfix text-right">
                        <nav>
                            <ul class="list-inline">
                                <li class="list-inline-item"><a class="link-light mr-1 " href="#"><i
                                            class="fa fa-users pr-1"></i>Cựu SV</a></li>
                                <li class="list-inline-item"><a class="link-light mr-1 " href="#"><i
                                            class="fa fa-user pr-1"></i>NV/CB</a></li>
                                <li class="list-inline-item"><a class="link-light mr-1 " href="#"><i
                                            class="fa fa-child pr-1"></i>Sinh viên</a></li>
                                <li class="list-inline-item hidden-md-down"><a class="link-light mr-1" href="#"><i
                                            class="fa fa-flask pr-1"></i>Nghiên cứu</a></li>
                                <li class="list-inline-item hidden-md-down"><a class="link-light mr-1" href="#"><i
                                            class="fa fa-info-circle pr-1"></i>Thông tin</a></li>
                                <li class="list-inline-item hidden-md-down"><strong class="pl-1">Tel:</strong>
                                    +12 123 123 123
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- header-top-second end -->
                </div>
            </div>
        </div>
    </div>
    <!-- header-top end -->

    <!-- header start -->
    <!-- classes:  -->
    <!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
    <!-- "fixed-desktop": enables fixed navigation only for desktop devices e.g. class="header fixed fixed-desktop clearfix" -->
    <!-- "fixed-all": enables fixed navigation only for all devices desktop and mobile e.g. class="header fixed fixed-desktop clearfix" -->
    <!-- "dark": dark version of header e.g. class="header dark clearfix" -->
    <!-- "centered": mandatory class for the centered logo layout -->
    <!-- ================ -->
    <header class="header fixed fixed-desktop clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-auto hidden-md-down pl-3">
                    <!-- header-first start -->
                    <!-- ================ -->
                    <div class="header-first clearfix">

                        <!-- logo -->
                        <div id="logo" class="logo">
                            <a href="<?php echo FRONTEND_URL ?>/">
                                <h3 class="title text-default mb-0">VL-VLKT</h3>
                                <!-- <img id="logo_img" src="<?php echo FRONTEND_URL ?>/assets/frontend/images/logo-khoa-single-1-96x96.png" alt="VL-VLKT"> -->
                            </a>
                        </div>

                        <!-- name-and-slogan -->
                        <div class="site-slogan logo-font">
                            Khoa Vật Lý - Vật Lý Kỹ Thuật
                        </div>

                    </div>
                    <!-- header-first end -->

                </div>
                <div class="col-lg-8 ml-lg-auto">

                    <!-- header-second start -->
                    <!-- ================ -->
                    <div class="header-second clearfix">

                        <!-- main-navigation start -->
                        <!-- classes: -->
                        <!-- "onclick": Makes the dropdowns open on click, this the default bootstrap behavior e.g. class="main-navigation onclick" -->
                        <!-- "animated": Enables animations on dropdowns opening e.g. class="main-navigation animated" -->
                        <!-- ================ -->
                        <div class="main-navigation main-navigation--mega-menu  animated">
                            <nav class="navbar navbar-expand-lg navbar-light p-0">
                                <div class="navbar-brand clearfix hidden-lg-up">

                                    <!-- logo -->
                                    <div id="logo-mobile" class="logo">
                                        <!-- <a href="<?php echo FRONTEND_URL ?>/"><img id="logo-img-mobile"
                                                src="<?php echo FRONTEND_URL ?>/assets/frontend/images/logo-khoa-single-1-96x96.png"
                                                alt="VL-VLKT"></a> -->
                                        <h3 class="title text-default mb-0">VL-VLKT</h3>
                                    </div>

                                    <!-- name-and-slogan -->
                                    <div class="site-slogan logo-font">
                                        Khoa Vật Lý - Vật Lý Kỹ Thuật
                                    </div>

                                </div>

                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbar-collapse-1" aria-controls="navbar-collapse-1"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <!-- main-menu -->
                                    <ul class="navbar-nav ml-xl-auto">

                                        <!-- mega-menu start trang chủ-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="third-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Trang
                                                chủ</a>
                                            <ul class="dropdown-menu" aria-labelledby="third-dropdown">
                                                <?php $page_1 = Pages::findFirst(["id = 1 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_1 ? FRONTEND_URL.'/'.$page_1->slug : null ?>"><?php echo $page_1 ? $page_1->title : null ?></a></li>
                                                <?php $page_2 = Pages::findFirst(["id = 2 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_2 ? FRONTEND_URL.'/'.$page_2->slug : null ?>"><?php echo $page_2 ? $page_2->title : null ?></a></li>
                                                <?php $page_3 = Pages::findFirst(["id = 3 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_3 ? FRONTEND_URL.'/'.$page_3->slug : null ?>"><?php echo $page_3 ? $page_3->title : null ?></a></li>
                                                <?php $page_4 = Pages::findFirst(["id = 4 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_4 ? FRONTEND_URL.'/'.$page_4->slug : null ?>"><?php echo $page_4 ? $page_4->title : null ?></a></li>
                                                <?php $page_5 = Pages::findFirst(["id = 5 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_5 ? FRONTEND_URL.'/'.$page_5->slug : null ?>"><?php echo $page_5 ? $page_5->title : null ?></a></li>
                                                <?php $page_6 = Pages::findFirst(["id = 6 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_6 ? FRONTEND_URL.'/'.$page_6->slug : null ?>"><?php echo $page_6 ? $page_6->title : null ?></a></li>
                                                <?php $page_7 = Pages::findFirst(["id = 7 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_7 ? FRONTEND_URL.'/'.$page_7->slug : null ?>"><?php echo $page_7 ? $page_7->title : null ?></a></li>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end trang chủ-->
                                        <!-- mega-menu start Giới thiệu-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="fifth-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Bộ
                                                môn</a>
                                            <ul class="dropdown-menu" aria-labelledby="fifth-dropdown">
                                                <?php $dept_2 = Departments::findFirst(["id = 2","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_2 ? FRONTEND_URL.'/dept/'.$dept_2->slug : null ?>"><?php echo $dept_2 ? $dept_2->name : null ?></a></li>
                                                <?php $dept_3 = Departments::findFirst(["id = 3","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_3 ? FRONTEND_URL.'/dept/'.$dept_3->slug : null ?>"><?php echo $dept_3 ? $dept_3->name : null ?></a></li>
                                                <?php $dept_4 = Departments::findFirst(["id = 4","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_4 ? FRONTEND_URL.'/dept/'.$dept_4->slug : null ?>"><?php echo $dept_4 ? $dept_4->name : null ?></a></li>
                                                <?php $dept_5 = Departments::findFirst(["id = 5","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_5 ? FRONTEND_URL.'/dept/'.$dept_5->slug : null ?>"><?php echo $dept_5 ? $dept_5->name : null ?></a></li>
                                                <?php $dept_6 = Departments::findFirst(["id = 6","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_6 ? FRONTEND_URL.'/dept/'.$dept_6->slug : null ?>"><?php echo $dept_6 ? $dept_6->name : null ?></a></li>
                                                <?php $dept_7 = Departments::findFirst(["id = 7","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_7 ? FRONTEND_URL.'/dept/'.$dept_7->slug : null ?>"><?php echo $dept_7 ? $dept_7->name : null ?></a></li>
                                                <?php $dept_8 = Departments::findFirst(["id = 8","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_8 ? FRONTEND_URL.'/dept/'.$dept_8->slug : null ?>"><?php echo $dept_8 ? $dept_8->name : null ?></a></li>
                                                <?php $dept_9 = Departments::findFirst(["id = 9","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $dept_9 ? FRONTEND_URL.'/dept/'.$dept_1->slug : null ?>"><?php echo $dept_9 ? $dept_9->name : null ?></a></li>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end giới thiệu-->

                                        <!-- mega-menu start Tuyển sinh-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="third-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Bản
                                                tin khoa</a>
                                            <ul class="dropdown-menu" aria-labelledby="third-dropdown">
                                                <?php $cat_2 = Categories::findFirst(["id = 2","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $cat_2 ? FRONTEND_URL.'/category/'.$cat_2->slug : null ?>"><?php echo $cat_2 ? $cat_2->name : null ?></a></li>
                                                <?php $cat_3 = Categories::findFirst(["id = 3","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $cat_3 ? FRONTEND_URL.'/category/'.$cat_3->slug : null ?>"><?php echo $cat_3 ? $cat_3->name : null ?></a></li>
                                                <?php $cat_4 = Categories::findFirst(["id = 4","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $cat_4 ? FRONTEND_URL.'/category/'.$cat_4->slug : null ?>"><?php echo $cat_4 ? $cat_4->name : null ?></a></li>
                                                <?php $cat_5 = Categories::findFirst(["id = 5","columns" => "slug, name"]) ?>
                                                <li><a href="<?php echo $cat_5 ? FRONTEND_URL.'/category/'.$cat_5->slug : null ?>"><?php echo $cat_5 ? $cat_5->name : null ?></a></li>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end tuyển sinh-->

                                        <!-- mega-menu start Đào tạo-->

                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="fourth-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Đào
                                                tạo</a>
                                            <ul class="dropdown-menu" aria-labelledby="fourth-dropdown">
                                                <?php $page_9 = Pages::findFirst(["id = 9 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_9 ? FRONTEND_URL.'/'.$page_9->slug : null ?>"><?php echo $page_9 ? $page_9->title : null ?></a></li>
                                                <?php $page_10 = Pages::findFirst(["id = 10 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_10 ? FRONTEND_URL.'/'.$page_10->slug : null ?>"><?php echo $page_10 ? $page_10->title : null ?></a></li>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end đào tạo-->

                                        <!-- mega-menu start nghiên cứu-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="sixth-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tuyển
                                                sinh</a>
                                            <ul class="dropdown-menu" aria-labelledby="fourth-dropdown">
                                                <?php $page_11 = Pages::findFirst(["id = 11 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_11 ? FRONTEND_URL.'/'.$page_11->slug : null ?>"><?php echo $page_11 ? $page_11->title : null ?></a></li>
                                                <?php $page_12 = Pages::findFirst(["id = 12 AND dept_id = 1","columns" => "slug, title"]) ?>
                                                <li><a href="<?php echo $page_12 ? FRONTEND_URL.'/'.$page_12->slug : null ?>"><?php echo $page_12 ? $page_12->title : null ?></a></li>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end nghiên cứu-->
                                    </ul>
                                    <!-- main-menu end -->
                                </div>
                            </nav>
                        </div>
                        <!-- main-navigation end -->
                    </div>
                    <!-- header-second end -->

                </div>
                <div class="col-auto hidden-md-down p-0">
                    <div class="header-dropdown-buttons">
                        <a href="#">
                            <img src="<?php echo FRONTEND_URL ?>/language_file/vie/vietnam.png" class="user-image"
                                alt="VIET NAM" width="36px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header end -->
</div>
<!-- header-container end -->