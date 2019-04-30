<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> TÀI KHOẢN</h1>
            <p><?php echo $user->id ? 'Cập nhật tài khoản': 'Thêm tài khoản mới' ?></p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Tài khoản</li>
            <li class="breadcrumb-item"><?= $title ?></li>
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
                                    <?= $form->render('name') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Đơn vị </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-building"></div>
                                    </div>
                                    <?= $form->render('dept_id') ?>
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
                                    <?php if((int)$user->id === 1) {
                                        echo $form->render('username',['disabled' => true]);
                                    }else{
                                        echo $form->render('username');
                                    } ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">E-mail</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">@</div>
                                    </div>
                                    <?= $form->render('email') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Số điện thoại</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-phone"></div>
                                    </div>
                                    <?= $form->render('phone') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Quền</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-user-o"></div>
                                    </div>
                                    <?php if((int)$user->id === 1) {
                                        echo $form->render('role',['disabled' => true]);
                                    }else{
                                        echo $form->render('role');
                                    } ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <?php if(!$user->id): ?>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Mật khẩu</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-lock"></div>
                                    </div>
                                    <?= $form->render('password') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Xác nhận mật khẩu</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-lock"></div>
                                    </div>
                                    <?= $form->render('confirm_password') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <?php endif ?>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Trạng thái</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-check-circle"></div>
                                    </div>
                                    <?php if((int)$user->id === 1) {
                                        echo $form->render('status',['disabled' => true]);
                                    }else{
                                        echo $form->render('status');
                                    } ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
                            value="<?php echo $this->security->getToken() ?>" />
                        <div class="col-md-12 text-center">
                            <button type="submit"
                                class="btn btn-success"><?= $title ?></button>
                            <a href="<?php echo BACKEND_URL.'/users' ?>" class="btn btn-secondary">Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php if($user->id): ?>
    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <h4 class="font-weight-normal">Thay đổi mật khẩu</h4>
                <div class="tile-body">
                    <form action="/admin/users/changepw/<?= $user->id ?>" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
                        <div class="form-row">
                            <div class="form-group col-md-6 ml-auto mr-auto">
                                <label class="control-label">Mật khẩu mới</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-lock"></div>
                                    </div>
                                    <input type="password" id="password" name="password"
                                        value=""
                                        class="form-control" placeholder="Mật khẩu mới" required
                                        data-required-error="Vui lòng điền đầy đủ thông tin" maxlength="100" minlength="6"
                                        data-min-error="Mật khẩu không đúng quy định">
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6 ml-auto mr-auto">
                                <label class="control-label">Xác nhận mật khẩu</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-lock"></div>
                                    </div>
                                    <?= $form->render('confirm_password') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
                            value="<?php echo $this->security->getToken() ?>" />
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-success">Thay đổi</button>
                            <a href="<?php echo BACKEND_URL.'/users' ?>" class="btn btn-secondary">Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php endif ?>
</main>