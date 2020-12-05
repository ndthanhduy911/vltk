<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
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
            <div class="col-md-6">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Menu Đầu trang</h3>
                        <div class="card-tools">
                            <a id="addHeadMenu" data-href="<?= WEB_ADMIN_URL ?>/meuns/add/{{headId}}" class="btn btn-sm btn-hnn btn-hnn-success"><span><i class="fas fa-plus"></i></span></a>
                        </div>
                    </div>
                    <div class="card-body bg-eee">
                        <div class="table-responsive">
                            <table id="headMenus" class="table bg-white table-bordered table-hover rounded" locationid="{{headId}}">
                                <thead>
                                    <tr>
                                        <th data-col="name" class="align-middle">Tiêu đề</th>
                                        <th data-col="status" class="align-middle text-center">Trạng thái</th>
                                        <th data-col="id" class="align-middle text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Menu Cuối trang</h3>
                        <div class="card-tools">
                            <a id="addFootMenu" data-href="<?= WEB_ADMIN_URL ?>/meuns/add/{{footId}}" class="btn btn-sm btn-hnn btn-hnn-success"><span><i class="fas fa-plus"></i></span></a>
                        </div>
                    </div>
                    <div class="card-body bg-eee">
                        <div class="table-responsive">
                            <table id="footMenus" class="table bg-white table-bordered table-hover rounded" locationid="{{footId}}">
                                <thead>
                                    <tr>
                                        <th data-col="no" class="align-middle text-center">Tiêu đề</th>
                                        <th data-col="no" class="align-middle text-center">Trạng thái</th>
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
</section>

<div class="modal fade" id="modalMenus">
    <div class="modal-dialog" style="max-width: 1350px; width: 98%;">
        <div class="modal-content">
            {{form('method':'post','id':'frmMenus','enctype':'multipart/form-data','data-toggle':'validator','role':'form', 'action':'', 'class':'customForm')}}
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body bg-eee">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs w-100">
                                    {% for key, lang in languages %}
                                    <li class="nav-item">
                                        <a class="nav-link {{ !key ? 'active' : '' }}" href="#lang{{lang.id}}" data-toggle="tab" data-tab="{{lang.id}}">
                                            {{lang.name}}
                                        </a>
                                    </li>
                                    {% endfor %}
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content">
                                    {% for key, lang in languages %}
                                    <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="lang{{lang.id}}">
                                        <div class="form-group label-floating">
                                            <div class="input-group">
                                                <label class="control-label">{{formMenus.getLabel('name')}}</label>
                                                {{formMenus.render('name',['name':'name'~lang.id])}}
                                                <div class="invalid-feedback"></div>
                                            </div>
                                        </div>
                                    </div>
                                    {% endfor  %}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-primary card-outline">
                            <div class="card-body">
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('parentid')}}</label>
                                        {{formMenus.render('parentid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('type')}}</label>
                                        {{formMenus.render('type')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating hidden">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('postid')}}</label>
                                        {{formMenus.render('postid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating hidden">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('pageid')}}</label>
                                        {{formMenus.render('pageid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating hidden">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('catid')}}</label>
                                        {{formMenus.render('catid')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating hidden">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('dept')}}</label>
                                        {{formMenus.render('dept')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating hidden">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('links')}}</label>
                                        {{formMenus.render('links')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-primary card-outline">
                            <div class="card-body">
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('status')}}</label>
                                        {{formMenus.render('status')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('icon')}}</label>
                                        {{formMenus.render('icon')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('target')}}</label>
                                        {{formMenus.render('target')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{formMenus.getLabel('sort')}}</label>
                                        {{formMenus.render('sort')}}
                                        <div class="invalid-feedback"></div>
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
                <button type="submit" class="btn btn-hnn btn-hnn-info btnSummitMenus"><span>Thêm mới</span></button>
            </div>
            {{end_form()}}
        </div>
    </div>
</div>