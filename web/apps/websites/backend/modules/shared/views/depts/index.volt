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
                {% if master.checkPermission('depts', 'delete') %}
                <div class="btn-group float-right">
                    <a id="deleteDepts" data-href="<?= WEB_ADMIN_URL ?>/depts/delete" data-toggle="tooltip" title="Tạo mới"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span>Xóa</span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('depts', 'update') %}
                <div class="btn-group float-right">
                    <a id="addDepts" href="#" data-href="<?= WEB_ADMIN_URL ?>/depts/update"
                        data-toggle="tooltip" title="Tạo mới" class="ml-2 btn btn-hnn btn-hnn-success"><span>Thêm</span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('depts', 'update') %}
                <div class="btn-group float-right">
                    <a id="importDepts" href="#" data-href="<?= WEB_ADMIN_URL ?>/depts/import" data-toggle="tooltip" title="Tải lên hàng loạt"
                        class="ml-2 btn btn-hnn btn-hnn-info"><span>Tải lên</span></a>
                </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12" id="blockSession">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <form action="" id="searchDepts" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="form-group label-floating col-auto flex-1">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('parentSearch')}}</label>
                                        {{ form_search.render('parentSearch',['value': request.get('parentSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating col-auto flex-1">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('dcodeSearch')}}</label>
                                        {{ form_search.render('dcodeSearch',['value': request.get('dcodeSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating col-auto flex-1">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('nameSearch')}}</label>
                                        {{ form_search.render('nameSearch',['value': request.get('nameSearch')]) }}
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
                            <table id="depts" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr class="bg-browm">
                                        <th class="align-middle text-center" style="width: 30px;">
                                            <!-- <input id="assetTypeCheckboxAll" type="checkbox" value="1"> -->
                                        </th>
                                        <th class="align-middle">Mã đơn vị/bộ phận</th>
                                        <th class="align-middle">Mã QHNS</th>
                                        <th class="align-middle">Tên</th>
                                        <th class="align-middle">Địa chỉ</th>
                                        <th class="align-middle">Mô tả</th>
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

{% if master.checkPermission('depts', 'update',[0,1]) %}
<div class="modal fade" id="modalDepts">
    <div class="modal-dialog" style="max-width: 1220px;">
        <div class="modal-content">
            {{form('method':'post','id':'frmDepts','enctype':'multipart/form-data','data-toggle':'validator','depts':'form', 'action':'', 'class':'customForm')}}
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-group label-floating col-md-6">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('name')}}</label>
                            {{form.render('name')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group label-floating col-md-6">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('parentid')}}</label>
                            {{form.render('parentid')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group label-floating col-md-6">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('dcode')}}</label>
                            {{form.render('dcode')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group label-floating col-md-6">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('qhns')}}</label>
                            {{form.render('qhns')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group label-floating col-md-6">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('address')}}</label>
                            {{form.render('address')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group label-floating col-md-6">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('description')}}</label>
                            {{form.render('description')}}
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}" />
            </div>
            {% if master.checkPermission('depts', 'update') OR master.checkPermission('depts', 'update', 1) %}
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-hnn btn-hnn-default"
                    data-dismiss="modal"><span>Đóng</span></button>
                <button type="submit" class="btn btn-hnn btn-hnn-info" id="btnSummitDepts"><span>Thêm
                        mới</span></button>
            </div>
            {% endif %}
            {{end_form()}}
        </div>
    </div>
</div>
{% endif %}

{% if master.checkPermission('depts', 'add') %}
<div class="modal fade" id="modalDeptsImport">
    <div class="modal-dialog" style="min-width: 600px;">
        <div class="modal-content">
            <form id="frmDeptsImport" action="<?= WEB_ADMIN_URL ?>/depts/import" method="POST" enctype="multipart/form-data" data-toggle="validator" class="customForm">
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="callout callout-info">        
                        <p><strong>Bước 1:</strong> Tải biểu mẫu và cập nhật những nội dung tương ứng</p>
                        <p><strong>Bước 2:</strong> Chèn tệp đã điền đầy đủ thông tin</p>
                        <p><strong>Bước 3:</strong> Nhấn nút tải lên để hoàn tất</p>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 text-center mt-0 pb-0">
                            <a href="<?= WEB_URL ?>/files/import/depts_import.xlsx" class="btn btn-hnn btn-hnn-info"><span>Tải mẫu XLSX <i class="fas fa-download"></i></span></a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 mt-0">
                            <label for="importfile">Đính kèm tập tin XLSX</label>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input name="importfile" accept=".xlsx" type="file" class="custom-file-input form-control form-control-sm" id="importfile" placeholder="Tên tập tin nhập" required data-required-error="Vui lòng chọn biểu mẫu">
                                    <label class="custom-file-label" for="importfile">Chọn tập tin XLSX</label>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-hnn btn-hnn-success"
                                    id="btnSummitDeptsImport"><span>Tải lên</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}" />
                </div>
            </form>
        </div>
    </div>
</div>
{% endif %}