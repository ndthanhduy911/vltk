      <!-- header-container start -->
      <div class="header-container">
          <!-- header start -->
          <!-- classes:  -->
          <!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
          <!-- "fixed-desktop": enables fixed navigation only for desktop devices e.g. class="header fixed fixed-desktop clearfix" -->
          <!-- "fixed-all": enables fixed navigation only for all devices desktop and mobile e.g. class="header fixed fixed-desktop clearfix" -->
          <!-- "dark": dark version of header e.g. class="header dark clearfix" -->
          <!-- "centered": mandatory class for the centered logo layout -->
          <!-- ================ -->
          <header class="header dark fixed fixed-desktop clearfix">
              <div class="container">
                  <div class="row">
                      <div class="col-md-auto hidden-md-down pl-3">
                          <!-- header-first start -->
                          <!-- ================ -->
                          <div class="header-first clearfix">

                              <!-- logo -->
                              <div id="logo" class="logo">
                                  <a href="<?php echo FRONTEND_URL ?>/">
                                      <h3 class="title text-default mb-0">VLTH</h3>
                                      <!-- <img id="logo_img" src="/assets/frontend/images/logo-khoa-single-1-96x96.png" alt="VL-VLKT"> -->
                                  </a>
                              </div>

                              <!-- name-and-slogan -->
                              <div class="site-slogan logo-font">
                                  Vật Lý Tin Học
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
                                              src="/assets/frontend/images/logo-khoa-single-1-96x96.png"
                                              alt="VL-VLKT"></a> -->
                                              <h3 class="title text-default mb-0">VLTH</h3>
                                          </div>

                                          <!-- name-and-slogan -->
                                          <div class="site-slogan logo-font">
                                              Vật Lý Tin Học
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
                                                      data-toggle="dropdown" aria-haspopup="true"
                                                      aria-expanded="false">Trang chủ</a>
                                                  <ul class="dropdown-menu" aria-labelledby="third-dropdown">
                                                      <li><a href="/gioi-thieu">Giới thiệu Khoa</a></li>
                                                      <li><a href="/to-chuc-nhan-su"></i>Tổ chức - Nhân sự</a></li>
                                                      <li><a href="/hop-tac-dao-tao"></i>Hợp tác đào tạo</a></li>
                                                      <li><a href="/nghien-cuu-khoa-hoc"></i>Nghiên cứu khoa học</a>
                                                      </li>
                                                      <li><a href="/phong-thi-nghiem">Phòng thí nghiệm</a></li>
                                                      <li><a href="/san-pham-nghien-cuu">Sản phẩm nghiên cứu</a></li>
                                                      <li><a href="/doan-hoi">Đoàn hội</a></li>

                                                  </ul>
                                              </li>
                                              <!-- mega-menu end trang chủ-->
                                              <!-- mega-menu start Giới thiệu-->
                                              <li class="nav-item dropdown ">
                                                  <a href="#" class="nav-link dropdown-toggle" id="fifth-dropdown"
                                                      data-toggle="dropdown" aria-haspopup="true"
                                                      aria-expanded="false">Bộ môn</a>
                                                  <ul class="dropdown-menu" aria-labelledby="fifth-dropdown">
                                                      <li><a href="/vat-ly-tin-hoc">Vật
                                                              lý tin học</a></li>
                                                      <li><a href="/vat-ly-ly-thuyet">Vật
                                                              Lý Lý Thuyết</a></li>
                                                      <li><a href="/vat-ly-hat-nhan">Vật
                                                              Lý Hạt Nhân - KTHN</a></li>
                                                      <li><a href="/vat-ly-chat-ran">Vật
                                                              Lý Chất Rắn</a></li>
                                                      <li><a href="/vat-ly-ung-ung">Vật
                                                              Lý Ứng Dụng</a></li>
                                                      <li><a href="/vat-ly-dien-tu">Vật
                                                              Lý Điện Tử</a></li>
                                                      <li><a href="/vat-ly-dia-cau">Vật
                                                              Lý Địa Cầu</a></li>
                                                      <li><a href="/vat-ly-hai-duong">Vật
                                                              Lý Hải Dương</a></li>
                                                  </ul>
                                              </li>
                                              <!-- mega-menu end giới thiệu-->

                                              <!-- mega-menu start Tuyển sinh-->
                                              <li class="nav-item dropdown ">
                                                  <a href="#" class="nav-link dropdown-toggle" id="third-dropdown"
                                                      data-toggle="dropdown" aria-haspopup="true"
                                                      aria-expanded="false">Bản tin khoa</a>
                                                  <ul class="dropdown-menu" aria-labelledby="third-dropdown">
                                                      <li><a href="/tin-giao-vu">Tin giáo dụ</a></li>
                                                      <li><a href="/tin-nckh-serminar">Tin NCKH - Serminar</a></li>
                                                      <li><a href="/tin-cb-vc-khoa">Tin CB - VC Khoa</a></li>
                                                      <li><a href="/tin-tuyen-dung">Tin Tuyển Dụng</a></li>
                                                  </ul>
                                              </li>
                                              <!-- mega-menu end tuyển sinh-->

                                              <!-- mega-menu start Đào tạo-->

                                              <li class="nav-item dropdown ">
                                                  <a href="#" class="nav-link dropdown-toggle" id="fourth-dropdown"
                                                      data-toggle="dropdown" aria-haspopup="true"
                                                      aria-expanded="false">Đào tạo</a>
                                                  <ul class="dropdown-menu" aria-labelledby="fourth-dropdown">
                                                      <li><a href="/dao-tao-dai-hoc">Đại học</a></li>
                                                      <li><a href="/dao-tao-sau-dai-hoc">Sau đại học</a></li>
                                                  </ul>
                                              </li>
                                              <!-- mega-menu end đào tạo-->

                                              <!-- mega-menu start nghiên cứu-->
                                              <li class="nav-item dropdown ">
                                                  <a href="#" class="nav-link dropdown-toggle" id="sixth-dropdown"
                                                      data-toggle="dropdown" aria-haspopup="true"
                                                      aria-expanded="false">Tuyển sinh</a>
                                                  <ul class="dropdown-menu" aria-labelledby="fourth-dropdown">
                                                      <li><a href="/tuyen-sinh-dai-hoc">Đại học</a></li>
                                                      <li><a href="/tuyen-sinh-sau-dai-hoc">Sau đại học</a></li>
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
                                  <img src="/language_file/vie/vietnam.png" class="user-image" alt="VIET NAM"
                                      width="36px">
                              </a>
                          </div>
                      </div>
                  </div>
              </div>
          </header>
          <!-- header end -->
      </div>
      <!-- header-container end -->