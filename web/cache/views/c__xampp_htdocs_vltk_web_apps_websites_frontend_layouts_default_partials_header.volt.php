<?php 
    use Models\Pages;
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
                                <li class="list-inline-item"><a class="link-light mr-1 " href="<?php echo FRONTEND_URL.'/'.$pages[12]->slug ?>"><i
                                            class="fa fa-users pr-1"></i><?php echo $pages[12]->title ?></a></li>
                                <li class="list-inline-item"><a class="link-light mr-1 " href="<?php echo FRONTEND_URL.'/'.$pages[13]->slug ?>"><i
                                            class="fa fa-user pr-1"></i><?php echo $pages[13]->title ?></a></li>
                                <li class="list-inline-item"><a class="link-light mr-1 " href="<?php echo FRONTEND_URL.'/'.$pages[14]->slug ?>"><i
                                            class="fa fa-child pr-1"></i><?php echo $pages[14]->title ?></a></li>
                                <li class="list-inline-item hidden-md-down"><a class="link-light mr-1" href="<?php echo FRONTEND_URL.'/'.$pages[15]->slug ?>"><i
                                            class="fa fa-flask pr-1"></i><?php echo $pages[15]->title ?></a></li>
                                <li class="list-inline-item hidden-md-down"><a class="link-light mr-1" href="<?php echo FRONTEND_URL.'/'.$pages[7]->slug ?>"><i
                                            class="fa fa-info-circle pr-1"></i><?php echo $pages[7]->title ?></a></li>
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
                                                <?php foreach ($pages as $key => $page) { ?>
                                                    <?php if($key <= 6): ?>
                                                        <li><a href="<?php echo FRONTEND_URL.'/'.$page->slug ?>"><?php echo $page->title ?></a></li>
                                                    <?php endif ?>
                                                <?php } ?>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end trang chủ-->
                                        <!-- mega-menu start Giới thiệu-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="fifth-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Bộ
                                                môn</a>
                                            <ul class="dropdown-menu" aria-labelledby="fifth-dropdown">
                                                <?php foreach ($depts as $key => $dept) { ?>
                                                    <?php if($key !== 0): ?>
                                                        <li><a href="<?php echo FRONTEND_URL.'/dept/'.$dept->slug ?>"><?php echo $dept->name ?></a></li>
                                                    <?php endif ?>
                                                <?php } ?>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end giới thiệu-->

                                        <!-- mega-menu start Tuyển sinh-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="third-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Bản
                                                tin khoa</a>
                                            <ul class="dropdown-menu" aria-labelledby="third-dropdown">
                                                <?php foreach ($cats as $key => $cat) { ?>
                                                    <?php if($key !== 0): ?>
                                                        <li><a href="<?php echo FRONTEND_URL.'/category/'.$cat->slug ?>"><?php echo $cat->name ?></a></li>
                                                    <?php endif ?>
                                                <?php } ?>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end tuyển sinh-->

                                        <!-- mega-menu start Đào tạo-->

                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="fourth-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Đào
                                                tạo</a>
                                            <ul class="dropdown-menu" aria-labelledby="fourth-dropdown">
                                                <li><a href="<?php echo FRONTEND_URL.'/'.$pages[8]->slug ?>"><?php echo $pages[8]->title ?></a></li>
                                                <li><a href="<?php echo FRONTEND_URL.'/'.$pages[9]->slug ?>"><?php echo $pages[9]->title ?></a></li>
                                            </ul>
                                        </li>
                                        <!-- mega-menu end đào tạo-->

                                        <!-- mega-menu start nghiên cứu-->
                                        <li class="nav-item dropdown ">
                                            <a href="#" class="nav-link dropdown-toggle" id="sixth-dropdown"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tuyển
                                                sinh</a>
                                            <ul class="dropdown-menu" aria-labelledby="fourth-dropdown">
                                                <li><a href="<?php echo FRONTEND_URL.'/'.$pages[10]->slug ?>"><?php echo $pages[10]->title ?></a></li>
                                                <li><a href="<?php echo FRONTEND_URL.'/'.$pages[11]->slug ?>"><?php echo $pages[11]->title ?></a></li>
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