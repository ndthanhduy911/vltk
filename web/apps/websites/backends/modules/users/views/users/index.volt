<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> TÀI KHOẢN</h1>
            <p>Quản lý tài khoản</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backenduri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">Tài khoản</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="col-12 p-0 mb-2">
                    <a id="addUser" href="{{ config.application.backendUri }}/users/update" title="Tạo" class="btn btn-success fa fa-plus pull-right"></a>
                </div>
                <div class="tile-body">
                    <table id="users" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="align-middle text-center text-white" style="width: 10px">#</th>
                                <th class="align-middle text-center text-white" style="width: 100px">Họ và tên</th>
                                <th class="align-middle text-center text-white">Ảnh đại diện</th>
                                <th class="align-middle text-center text-white">Tên đăng nhập</th>
                                <th class="align-middle text-center text-white">E-mail</th>
                                <th class="align-middle text-center text-white">Số điện thoại</th>
                                <th class="align-middle text-center text-white">Bộ môn</th>
                                <th class="align-middle text-center text-white">Phân quyền</th>
                                <th class="align-middle text-center text-white">Trạng thái</th>
                                <th class="align-middle text-center text-white">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<div class="modal" id="modalUser">
    <div class="modal-dialog" role="document" style="min-width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <form id="frmUser" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
                <div class="modal-body">
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
                            <label class="control-label">Bộ môn </label>
                            <div class="input-group d-flex">
                                {{form.render('dept_id')}}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
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
                </div>
                <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                <div class="modal-footer">
                    <button id="btnSummitUser" type="submit" class="btn btn-success">Thêm mới</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>