<?php use Library\RoleMaster\RoleMaster; ?>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">NHÂN VIÊN HỖ TRỢ KỸ THUẬT</h3>
        <span>Thông tin các nhân viên kỹ thuật (Những người giải quyết các yêu cầu hỗ trợ gửi lên hệ thống - IT SUPPORT)</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢN ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Danh sách nhân viên HTKT</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-12">
            <div class="card" style="font-size: 0.8rem">
                <div class="card-body">
                    <div class="row">
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách nhân viên hỗ trợ kỹ thuật</h2>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'user','add')){ ?>
                        <span class="col-md-1">
                            <a href="/adcp/user/add" class="addUser btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span>
                        <?php } ?>
                    </div>
                    <div class="table-responsive">
                        <table id="userTB" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                            <tr style="background: #EE161E">
                                <th class="align-middle text-white">ID</th>
                                <th class="align-middle text-white">Email</th>
                                <th class="align-middle text-white">Họ & Tên</th>
                                <th class="align-middle text-white" style="min-width: 100px">Điện thoại</th>
                                <th class="align-middle text-white">Đơn vị</th>
                                <th class="align-middle text-white">Phân quyền</th>
                                <th class="align-middle text-white">Tình trạng</th>
                                <th class="align-middle text-white text-center">Thao tác</th>
                                <th class="align-middle hidden">Dịch vụ</th>
                                <th class="align-middle hidden">Địa chỉ</th>

                            </tr>
                            </thead>
                            <tbody>
                            <?php $stt=1 ?>{% for user in page.items %}
                                <tr class="text-center" role="row">
                                    <td><?php echo $stt++ ?></td>
                                    <td>{{user.email}}</td>
                                    <td>{{user.fullname}}</td>
                                    <td>{{user.mobile}}</td>
                                    <td><span data-id="{{ user.department_id }}">{{ user.department_name }}</span></td>
                                    <td><span data-id="{{user.group_id}}"></span>{{user.group_name}}</td>
                                    <td>
                                        {% if user.status %}
                                            <span status="{{user.status}}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Active</span>
                                        {% else %}
                                            <span status="{{user.status}}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Disable</span>
                                        {% endif %}
                                        {#{{user.status}} ? '': '<span status="V" class="badge badge-warning" style="font-size: 0.7rem; padding: 0.5rem">Disable</span>'#}
                                        {#<span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem" status ={{user.status}}><?php echo $user->status ? 'Active' : 'Disabled' ?></span>#}
                                    </td>
                                    <td class="align-middle text-center">
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'user','edit')){ ?>
                                        <a class="btn btn-primary btn-sm m-2-4 editUser" data-id={{user.id}} href="/adcp/user/edit/{{user.id}}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'user','delete')){ ?>
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id={{user.id}} obj="User" href="/adcp/user/delete">
                                            <i class="fa fa-remove"></i>
                                        </a>
                                        <?php } ?>
                                    </td>
                                    <td>{{user.package_id}}</td>
                                    <td>{{user.address}}</td>
                                </tr>
                            {% endfor %}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modalEditUser" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditUserLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1200px;">
        <div class="modal-content">
            <div class="modal-header" style="background:#EE161E">
                <h5 class="modal-title text-white" id="modalEditUserLabel">Edit User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                {{ form.label('email') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('email') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                {{ form.label('fullname') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('fullname') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                {{ form.label('address') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('address') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                {{ form.label('mobile') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('mobile') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                {{ form.label('status') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('status') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                {{ form.label('group_id') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('group_id') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="status">Loại dịch vụ<strong class="text-danger">*</strong></label>
                                <div class="input-group">
                                    <select name="package_id[]" class="form-control multiple-select" required multiple style="width: 100%;" data-error="Vui lòng chọn loại dịch vụ.">
                                        <option value="all">Tất cả</option>
                                        <?php foreach ($package as $key => $value) { ?>
                                        <option value="{{value.id}}">{{value.name}}</option>
                                        <?php } ?>
                                    </select>
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                {{ form.label('department_id') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('department_id') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                {{ form.label('password') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    {{ form.render('password') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="confirm_password">Xác nhận mật khẩu <strong class="text-danger">*</strong></label>
                                 <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text input-group-success" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    <input type="password" data-match="#password" id="confirm_password" data-required-error="Vui lòng nhập nhập lại mật khẩu của bạn." data-error="Mật khẩu không trùng khớp." name="confirm_password" class="form-control" placeholder="Xác nhận mật khẩu" required="1" size="255">
                                    <div class="invalid-tooltip" style="display: none;">
                                    </div>
                                </div>
                            </div>
                        </div> -->

                    </div>
                </div>
                <div class="modal-footer">
                    <!-- <div class="col-md-6 text-left pl-4 show-changePW hidden">
                        <button type="button" class="btn btn-primary btn-changePW">Đổi mật khẩu</button>
                        <button type="button" class="btn btn-secondary hidden">Đóng</button>
                    </div> -->
                    <div class="col-md-6 text-right">
                        <button type="submit" class="btn btn-danger">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </form>
            <!-- <form class="col-md-12 pb-3 hidden" action="/adcp/user/changepassword" id="frmChangePWUser" method="post" data-toggle="validator" role="form">
                <div class="container col-md-6 float-left">
                    <div class="form-row">
                        <div class="col-md-12 mb-3 group-val">
                            <label for="name">Mật khẩu mới <strong class="text-danger">*</strong></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="background: #EE161E">
                                        <i class="fa fa-edit text-white"></i>
                                    </span>
                                </div>
                                <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required="1" maxlength="150" data-required-error="Vui lòng nhập mật khẩu của bạn." data-error="Chưa đúng định dạng.">
                                <div class="invalid-tooltip">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12 mb-3 group-val">
                            <label for="name">Xác nhận mật khẩu <strong class="text-danger">*</strong></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="background: #EE161E">
                                        <i class="fa fa-edit text-white"></i>
                                    </span>
                                </div>
                                <input type="password" name="confrim_password" class="form-control" placeholder="Xác nhận mật khẩu" required="1" maxlength="150" data-match="#password" data-required-error="Vui lòng nhập nhập lại mật khẩu của bạn." data-error="Mật khẩu không trùng khớp.">
                                <div class="invalid-tooltip">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-changePWC" data-id="">Cập nhật</button>
                </div>
            </form> -->
        </div>
    </div>
</div>
