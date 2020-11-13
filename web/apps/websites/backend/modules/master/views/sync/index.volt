<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    {% if dispatcher.getControllerName() != 'index' %}
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    {% endif %}
                    <li class="breadcrumb-item active">{{ title }}<span class="ml-1">- Quản lý danh sách, thông tin nhập dữ liệu ban đầu</span></li>
                </ol>
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
                    <div class="card-header">
                        <h3 class="card-title">Nhập dữ liệu ban đầu</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                    </div>
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

                        <form id="frmAddSync" action="<?= WEB_ADMIN_URI ?>/sync/add" class="customForm col-md-4 ml-auto mr-auto" method="post" enctype="multipart/form-data" data-toggle="validator" type="form" novalidate="true">
                            <div class="row">
                                <div class="form-group col-md-12 mt-0 text-center">
                                    <a href="<?= WEB_URL ?>/files/import/sync_import.xlsx" class="btn btn-hnn btn-hnn-info"><span>Tải biểu mẫu <i class="fas fa-download"></i></span></a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group label-floating col-md-12">
                                    <div class="input-group">
                                        <label class="control-label">{{syncForm.getLabel('deptid')}}</label>
                                        {{syncForm.render('deptid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group label-floating col-md-12">
                                    <div class="input-group">
                                        <label class="control-label">{{syncForm.getLabel('typeid')}}</label>
                                        {{syncForm.render('typeid')}}
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

<div class="content-header pt-0">
    <div class="container-fluid">
        <div class="row">
            <h4 class="detail-title col-auto">Danh sách dữ liệu</h4>
            <div class="col-md-6">
                {% if master.checkPermission('sync', 'delete') %}
                <span title="" data-toggle="tooltip" class="float-right">
                    <a data-href="<?= WEB_ADMIN_URL ?>/sync/delete"
                        class="btn btn-hnn btn-hnn-danger" id="deleteSync"><span
                            title="Xóa dữ liệu" data-toggle="tooltip">Xóa</span></a>
                </span>
                {% endif %}

                {% if master.checkPermission('sync', 'lock') %}
                <button id="lockSync" type="button" class="btn btn-hnn btn-hnn-warning float-right mr-2"
                    title="Khóa thông tin" data-toggle="tooltip"
                    data-href="<?= WEB_ADMIN_URI.'/sync/lock' ?>"><span>Khóa</span></button>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <form action="" id="searchSync" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="flex-1 col-auto row pr-0">
                                    <div class="col-md-12 row pr-0">
                                    {% for key,ffilter in fFilters %}
                                    <div class="form-group label-floating flex-1 col-auto">
                                        <div class="input-group">
                                            <label class="control-label">{{form_search.getLabel(ffilter~'Search')}}</label>
                                            {{ form_search.render(ffilter~'Search',['value': request.get(ffilter~'Search')]) }}
                                            <div class="invalid-feedback">
                                            </div>
                                        </div>
                                    </div>
                                    <?php if (($key+1) % \FilterSetting::getBeautyRow(count($fFilters)) == 0){ ?>
                                    </div>
                                    <div class="col-md-12 row pr-0">
                                    <?php } ?>
                                    {% endfor %}
                                    </div>
                                </div>
    
                                <div class="form-group col-auto mt-s-0">
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info" type="submit"><span>Tìm</span></button>
                                </div>
                                {{ form_search.render('paged',['value': request.get('paged')]) }}
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="sync" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr class="bg-browm">
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;"><input id="syncCheckboxAll" type="checkbox" value="1"></th>
                                        <th data-col="no" class="align-middle text-center" style="width: 30px;">STT</th>
                                        {% for key,table in fTables %}
                                        <th data-col="{{table}}" class="align-middle <?= in_array($table,['quantity','createdat','updatedat']) ? 'text-center' : '' ?>"><?= \Sync::filedName($table) ?></th>
                                        {% endfor %}
                                        <th data-col="no" class="align-middle text-center" style="width: 60px;">Thao tác</th>
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

{{ partial('galleryview') }}