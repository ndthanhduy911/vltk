<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">QUẢN LÝ EMAIL/SMS</h3>
        <span>Quản lý các tin nhắn được gửi hoặc nhận</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Quản lý EMAIL/SMS</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body p-b-0">
                    <ul class="nav nav-tabs customtab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#list_email" role="tab">
                                <span class="hidden-sm-up">
                                    <i class="ti-home"></i>
                                </span>
                                <span class="hidden-xs-down">Email</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#list_sms" role="tab">
                                <span class="hidden-sm-up">
                                    <i class="ti-user"></i>
                                </span>
                                <span class="hidden-xs-down">SMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#setting" role="tab">
                                <span class="hidden-sm-up">
                                    <i class="ti-email"></i>
                                </span>
                                <span class="hidden-xs-down">Thiết lập</span>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="list_email" role="tabpanel">
                            <div class="card" style="font-size: 0.8rem">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="tb_email" class="table table-bordered table-hover">
                                            <thead class="text-center" style="line-height: 2.5">
                                                <tr style="background: #EE161E">
                                                    <th class="align-middle text-white">#</th>
                                                    <th class="align-middle text-white">Người gửi</th>
                                                    <th class="align-middle text-white">Người nhận</th>
                                                    <th class="align-middle text-white">Tiêu đề</th>
                                                    <th class="align-middle text-white">Thời gian</th>
                                                    <th class="align-middle text-white">Tình trạng</th>
                                                    <th class="align-middle text-white text-center" style="min-width: 100px">Chi tiết</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $stt = 1 ?>{% for email in emailsms %}
                                                <tr class="text-center">
                                                    <td><?php echo $stt++; ?></td>
                                                    <td class="align-middle">{{ email.person_from }}</td>
                                                    <td class="align-middle">{{ email.person_to }}</td>
                                                    <td class="align-middle">{{ email.title }}</td>
                                                    <td class="align-middle">{{ email.created_at }}</td>
                                                    <td class="align-middle">
                                                        {% if email.status %}
                                                        <span status="{{email.status}}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Thành công</span>
                                                        {% else %}
                                                        <span status="{{email.status}}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Thất bại</span>
                                                        {% endif %}
                                                    </td>
                                                    <td class="align-middle text-center">
                                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'eamilsms','view')){ ?>
                                                        <a class="viewEmailSMS btn btn-primary btn-sm m-2-4" href="/adcp/emailsms/view/{{ email.id }}">
                                                            <i class="fa fa-eye"></i>
                                                        </a>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                {% endfor %}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="list_sms" role="tabpanel">
                            <div class="card" style="font-size: 0.8rem">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="tb_sms" class="table table-bordered table-hover">
                                            <thead class="text-center" style="line-height: 2.5">
                                                <tr style="background: #EE161E">
                                                    <th class="align-middle text-white">#</th>
                                                    <th class="align-middle text-white">Người gửi</th>
                                                    <th class="align-middle text-white">Người nhận</th>
                                                    <th class="align-middle text-white">Nội dung</th>
                                                    <th class="align-middle text-white">Thời gian</th>
                                                    <th class="align-middle text-white">Tình trạng</th>
                                                    <th class="align-middle text-white text-center">Chi tiết</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $stt=1 ?>{% for sms in emailsms %}
                                                <tr class="text-center">
                                                    <td><?php echo $stt++; ?></td>
                                                    <td class="align-middle">{{ sms.person_from }}</td>
                                                    <td class="align-middle">{{ sms.person_to }}</td>
                                                    <td class="align-middle">{{ sms.content }}</td>
                                                    <td class="align-middle">{{ sms.created_at }}</td>
                                                    <td class="align-middle">{{ sms.status }}</td>
                                                    <td class="align-middle text-center">
                                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'eamilsms','view')){ ?>
                                                        <a class="viewEmailSMS btn btn-primary btn-sm m-2-4" href="/adcp/emailsms/view/{{ sms.id }}">
                                                            <i class="fa fa-eye"></i>
                                                        </a>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                {% endfor %}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="setting" role="tabpanel">
                            <div class="card" style="font-size: 0.8rem">
                                <div class="card-body">
                                    <form class="col-md-6 float-left" action="/adcp/emailsms/emailsetting" id="frmEditSettingEmail" method="post" data-toggle="validator"
                                        role="form" novalidate="true">
                                        <h3 class="text-danger">CẤU HÌNH EMAIL</h3>
                                        <div class="form-row">
                                            <div class="col-md-12 mb-3 group-val">
                                                {{ formEmail.label('form_name') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="background: #EE161E">
                                                            <i class="fa fa-edit text-white"></i>
                                                        </span>
                                                    </div>
                                                    {{ formEmail.render('form_name') }}
                                                    <div class="invalid-tooltip">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12 mb-3 group-val">
                                                {{ formEmail.label('smtp_name') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="background: #EE161E">
                                                            <i class="fa fa-edit text-white"></i>
                                                        </span>
                                                    </div>
                                                    {{ formEmail.render('smtp_name') }}
                                                    <div class="invalid-tooltip">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12 mb-3 group-val">
                                                {{ formEmail.label('email_name') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="background: #EE161E">
                                                            <i class="fa fa-edit text-white"></i>
                                                        </span>
                                                    </div>
                                                    {{ formEmail.render('email_name') }}
                                                    <div class="invalid-tooltip">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12 mb-3 group-val">
                                                {{ formEmail.label('password_email') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="background: #EE161E">
                                                            <i class="fa fa-edit text-white"></i>
                                                        </span>
                                                    </div>
                                                    {{ formEmail.render('password_email') }}
                                                    <div class="invalid-tooltip">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12 mb-3 group-val">
                                                <label for="form_name">Các tài khoản được nhận email khi có yêu cầu
                                                    <strong class="text-danger">*</strong>
                                                </label>
                                                <div class="input-group">
                                                    <select id="users" name="users[]" class="form-control multiple-select" multiple style="width: 100%;" data-error="Vui lòng chọn loại dịch vụ.">
                                                        <?php foreach ($users as $key => $value) { ?>
                                                        <?php if(array_search($value['id'], $users_selected) !== false){ ?>
                                                        <option value="{{value['id']}}" selected>{{value['fullname']}}({{value['email']}})</option>
                                                        <?php } else { ?>
                                                        <option value="{{value['id']}}">{{value['fullname']}}({{value['email']}})</option>
                                                        <?php } ?>

                                                        <?php } ?>
                                                    </select>
                                                    <div class="invalid-tooltip">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12 mb-3 group-val">
                                                <label for="form_name">Các tài khoản được cc email khi có yêu cầu
                                                    <strong class="text-danger">*</strong>
                                                </label>
                                                <div class="input-group">
                                                    <select id="ccusers" name="ccusers[]" class="form-control multiple-select2" multiple style="width: 100%;" data-error="Vui lòng chọn loại dịch vụ.">

                                                    </select>
                                                    <div class="invalid-tooltip">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="width: 100%">
                                            <button type="submit" class="btn btn-danger">Cập nhật</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modalViewEmailSMS" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalViewEmailSMSLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalViewEmailSMSLabel">View EmailSMS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmViewEmailSMS" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        ĐANG CẬP NHẬT...
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>