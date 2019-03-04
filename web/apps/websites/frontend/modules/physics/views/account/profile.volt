<div class="container-fluid">
    <div class="w-100">
        <div class="card">
            <div class="card-header card-header-icon" data-background-color="red">
                <i class="material-icons">person</i>
            </div>
            <div class="title-brand m-t-100 m-b-100">
                <div class="profile-section text-center">
                    <label for="avatar">
                        <div class="profile-img">
                            <?php $avatar = $this->session->get('avatar'); ?>
                            <?php $user_id = $this->session->get('user_id'); ?>
                            <img style="width: 100px" src="/files/avatar/{{avatar?avatar:'hnn-avatar.png'}}">
                            <input class="hidden" data-id="{{user_id}}" id="avatar" name="avatar" type="file">
                        </div>
                        <span class="btn btn-primary btn-sm" style="cursor: pointer;">Đổi ảnh đại diện</span>
                    </label>
                    <h3>{{client.name}}</h3>
                    <p class="text-primary profile-job">{{department.name}}</p>
                    <a href="#" class="btn btn-primary btn-md btn-round btn-support" data-toggle="modal" data-target="#updateProfile">Cập
                        nhật</a>
                    <a href="#" class="btn btn-primary btn-md btn-round btn-support" data-toggle="modal" data-target="#changePassword">Đổi
                        mật khẩu</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updateProfile" tabindex="-1" role="dialog" aria-labelledby="updateProfileLabel" aria-hidden="true"
    novalidate>
    <div class="modal-dialog modal-lg m-t-50">
        <div class="modal-content pull-left">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                <h5 class="modal-title text-uppercase" id="updateProfileLabel">Cập nhật tài khoản</h5>
            </div>
            <div class="modal-body">
                <form id="updateProfileForm" action="/account/edit/{{client.id}}" class="contact-form" method="POST">
                    <div class="row">
                        <div class="col-md-6 m-t-15">
                            {{ form.label('name') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </span>
                                {{ form.render('name') }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-6 m-t-15">
                            {{ form.label('email') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-envelope"></i>
                                </span>
                                {{ form.render('email') }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-6 m-t-15">
                            {{ form.label('phone') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-phone"></i>
                                </span>
                                {{ form.render('phone') }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-6 m-t-15">
                            {{ form.label('department_id') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-building"></i>
                                </span>
                                {{ form.render('department_id',['id' : 'dept_id']) }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-6 m-t-15">
                            {{ form.label('address') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-address-book-o"></i>
                                </span>
                                {{ form.render('address') }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-6 m-t-15">
                            {{ form.label('status') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-check-square-o" aria-hidden="true"></i>
                                </span>
                                {{ form.render('status') }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center m-t-15">
                            <button type="submit" class="btn btn-primary btn-md">Cập nhật</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="changePasswordLabel"
    aria-hidden="true" novalidate>
    <div class="modal-dialog modal-md m-t-70">
        <div class="modal-content pull-left">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                <h5 class="modal-title text-uppercase" id="changePasswordLabel">Đổi mật khẩu</h5>
            </div>
            <div class="modal-body">
                <form id="changePasswordForm" action="/account/changepassword/{{client.id}}" class="contact-form"
                    method="POST">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="passwordOld">Mật khẩu hiện tại
                                <strong class="text-danger">*</strong>
                            </label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input type="password" id="passwordOld" name="passwordOld" class="form-control"
                                    placeholder="Nhập mật khẩu" required="1" maxlength="150" data-required-error="Vui lòng nhập mật khẩu của bạn."
                                    data-error="Chưa đúng định dạng.">
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-12 m-t-15">
                            <label for="password">Mật khẩu
                                <strong class="text-danger">*</strong>
                            </label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu"
                                    required="1" maxlength="150" data-required-error="Vui lòng nhập mật khẩu của bạn."
                                    data-error="Chưa đúng định dạng.">
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="col-md-12 m-t-15">
                            {{ form.label('confrim_password') }}
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                                {{ form.render('confrim_password') }}
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center mt-2">
                            <button type="submit" class="btn btn-primary btn-md">Thay đổi</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>