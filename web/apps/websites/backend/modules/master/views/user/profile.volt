<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    {% if dispatcher.getControllerName() != 'index' %}
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    {% endif %}
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile text-center">
                        <div class="text-center">
                            <?php $avatar = $this->session->get('avatar'); ?>
                            <img class="profile-user-img img-fluid img-circle"
                                src="<?= $avatar ? '/uploads/avatar/'.$avatar : '/img/avatar.png' ?>"
                                alt="{{ session.get('fullname') }}">
                        </div>
                        <h3 class="profile-username text-center">{{ session.get('fullname') }}</h3>
                        <label for="avatar">
                            <div class="profile-img hidden">
                                <input data-id="<?= $this->session->get('userid'); ?>" id="avatar" name="avatar" type="file" accept=".jpg,.png">
                            </div>
                            <span class="btn btn-hnn btn-hnn-info" style="cursor: pointer;"><span>Đổi ảnh đại
                                    diện</span></span>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row d-flex align-items-stretch">
            <form class="col-md-7 d-flex align-items-stretch" action="" id="profile_info" method="post" enctype="multipart/form-data" data-toggle="validator" role="form" novalidate="true">
                <div class="card card-primary card-outline w-100">
                    <div class="card-body box-profile">
                        <h3 class="text-primary m-0">Thông tin</h3>
                        <div class="row">
                            {% for element in form %}
                            <div class="form-group col-md-6 label-floating">
                                <div class="input-group">
                                    <label class="control-label">{{element.getLabel()}}</label>
                                    {{element.render()}}
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div>
                            {% endfor %}
                            <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}" />
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-center">
                            <button type="submit" class="btn btn-hnn btn-hnn-success"><span>Cập nhật</span></button>
                            <a href="<?= WEB_ADMIN_URL ?>/user" class="btn btn-hnn btn-hnn-default"><span>Quay lại</span></a>
                        </div>
                    </div>
                </div>
            </form>
            <form class="col-md-5 d-flex align-items-stretch" action="<?= WEB_ADMIN_URL ?>/user/changepassword" id="profile_password" method="post" enctype="multipart/form-data" data-toggle="validator" role="form" novalidate="true">
                <div class="card card-primary card-outline w-100">
                    <div class="card-body box-profile">
                        <h3 class="text-primary m-0">Đổi mật khẩu</h3>
                        <div class="row">
                            {% for element in formPW %}
                            <div class="form-group col-md-12 label-floating">
                                <div class="input-group">
                                    <label class="control-label">{{element.getLabel()}}</label>
                                    {{element.render()}}
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div>
                            {% endfor %}
                        </div>
                        <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}" />
                    </div>
                    <div class="card-footer">
                        <div class="text-center">
                            <button type="submit" class="btn btn-hnn btn-hnn-success"><span>Cập nhật</span></button>
                            <a href="<?= WEB_ADMIN_URL ?>/user" class="btn btn-hnn btn-hnn-default"><span>Quay lại</span></a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>