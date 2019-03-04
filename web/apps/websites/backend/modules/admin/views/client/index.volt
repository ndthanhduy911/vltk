<?php use Library\RoleMaster\RoleMaster; ?>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">QUẢN LÝ NGƯỜI YÊU CẦU (END-USER)</h3>
        <span>Hiển thị danh sách các tài khoản có thể gửi yêu cầu hỗ trợ lên hệ thống.</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Quản lý người yêu cầu</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách người yêu cầu (End-User)</h2>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'client','add')){ ?>
                        <span class="col-md-1">
                            <a href="/adcp/client/add" class="addClient btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span>
                        <?php } ?>
                    </div>
                    <div class="table-responsive">
                        <table id="client" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">STT</th>
                                    <th class="align-middle text-white">Họ và tên</th>
                                    <th class="align-middle text-white">Địa chỉ</th>
                                    <th class="align-middle text-white" style="min-width: 150px;">Đơn vị</th>
                                    <th class="align-middle text-white" style="min-width: 150px;">Email</th>
                                    <th class="align-middle text-white" style="min-width: 150px;">Số điện thoại</th>                                 
                                    <th class="align-middle text-white">Trạng thái</th>
                                    <th class="align-middle text-white text-center" style="min-width: 100px;">Thao tác</th>
                                    <th class="hidden">Dịch vụ</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php $stt=1 ?>{% for client in clients %}
                                <tr class="text-center" role="row">
                                    <td><?php echo $stt++; ?></td>
                                    <td>{{ client.name }}</td>
                                    <td>{{ client.address }}</td>
                                    <td><span data-id="{{ client.department_id }}">{{ client.client_name }}</span></td>
                                    <td>{{ client.email }}</td> 
                                    <td>{{ client.phone }}</td>                                     
                                    <td>
                                        {% if client.status %}
                                            <span status="{{client.status}}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Active</span>
                                        {% else %}
                                            <span status="{{client.status}}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Disable</span>
                                        {% endif %}
                                    </td>
                                    <td>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'client','edit')){ ?>
                                        <a class="btn btn-primary btn-sm m-2-4 editClient" data-id="{{ client.id }}"
                                           href="/adcp/client/edit/{{ client.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'client','delete')){ ?>
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4"
                                           data-id={{ client.id }} obj="Người yêu cầu" href="/adcp/client/delete">
                                            <i class="fa fa-remove"></i>
                                        </a>
                                        <?php } ?>
                                    </td>
                                    <td>{{ client.package_id }}</td>
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

<div id="modalEditClient" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="modalEditClientLabel"
     aria-hidden="true">
    {% if dept %}
    <div id="onlydept">{{dept}}</div>
    {% endif %}
    <div class="modal-dialog" style="max-width: 1200px; width: 70%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditClientLabel">Cập nhật người yêu cầu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng"
                        style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditClient" method="post" data-toggle="validator" role="form">
                <div class="modal-body float-left">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('name') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('name') }}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('email') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('email') }}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('address') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('address') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('phone') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('phone') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('department_id') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('department_id') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('status') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('status') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="status">Loại dịch vụ được phép yêu cầu<strong class="text-danger">*</strong></label>
                                <div class="input-group">
                                    <select name="package_id[]" class="form-control multiple-select" required multiple style="width: 100%;" data-error="Vui lòng chọn loại dịch vụ.">
                                        <!-- <option value="all">Tất cả dịch vụ bên dưới</option> -->
                                        <?php foreach ($package as $key => $value) { ?>
                                        <option value="{{value.id}}">{{value.name}}</option>
                                        <?php } ?>
                                    </select>
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-6 text-left pl-4 show-changePW hidden">
                        <button type="button" class="btn btn-danger btn-changePW">Đổi mật khẩu</button>
                        <button type="button" class="btn btn-secondary hidden">Đóng</button>
                    </div>
                    <div class="col-md-6 text-right">
                        <button type="submit" class="btn btn-danger">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </form>
            <form class="col-md-12 pb-3 hidden" action="/adcp/client/changepassword" id="frmChangePWClient" method="post" data-toggle="validator" role="form">
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
                                <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required="1" maxlength="150" data-required-error="Vui lòng nhập mật khẩu của bạn." data-error="Chưa đúng định dạng.">
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
                                <input type="password" id="confrim_password" name="confrim_password" class="form-control" placeholder="Xác nhận mật khẩu" required="1" maxlength="150" data-match="#password" data-required-error="Vui lòng nhập nhập lại mật khẩu của bạn." data-error="Mật khẩu không trùng khớp.">
                                <div class="invalid-tooltip">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-changePWC" data-id="">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>