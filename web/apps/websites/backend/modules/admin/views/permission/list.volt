<?php use Library\RoleMaster\RoleMaster; ?>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">DANH SÁCH PHÂN QUYỀN</h3>
        <span>Danh sách các quyền được quy định trên hệ thống</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Danh sách phân quyền</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách phân quyền
                        </h2>
                        <!-- <span class="col-md-1">
                            <a href="/adcp/permission/add" class="addPermission btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span> -->
                    </div>
                    <div class="table-responsive">
                        <table id="permission" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white" style="width: 30px;">STT</th>
                                    <th class="align-middle text-white">Tên quyền</th>
                                    <th class="align-middle text-white" width="30%">Giới thiệu</th>
                                    <th class="align-middle text-white" style="min-width: 100px">Trạng thái</th>
                                    <th class="align-middle text-white text-center" style="width: 120px;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1 ?>{% for permission in page.items %}
                                <tr class="text-center">
                                    <td><?php echo $stt++ ?></td>
                                    <td class="align-middle">{{ permission.name }}</td>
                                    <td class="align-middle">{{ permission.description }}</td>
                                    <td class="align-middle">
                                        {% if permission.status %}
                                            <span status="{{permission.status}}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Active</span>
                                        {% else %}
                                            <span status="{{permission.status}}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Disabled</span>
                                        {% endif %}
                                    </td>
                                    <?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','edit')){ ?>
                                    <td class="align-middle text-center">
                                        <a class="editPermission btn btn-primary btn-sm m-2-4" href="/adcp/permission/edit/{{ permission.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                    </td>
                                    <?php } ?>
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
<?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','edit')){ ?>
<div id="modalEditPermission" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditPermissionLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditPermissionLabel">Edit Permission</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditPermission" method="post" data-toggle="validator" role="form">
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
                    <button type="submit" class="btn btn-danger">Update</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php } ?>