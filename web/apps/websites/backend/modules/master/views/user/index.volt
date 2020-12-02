<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
            <div class="col-sm-6">
                {% if master.checkPermission('user', 'delete') %}
                <div class="btn-group float-right">
                    <a id="deleteUser" data-href="<?= WEB_ADMIN_URL ?>/user/delete" data-toggle="tooltip" title="Xóa"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span>Xóa</span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('user', 'update') %}
                <div class="btn-group float-right">
                    <a id="addUser" href="#" data-href="<?= WEB_ADMIN_URL ?>/user/update" data-toggle="tooltip" title="Tạo mới"
                        class="ml-2 btn btn-hnn btn-hnn-success"><span>Thêm</span></a>
                </div>
                {% endif %}
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
                    <div class="card-body">
                        <form action="" id="searchUser" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="form-group label-floating col-md-3">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('fullnameSearch')}}</label>
                                        {{ form_search.render('fullnameSearch',['value': request.get('fullnameSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating col-md-3">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('usernameSearch')}}</label>
                                        {{ form_search.render('usernameSearch',['value': request.get('usernameSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating col-md-3">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('emailSearch')}}</label>
                                        {{ form_search.render('emailSearch',['value': request.get('emailSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating flex-fill">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('roleidSearch')}}</label>
                                        {{ form_search.render('roleidSearch',['value': request.get('roleidSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-auto mt-s-0">
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info" type="submit"><span>Tìm</span></button>
                                </div>
                                {{ form_search.render('paged',['value': request.get('paged')]) }}
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="user" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr>
                                        <th class="align-middle text-center" style="width: 30px;">
                                            <input id="userCheckboxAll" type="checkbox" value="1">
                                        </th>
                                        <th class="align-middle text-center" style="width: 20px;">STT</th>
                                        <th class="align-middle">Ảnh đại diện</th>
                                        <th class="align-middle">Tên tài khoản</th>
                                        <th class="align-middle">Họ và tên</th>
                                        <th class="align-middle">E-mail</th>
                                        <th class="align-middle">Nhóm người dùng</th>
                                        <th class="align-middle text-center" style="width: 60px;">Trạng thái</th>
                                        <th class="align-middle text-center" style="width: 60px;">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{% if master.checkPermission('user', 'update',[0,1]) %}
<div class="modal fade" id="modalUser">
    <div class="modal-dialog" style="max-width: 1350px; width: 98%;">
        <div class="modal-content">
            {{form('method':'post','id':'frmUser','enctype':'multipart/form-data','data-toggle':'validator','role':'form', 'action':'', 'class':'customForm')}}
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-group col-md-4 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('username')}}</label>
                            {{form.render('username')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-4 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('fullname')}}</label>
                            {{form.render('fullname')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-4 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('email')}}</label>
                            {{form.render('email')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-3 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('deptid')}}</label>
                            {{form.render('deptid')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-3 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('roleid')}}</label>
                            {{form.render('roleid')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-3 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('gender')}}</label>
                            {{form.render('gender')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-3 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('status')}}</label>
                            {{form.render('status')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="row rowPassword">
                    <div class="form-group col-md-6 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('addpassword')}}</label>
                            {{form.render('addpassword')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-6 label-floating">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('confirmPassword')}}</label>
                            {{form.render('confirmPassword')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <input class="tokenCSRF" type='hidden' name='<?php echo $this->security->getTokenKey() ?>'
                    value='<?php echo $this->security->getToken() ?>' />

            </div>
            {% if master.checkPermission('user', 'update') OR master.checkPermission('user', 'update', 1) %}
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-hnn btn-hnn-default"
                    data-dismiss="modal"><span>Đóng</span></button>
                <button type="submit" class="btn btn-hnn btn-hnn-info" id="btnSummitUser"><span>Thêm mới</span></button>
            </div>
            {% endif %}
            {{end_form()}}
        </div>
    </div>
</div>
{% endif %}