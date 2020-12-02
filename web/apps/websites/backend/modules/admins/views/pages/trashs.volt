<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
            <div class="col-sm-6">
                <div class="btn-group float-right">
                    <a id="settingTrashPages" data-href="<?= WEB_ADMIN_URL ?>/setting/filters" data-get="<?= WEB_ADMIN_URL ?>/setting/getsinglefilter?fkey=trashpages" title="Thiết lập giao diện"
                        class="ml-2 btn btn-hnn btn-hnn-default"><span><i class="fas fa-cog"></i></span></a>
                </div>
                {% if master.checkPermission('pages', 'delete') %}
                <div class="btn-group float-right">
                    <a id="deleteTrashPages" data-href="<?= WEB_ADMIN_URL ?>/pages/delete" title="Xóa vĩnh viễn"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span><i class="fas fa-trash-alt"></i></span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('pages', 'restore') %}
                <div class="btn-group float-right">
                    <a id="restorePages" data-href="<?= WEB_ADMIN_URL ?>/pages/restore" title="Khôi phục bài viết"
                        class="ml-2 btn btn-hnn btn-hnn-info"><span><i class="fas fa-sync"></i></span></a>
                </div>
                {% endif %}

            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        {{flashSession.output()}}
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <form action="" id="searchTrashPages" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="flex-1 col-auto row pr-0">
                                    <div class="col-md-12 row pr-0">
                                    {% for key,ffilter in fFilters %}
                                    <div class="form-group label-floating flex-1 col-auto">
                                        <div class="input-group">
                                            <label class="control-label">{{searchForm.getLabel(ffilter~'Search')}}</label>
                                            {{ searchForm.render(ffilter~'Search',['value': request.get(ffilter~'Search')]) }}
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
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info" type="submit"><span><i class="fas fa-search"></i></span></button>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="trashpages" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">
                                            <input id="pagesCheckboxAll" type="checkbox" value="1">
                                        </th>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">STT</th>
                                        {% for key,table in fTables %}
                                        <th data-col="{{table}}" class="align-middle text-center"><?= $this->helper->showSort($table,$this,'pages',\Pages::filedName($table)) ?></th>
                                        {% endfor %}
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

<div class="modal fade" id="modalSettingTrashPages">
    <div class="modal-dialog" style="min-width: 1300px;">
        <div class="modal-content">
            <form id="frmSettingTrashPages" action="" method="POST" enctype="multipart/form-data" data-toggle="validator" class="customForm">
                <div class="modal-header">
                    <h4 class="modal-title">Thiết lập giao diện</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header pr-3 pl-3 align-items-center d-flex align-items-center">
                            <h3 class="card-title d-flex align-items-center"><input class="mr-1" type="checkbox" id="filterSelectAll" value="1">Thanh tìm kiếm (Thiết lập, sắp xếp và thay đổi vị trí các tiêu chí tìm kiếm)</h3>
                            <a href="#" class="btn btn-hnn btn-hnn-info refeshFilter ml-auto" title="Khôi phục mặc định" data-toggle="tooltip"><span><i class="fas fa-sync"></i></span></a>
                        </div>
                        <div class="card-body p-3">
                            <div class="row filterBox">
                                <?php foreach ($filters as $value) { ?>
                                <div class="col-md-4 col-lg-3 mb-0 sortFilter">
                                    <div class="form-group mt-0">
                                        <div class="custom-control d-flex align-items-center pl-0">
                                            <span class="handle cursor-move mr-2">
                                                <i class="fas fa-ellipsis-v"></i>
                                                <i class="fas fa-ellipsis-v"></i>
                                            </span>
                                            <input class="" type="checkbox" id="filters-{{value}}"
                                                name="filters[]" value="{{value}}">
                                            <label for="filters-{{value}}"
                                                class="font-weight-normal mb-0 ml-2"><?= \Pages::filedName($value) ?></label>
                                        </div>
                                    </div>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header pl-3 pr-3 align-items-center d-flex align-items-center">
                            <h3 class="card-title d-flex align-items-center"><input class="mr-1" type="checkbox" id="tablesSelectAll" value="1">Bảng dữ liệu (Thiết lập, sắp xếp và thay đổi vị trí hiển thị dữ liệu)</h3>
                            <a href="#" class="btn btn-hnn btn-hnn-info refeshTable ml-auto" title="Khôi phục mặc định" data-toggle="tooltip"><span><i class="fas fa-sync"></i></span></a>
                        </div>
                        <div class="card-body p-3">
                            <div class="row tableBox">
                                <?php foreach ($tables as $value) { ?>
                                <div class="col-md-4 col-lg-3 mb-0 sortTables">
                                    <div class="form-group mt-0">
                                        <div class="custom-control d-flex align-items-center pl-0">
                                            <span class="handle cursor-move mr-2">
                                                <i class="fas fa-ellipsis-v"></i>
                                                <i class="fas fa-ellipsis-v"></i>
                                            </span>
                                            <input class="" type="checkbox" id="tables-{{value}}"
                                                name="tables[]" value="{{value}}">
                                            <label for="tables-{{value}}"
                                                class="font-weight-normal mb-0 ml-2"><?= \Pages::filedName($value) ?></label>
                                        </div>
                                    </div>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="fkey" value="trashpages">
                    <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}" />
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-hnn btn-hnn-default"
                        data-dismiss="modal"><span><i class="fas fa-reply"></i></span></button>
                    <button type="submit" class="btn btn-hnn btn-hnn-success"><span><i class="fas fa-save"></i></span></button>
                </div>
            </form>
        </div>
    </div>
</div>