<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">THIÊT LẬP CHUNG</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Thiết lập chung</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row p-5">
        <ul class="nav nav-tabs profile-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#loginTab" role="tab">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#headerTab" role="tab">Đầu trang</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#footerTab" role="tab">Cuối trang</a>
            </li>
        </ul>
        <div class="tab-content col-md-12">
            <div class="tab-pane fade show active" id="loginTab" role="tabpanel" aria-labelledby="login-tab">
                <form action="/adcp/setting/edit" id="frmLoginSetting" method="post" data-toggle="validator" role="form">
                    <div class="col-md-12 mt-3">
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                {{ setingLogin.label('login_title') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ setingLogin.render('login_title') }}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-danger">Cập nhật</button>
                    </div>
                </form>
            </div>
            <div class="tab-pane fade" id="headerTab" role="tabpanel" aria-labelledby="header-tab">
            </div>
            <div class="tab-pane fade" id="footerTab" role="tabpanel" aria-labelledby="footer-tab">

            </div>
        </div>
    </div>
    <!-- End PAge Content -->
</div>