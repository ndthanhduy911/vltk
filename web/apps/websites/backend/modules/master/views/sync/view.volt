<?php $syncId = isset($sync->id) ? $sync->id : NULL ?>
<?php $rFile = isset($sync->reportfile) ? $sync->reportfile : NULL ?>
<form data-type="{{type}}" peredit="{{perEdit}}" perview="{{perView}}"
    action="<?= WEB_ADMIN_URL.'/sync/update' ?>{{syncId ? '/'~syncId : '' }}" id="frmSync"
    class="customForm" method="post" enctype="multipart/form-data" data-toggle="validator" novalidate="true">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 d-flex align-items-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL.'/sync' ?>">Nhập dữ liệu ban đầu</a></li>
                        <li class="breadcrumb-item active">{{ title }}</li>
                    </ol>
                </div>
                <div class="col-sm-6">
                    <div class="float-right">
                        <a id="btnBackSync" href="<?= WEB_ADMIN_URI.'/sync' ?>"
                            class="btn btn-hnn btn-hnn-default" title="Trở về" data-toggle="tooltip"><span><i
                                    class="fas fa-reply"></i></span></a>
                    </div>
                    {#
                    {% if master.checkPermission('sync', 'lock','1') AND syncId AND type != 'lock' %}
                    <div class="float-right">
                        <button id="lockSync" type="button" class="btn btn-hnn btn-hnn-warning mr-2"
                            title="Khóa thông tin" data-toggle="tooltip"
                            data-href="<?= WEB_ADMIN_URI.'/sync/lock/'.$syncId ?>"
                            data-id="{{syncId}}"><span>Khóa</span></button>
                    </div>
                    {% endif %}
                    {% if type != 'lock' AND ((perAdd AND !syncId) OR perEdit) %}
                    <div class="float-right">
                        <button type="submit" class="btn btn-hnn btn-hnn-success mr-2" title="Lưu thông tin"
                            data-toggle="tooltip"><span>Lưu</span></button>
                    </div>
                    {% endif %}
                    #}
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="col-md-12" id="blockSession">
            <?php echo $this->flashSession->output(); ?>
        </div>
    </div>

    <section class="content">
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Thông tin</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-4 label-floating">
                                <div class="input-group">
                                    <label class="control-label">{{form.getLabel('year')}}</label>
                                    {{form.render('year',['disabled' : true])}}
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-4 label-floating">
                                <div class="input-group">
                                    <label class="control-label">{{form.getLabel('typeid')}}</label>
                                    {{form.render('typeid',['disabled' : true])}}
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group col-md-4 label-floating">
                                <div class="input-group">
                                    <label class="control-label">{{form.getLabel('deptid')}}</label>
                                    {{form.render('deptid', ['disabled' : true])}}
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div>
                        </div>
                        <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}"
                            value="{{security.getToken()}}" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>

<div class="content-header pt-0">
    <div class="container-fluid">
        <div class="row">
            <h4 class="detail-title col-auto">Danh sách Tài sản</h4>
            <div class="col-md-6">
                {% if type != 'lock' %}
                {% if master.checkPermission('sync', 'delete') %}
                <span title="" data-toggle="tooltip" class="float-right">
                    <a data-href="<?= WEB_ADMIN_URL ?>/sync/deletedetail/{{syncId}}"
                        class="btn btn-hnn btn-hnn-danger float-right ml-2" id="deleteSyncDetail"><span
                            title="Xóa chi tiết" data-toggle="tooltip">Xóa</span></a>
                </span>
                {% endif %}
                {% if perAdd AND 0 %}
                <span title="" data-toggle="tooltip" class="float-right">
                    <a data-href="<?= WEB_ADMIN_URL ?>/sync/updatedetail"
                        class="btn btn-hnn btn-hnn-success float-right" id="addSyncDetail"><span
                            title="Thêm chi tiết" data-toggle="tooltip">Thêm</span></a>
                </span>
                {% endif %}
                {% endif %}
            </div>
        </div>
    </div>
</div>

<section class="content">
    <div class="container-fluid">
        <div class="col-md-12">
            <div class="card card-primary card-outline">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="" id="searchSyncDetail" class="searchForm">
                                <div class="row d-md-flex align-items-md-center">
                                    <span class="col-auto mt-2">Tìm kiếm</span>
                                    <div class="flex-1 col-auto row pr-0">
                                        <div class="col-md-12 row pr-0">
                                            {% for key,ffilter in fFilters %}
                                            <div class="form-group label-floating flex-1 col-auto">
                                                <div class="input-group">
                                                    <label
                                                        class="control-label">{{formSDetail.getLabel(ffilter~'Search')}}</label>
                                                    {{ formSDetail.render(ffilter~'Search',['value': request.get(ffilter~'Search'),'id': null]) }}
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
                                        <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info"
                                            type="submit"><span>Tìm</span></button>
                                    </div>
                                    {{ formSDetail.render('paged',['value': request.get('paged')]) }}
                                </div>
                            </form>
                            <div class="table-responsive">
                                <table data-id="{{syncId}}" id="syncdetail"
                                    class="table table-bordered table-hover rounded border">
                                    <thead>
                                        <tr>
                                            <th data-col="no" class="align-middle text-center" style="width: 20px;">
                                                <input id="syncDetailCheckboxAll" type="checkbox" value="1"></th>
                                            <th data-col="no" class="align-middle text-center" style="width: 30px;">STT
                                            </th>
                                            {% for key,table in fTables %}
                                            <th data-col="{{table}}"
                                                class="align-middle text-center">
                                                <?= \Asset::filedName($table) ?></th>
                                            {% endfor %}
                                            <th data-col="no" class="align-middle text-center">Thao tác</th>
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
    </div>
</section>

{% if syncId AND type != 'lock' %}
<div class="modal fade" id="modalSyncDetail">
    <div class="modal-dialog" style="max-width: 1350px; width: 98%;">
        <div class="modal-content">
            <form data-type="{{type}}" action="" id="frmSyncDetail" method="post" enctype="multipart/form-data"
                data-toggle="validator" novalidate="true">
                <div class="modal-header">
                    <h4 class="modal-title">Cập nhật chi tiết tài sản</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('aunumber')}}</label>
                                {{formDetail.render('aunumber')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('audate')}}</label>
                                {{formDetail.render('audate')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('name')}}</label>
                                {{formDetail.render('name')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('usedyear')}}</label>
                                {{formDetail.render('usedyear')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group label-floating col-md-12">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('specifications')}}</label>
                                {{formDetail.render('specifications')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('madeid')}}</label>
                                {{formDetail.render('madeid')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('code')}}</label>
                                {{formDetail.render('code')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('costs')}}</label>
                                {{formDetail.render('costs')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('accumulated')}}</label>
                                {{formDetail.render('accumulated')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('disfactor')}}</label>
                                {{formDetail.render('disfactor')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('discosts')}}</label>
                                {{formDetail.render('discosts')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('defactor')}}</label>
                                {{formDetail.render('defactor')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('decosts')}}</label>
                                {{formDetail.render('decosts')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('renumber')}}</label>
                                {{formDetail.render('renumber')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('redate')}}</label>
                                {{formDetail.render('redate')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('rereason')}}</label>
                                {{formDetail.render('rereason')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-md-3">
                            <div class="input-group">
                                <label class="control-label">{{formDetail.getLabel('restcosts')}}</label>
                                {{formDetail.render('restcosts')}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="syncid" value="{{syncId}}">
                    <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}"
                        value="{{security.getToken()}}" />
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-hnn btn-hnn-default"
                        data-dismiss="modal"><span>Đóng</span></button>
                    <button type="submit" class="btn btn-hnn btn-hnn-info" id="btnSyncDetail"><span>Cập
                            nhật</span></button>
                </div>
            </form>
        </div>
    </div>
</div>
{% endif %}

{{ partial('galleryview') }}