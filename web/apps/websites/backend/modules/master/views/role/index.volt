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
            <div class="col-sm-6">
                {% if master.checkPermission('role', 'delete') %}
                <div class="btn-group float-right">
                    <a id="deleteRole" data-href="<?= WEB_ADMIN_URL ?>/role/delete" title="Xóa"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span>Xóa</span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('role', 'update') %}
                <div class="btn-group float-right">
                    <a id="addRole" href="#" data-href="<?= WEB_ADMIN_URL ?>/role/update" title="Tạo mới"
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
                        <form action="" id="searchRole" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="form-group col-auto flex-1 label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('nameSearch')}}</label>
                                        {{ form_search.render('nameSearch',['value': request.get('nameSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-auto flex-1 label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('statusSearch')}}</label>
                                        {{ form_search.render('statusSearch',['value': request.get('statusSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-auto flex-1 label-floating">
                                    <div class="input-group">
                                        <label
                                            class="control-label">{{form_search.getLabel('createddateSearch')}}</label>
                                        {{ form_search.render('createddateSearch',['value': request.get('createddateSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-auto mt-s-0">
                                    <button class="btn btn-hnn btn-hnn-info" type="submit"><span>Tìm</span></button>
                                </div>

                                {{ form_search.render('paged',['value': request.get('paged')]) }}
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="role" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr class="bg-browm">
                                        <th class="align-middle text-center" style="width: 30px;">
                                            <input id="roleCheckboxAll" type="checkbox" value="1">
                                        </th>
                                        <th class="align-middle text-center" style="width: 30px;">STT</th>
                                        <th class="align-middle">Tên nhóm người dùng</th>
                                        <th class="align-middle">Thời gian tạo</th>
                                        <th class="align-middle">Thời gian cập nhật</th>
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
{% if master.checkPermission('role','update',[0,1]) %}
<div class="modal fade" id="modalRole">
    <div class="modal-dialog" style="max-width: 1350px; width: 98%;">
        <div class="modal-content">
            {{form('method':'post','id':'frmRole','enctype':'multipart/form-data','data-toggle':'validator','role':'form', 'action':'', 'class':'customForm')}}
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-group col-md-6 label-floating is-empty">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('name')}}</label>
                            {{form.render('name')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group col-md-6 label-floating is-empty">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('status')}}</label>
                            {{form.render('status')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs w-100" id="roleTabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="roleListTab" data-toggle="pill" href="#roleList"
                                            role="tab" aria-controls="roleList" aria-selected="true">Danh sách quyền</a>
                                    </li>
                                    <button type="submit"
                                        class="btn btn-hnn btn-hnn-info ml-auto mt-auto mb-auto mr-1 btnSummitRole"><span>Thêm
                                            mới</span></button>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="roleTabsContent">
                                    <div class="tab-pane fade show active" id="roleList" role="tabpanel"
                                        aria-labelledby="roleListTab">
                                        <h7>Đơn vị(*)</h7>
                                        <ul>
                                            <li>Tất cả: Xem và thao tác tất cả dữ liệu thuộc các đơn vị.</li>
                                            <li>Đơn vị: Xem, thao tác trên dữ liệu thuộc đơn vị và các đơn vị trực thuộc.</li>
                                            <li>Cá nhân: Xem, thao tác trên dữ liệu của cá nhân tạo ra thuộc đơn vị và các đơn vị trực thuộc, nếu có.</li>
                                            <li>Trực thuộc: Xem và thao tác trên dữ liệu thuộc đơn vị hiện tại.</li>
                                        </ul>
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10px">#</th>
                                                        <th class="text-center align-middle">Tên</th>
                                                        <th class="text-center align-middle">Tất cả</th>
                                                        <th class="text-center align-middle">Xem</th>
                                                        <th class="text-center align-middle">Thêm</th>
                                                        <th class="text-center align-middle">Sửa</th>
                                                        <th class="text-center align-middle">Xóa</th>
                                                        <th class="text-center align-middle">Khóa</th>
                                                        <th class="text-center align-middle" style="width: 95px;">Đơn
                                                            vị(*)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php $notRole = [2,10,11,13,14,15,16,17,18,19]; ?>
                                                    <?php $groups = \PermissionGroups::findNoDelete("id,name") ?>
                                                    {% for group in groups %}
                                                    <?php $roles = PermissionRole::findNoDelete("id, name", ["groupid = {$group->id}"]) ?>
                                                    {% if roles.count() %}
                                                    <tr>
                                                        <td colspan="9" class="font-weight-bold">{{group.name}}</td>
                                                    </tr>
                                                    {% for index,role in roles %}

                                                    <?php $permissionAdd = \Permission::getPermissionByType($group->id, $role->id, 1); ?>
                                                    <?php $permissionEdit = \Permission::getPermissionByType($group->id, $role->id, 2) ?>
                                                    <?php $permissionDelete = \Permission::getPermissionByType($group->id, $role->id, 3) ?>
                                                    <?php $permissionView = \Permission::getPermissionByType($group->id, $role->id, 4) ?>
                                                    <?php $permissionLock = \Permission::getPermissionByType($group->id, $role->id, 5) ?>

                                                    <tr>
                                                        <td>{{(index + 1)}}</td>
                                                        <td>{{role.name}}</td>
                                                        <td class="text-center align-middle"><input class="roleAll"
                                                                type="checkbox" value="1"></td>
                                                        <td class="text-center align-middle"><input
                                                                {{permissionView ? 'id = "permission'~permissionView.id~'" name="permissions[]" value="'~permissionView.id~','~role.id~'"' : 'disabled change="false"'}}
                                                                class="roleView" type="checkbox"></td>
                                                        <td class="text-center align-middle"><input
                                                                {{permissionAdd ? 'id = "permission'~permissionAdd.id~'" name="permissions[]" value="'~permissionAdd.id~','~role.id~'"' : 'disabled change="false"'}}
                                                                class="roleAdd" type="checkbox"></td>
                                                        <td class="text-center align-middle"><input
                                                                {{permissionEdit ? 'id = "permission'~permissionEdit.id~'" name="permissions[]" value="'~permissionEdit.id~','~role.id~'"' : 'disabled change="false"'}}
                                                                class="roleEdit" type="checkbox"></td>
                                                        <td class="text-center align-middle"><input
                                                                {{permissionDelete ? 'id = "permission'~permissionDelete.id~'" name="permissions[]" value="'~permissionDelete.id~','~role.id~'"' : 'disabled change="false"'}}
                                                                class="roleDelete" type="checkbox"></td>
                                                        <td class="text-center align-middle"><input
                                                                {{permissionLock ? 'id = "permission'~permissionLock.id~'" name="permissions[]" value="'~permissionLock.id~','~role.id~'"' : 'disabled change="false"'}}
                                                                class="roleLock" type="checkbox"></td>
                                                        <td class="text-center align-middle pt-0 pb-0">
                                                            <select name="roleDept{{role.id}}" id="roleDept{{role.id}}" <?= in_array($role->id,$notRole) ? 'disabled' : '' ?>
                                                                class="roleDept form-control-sm mw-85px">
                                                                <option value="0">Tất cả</option>
                                                                <option value="1">Đơn vị</option>
                                                                <option value="2">Cá nhân</option>
                                                                <option value="3">Trực thuộc</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    {% endfor  %}
                                                    {% endif  %}
                                                    {% endfor  %}
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <input class="tokenCSRF" type='hidden' name='<?php echo $this->security->getTokenKey() ?>'
                    value='<?php echo $this->security->getToken() ?>' />
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-hnn btn-hnn-default"
                    data-dismiss="modal"><span>Đóng</span></button>
                <button type="submit" class="btn btn-hnn btn-hnn-info btnSummitRole"><span>Thêm mới</span></button>
            </div>
            {{end_form()}}
        </div>
    </div>
</div>
{% endif %}