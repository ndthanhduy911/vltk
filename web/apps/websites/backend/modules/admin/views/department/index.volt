<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">ĐƠN VỊ</h3>
        <span>Thông tin các đơn vị của VNU được hỗ trợ kỹ thuật.</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Đơn vị</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách đơn vị
                        </h2>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'department','add')){ ?>
                        <span class="col-md-1">
                            <a href="/adcp/department/add" class="addDepartment btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span>
                        <?php } ?>
                    </div>
                    <div class="table-responsive">
                        <table id="department" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">STT</th>
                                    <th class="align-middle text-white">Tên đơn vị</th>
                                    <th class="align-middle text-white" style="min-width: 200px;">Giới thiệu</th>
                                    <th class="align-middle text-white" style="min-width: 150px;">Điện thoại</th>
                                    <th class="align-middle text-white" style="min-width: 200px;">Email</th>
                                    <th class="align-middle text-white" style="min-width: 100px">Trạng thái</th>
                                    <th class="align-middle text-white text-center" style="min-width: 100px;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1 ?>{% for department in departments %}
                                <tr class="text-center">
                                    <td><?php echo $stt++; ?></td>
                                    <td class="align-middle">{{ department.name }}</td>
                                    <td class="align-middle">{{ department.description }}</td>
                                    <td class="align-middle">{{ department.phone }}</td>
                                    <td class="align-middle">{{ department.email }}</td>
                                    <td class="align-middle">
                                        {% if department.status %}
                                            <span status="{{department.status}}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Active</span>
                                        {% else %}
                                            <span status="{{department.status}}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Disabled</span>
                                        {% endif %}
                                    </td>
                                    <td class="align-middle text-center">
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'department','edit')){ ?>
                                        <a class="editDepartment btn btn-primary btn-sm m-2-4" href="javascript:;" data-href="/adcp/department/edit/{{ department.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'department','delete')){ ?>
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id={{ department.id }} href="/adcp/department/delete" obj="Đơn vị">
                                            <i class="fa fa-remove"></i>
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
    </div>
    <!-- End PAge Content -->
</div>

<div id="modalEditDepartment" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditDepartmentLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditDepartmentLabel">Cập nhật đơn vị</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditDepartment" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
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
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('email') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('email') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('description') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('description') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Cập nhật</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>