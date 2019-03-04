<?php use Library\RoleMaster\RoleMaster; ?>
<!-- Bread crumb -->
<style>
    label:has(input.checked){
        color: #F44336;
    }
</style>
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">NHÓM PHÂN QUYỀN</h3>
        <span>Danh sách các nhóm phân quyền có trên hệ thống.</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Nhóm phân quyền</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách nhóm phân quyền
                        </h2>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','addgroup')){ ?>
                        <span class="col-md-1">
                            <a href="/adcp/permission/addgroup" class="addGroup btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span>
                        <?php } ?>
                    </div>
                    <div class="table-responsive">
                        <div id="permissionInfo" class="hidden"><?php echo json_encode($optgroupForm); ?></div>
                        <table id="group" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white" style="width: 30px;">STT</th>
                                    <th class="align-middle text-white">Tên nhóm quyền</th>
                                    <th class="align-middle text-white" width="30%">Các quyền</th>
                                    <th class="align-middle text-white" style="min-width: 100px">Trạng thái</th>
                                    <th class="align-middle text-white text-center" style="width: 120px;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1 ?>{% for group in page.items %}
                                <tr class="text-center">
                                    <td><?php echo $stt++ ?></td>
                                    <td class="align-middle">{{ group.name }}</td>
                                    
                                    <td class="align-middle">
                                        <span class="hidden">{{group.permission_id}}</span>
                                        <?php $permission = json_decode($group->permission_id); ?>
                                        <?php foreach ($permission as $key => $id) {
                                            $permission_key = array_search($id, array_column($optgroupForm, 'id')) ;
                                            echo $optgroupForm[$permission_key]['name'].'; ';
                                        } ?>
                                    </td>
                                    <td class="align-middle">
                                        {% if group.status %}
                                            <span status="{{group.status}}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Active</span>
                                        {% else %}
                                            <span status="{{group.status}}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Disabled</span>
                                        {% endif %}
                                    </td>
                                    <td class="align-middle text-center">
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','editgroup')){ ?>
                                        <a class="editGroup btn btn-primary btn-sm m-2-4" href="/adcp/permission/editgroup/{{ group.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','deletegroup')){ ?>
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id={{ group.id }} obj="Nhóm phân quyên" href="/adcp/permission/deletegroup">
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

<div id="modalEditGroup" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditGroupLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 80%; max-width: 80%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditGroupLabel">Edit Group</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditGroup" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
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
                            <div class="col-md-6 mb-3">
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
                        <h3 class="text-center text-danger font-weight-bold mb-3">DANH SÁCH QUYỀN</h3>
                        <div class="form-row" id="selectBoxID">
                            <div class="col-md-3 mb-3 groupBox">
                                <!-- <h5 class="text-primary">Toàn quyền</h5>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" data-id="1"> Toàn quyền
                                    </label>
                                </div> -->
                            <?php $label = $optgroupForm[0]['optgroup']; ?>
                            <h5 class="text-primary">{{label}}</h5>
                            <?php foreach ($optgroupForm as $key => $optgroup) { ?>
                                <?php if( $optgroup['optgroup'] !== $label ){ $label = $optgroup['optgroup'] ?>
                                </div>
                                <div class="col-md-3 mb-3 groupBox">
                                <h5 class="text-primary">{{label}}</h5>
                                <?php } ?>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" data-id="{{optgroup['id']}}"> {{optgroup['name']}}
                                    </label>
                                </div>
                            <?php } ?>
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