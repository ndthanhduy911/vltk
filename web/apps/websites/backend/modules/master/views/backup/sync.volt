
<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    {% if dispatcher.getControllerName() != 'index' %}
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    {% endif %}
                    <li class="breadcrumb-item active">{{ title }} - Nhập dữ liệu tài sản trước khi sử dụng hệ thống</li>
                </ol>
            </div>
            <div class="col-sm-6">
                {% if master.checkPermission('backup', 'delete') %}
                <div class="btn-group float-right">
                    <a id="restoreSync" href="#" data-href="<?= WEB_ADMIN_URL ?>/backup/restore" data-method="POST" data-toggle="tooltip" title="Xóa tất cả tài sản trên hệ thống"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span>Xóa tất cả tài sản</span></a>
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
                        <div class="col-md-4 mr-auto ml-auto">
                            <div class="callout callout-info">        
                                <p><strong>Bước 1:</strong> Tải biểu mẫu và cập nhật những nội dung tương ứng</p>
                                <p><strong>Bước 2:</strong> Chọn loại đơn vị/bộ phận</p>
                                <p><strong>Bước 3:</strong> Chọn loại tài sản</p>
                                <p><strong>Bước 4:</strong> Chèn tệp đã điền đầy đủ thông tin</p>
                                <p><strong>Bước 5:</strong> Nhấn nút tải lên để hoàn tất</p>
                            </div>
                        </div>

                        <form id="frmSync" action="" class="customForm col-md-4 ml-auto mr-auto" method="post" enctype="multipart/form-data" data-toggle="validator" type="form" novalidate="true">
                            <div class="row">
                                <div class="form-group col-md-12 mt-0 text-center">
                                    <a href="<?= WEB_URL ?>/files/import/sync_import.xlsx" class="btn btn-hnn btn-hnn-info"><span>Tải biểu mẫu <i class="fas fa-download"></i></span></a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group label-floating col-md-12">
                                    <div class="input-group">
                                        <label class="control-label">{{form.getLabel('deptid')}}</label>
                                        {{form.render('deptid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group label-floating col-md-12">
                                    <div class="input-group">
                                        <label class="control-label">{{form.getLabel('typeid')}}</label>
                                        {{form.render('typeid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
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
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 d-flex justify-content-center">
                                    <button type="submit" class="btn btn-hnn btn-hnn-success"><span>Tải lên</span></button>
                                </div>
                            </div>
                            <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
