<?php use Library\RoleMaster\RoleMaster; ?>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">PHƯƠNG THỨC XỬ LÝ</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Phương thức xử lý</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Phương thức xử lý
                        </h2>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'method','add')){ ?>
                        <span class="col-md-1">
                            <a href="/adcp/method/add" class="addMethod btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span>
                        <?php } ?>
                    </div>
                    <div class="table-responsive">
                        <table id="method" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">STT</th>
                                    <th class="align-middle text-white">Tên phương thức</th>
                                    <th class="align-middle text-white" width="30%">Nội dung</th>
                                    <th class="align-middle text-white" style="min-width: 100px">Dịch vụ</th>
                                    <th class="align-middle text-white text-center" style="min-width: 100px;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1 ?>{% for method in page.items %}
                                <tr class="text-center">
                                    <td><?php echo $stt++ ?></td>
                                    <td class="align-middle">{{ method.name }}</td>
                                    <td class="align-middle">{{ method.content }}</td>
                                    <td class="align-middle"><span class="hidden">{{method.package_id}}</span>{{ method.package_name }}</td>
                                    <td class="align-middle text-center">
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'method','edit')){ ?>
                                        <a class="editMethod btn btn-primary btn-sm m-2-4" href="/adcp/method/edit/{{ method.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'method','delete')){ ?>
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id={{ method.id }} href="/adcp/method/delete" obj="Phương thức">
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

<div id="modalEditMethod" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditMethodLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditMethodLabel">Cập nhận phương thức</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditMethod" method="post" data-toggle="validator" role="form">
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
                                {{ form.label('package_id') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('package_id') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('content') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('content') }}
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