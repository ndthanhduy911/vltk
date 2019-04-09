<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> TÀI KHOẢN</h1>
            <p>Thêm mới tài khoản</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Tài khoản</li>
            <li class="breadcrumb-item">Thêm mới</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="tile-body">
                    <form id="frmUser" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Họ và tên</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-user"></div>
                                    </div>
                                    {{form.render('name')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Đơn vị </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-building"></div>
                                    </div>
                                    {{form.render('department_id')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Tên đăng nhập</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-user"></div>
                                    </div>
                                    {{form.render('username')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">E-mail</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">@</div>
                                    </div>
                                    {{form.render('email')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Hình đại diện</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">A</div>
                                    </div>
                                    {{form.render('avatar')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Số điện thoại</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-phone"></div>
                                    </div>
                                    {{form.render('phone')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Mật khẩu</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-lock"></div>
                                    </div>
                                    {{form.render('password')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Xác nhận mật khẩu</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-lock"></div>
                                    </div>
                                    {{form.render('confirm_password')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Quền</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-user-o"></div>
                                    </div>
                                    {{form.render('role')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Trạng thái</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-check-circle"></div>
                                    </div>
                                    {{form.render('status')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <input type = "hidden" name = "<?php echo $this->security->getTokenKey() ?>" value = "<?php echo $this->security->getToken() ?>"/>  
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-success">Thêm mới</button>
                            <a href="<?php echo BACKEND_URL.'/users' ?>" class="btn btn-secondary" >Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>